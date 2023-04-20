using BLL;
using DAL;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Proxies;
using System.Web;
using System.Web.Mvc;
using System.Web.WebSockets;
using TravelPermit;
using TravelPermit.Models;

namespace ClinicManagementSystem.Controllers
{
    [Authorize]
    public class BookingController : Controller
    {
        public ClinicManagementSystemEntities db = new ClinicManagementSystemEntities();
        private ApplicationUserManager _userManager;
        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult Fetch()
        {
            int userID = Convert.ToInt32(User.Identity.GetUserId());
            List<string> roles = UserManager.GetRoles(userID).ToList();
            CallBackData callBackData = (new BookingLogic()).Fetch(Request.FetchPaging(), roles[0], Server.MapPath("~/Assets/images/ProfilePicture"), userID);
            return Json(callBackData, JsonRequestBehavior.AllowGet);
        }

        [Authorize(Roles = "Admin,Receptionist,Patient")]
        public ActionResult Create(int? id)
        {
            Booking model = new Booking();
            model.lstDoctor = new List<DropDown>();
            model.lstNurse = new List<DropDown>();
            model.lstStatus = new List<DropDown>();
            if (id.HasValue)
            {
                model = new BookingLogic().GetByID(id.Value);
                var user = new UserLogic().GetById(model.PatientId.Value);
                model.PatientName = string.Format("{0} {1}", user.FirstName, user.LastName);
                model.PatientUserName = user.UserName;
                model.lstDoctor = new DoctorLogic().GetDoctorsList();
                model.lstNurse = new NurseLogic().GetNursesList();
                model.lstStatus = new Generic().FetchStatus();
            }
            else
            {
                if (User.IsInRole("Patient"))
                {
                    var user = new UserLogic().GetById(Convert.ToInt32(User.Identity.GetUserId()));
                    model.PatientName = string.Format("{0} {1}", user.FirstName, user.LastName);
                    model.PatientUserName = user.UserName;
                    model.PatientId = user.Id;
                }
            }
            model.lstDisease = new DiseaseLogic().GetDiseases();
            return View(model);
        }


        [HttpPost]
        public ActionResult Create(Booking model)
        {

            if (ModelState.IsValid)
            {
                model.UpdatedBy = Convert.ToInt32(User.Identity.GetUserId());
                TempData["Message"] = new BookingLogic().AddUpdateBooking(model);
                return Redirect("/Booking/Index");
            }
            else
            {
                return View(model);
            }
        }

        public JsonResult GetPatientByName(string prefix)
        {
            List<AutoComplete> lstItems = new PatientLogic().GetPatientByName(prefix);
            return Json(lstItems, JsonRequestBehavior.AllowGet);

        }

        public JsonResult GetPatientByUserName(string prefix)
        {
            List<AutoComplete> lstItems = new PatientLogic().GetPatientByUserName(prefix);
            return Json(lstItems, JsonRequestBehavior.AllowGet);

        }

        [Authorize(Roles = "Doctor Assistance/Nurse,Doctor")]
        public ActionResult BookingDetail(int? id)
        {
            PatientMedicalHistory model = new PatientMedicalHistory();
            if (id.HasValue)
            {
                model = new BookingLogic().GetBookingDetailByID(id.Value);

            }
            model.lstDoctors = new DoctorLogic().GetDoctorsList();
            return View(model);
        }

        [HttpPost]
        public ActionResult BookingDetail(PatientMedicalHistory model)
        {
            TempData["Message"] = new BookingLogic().AddUpdateBookingDetail(model);
            return Redirect("/Booking/Index");
        }

        [HttpPost]
        public int UploadReports()
        {
            string allowedFormats = ".jpg,.jpeg,.png,.pdf";
            HttpFileCollectionBase files = Request.Files;
            MedicalReport report;
            int reportID = -1;
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFileBase file = files[i];
                if (file != null)
                {
                    var desc = Request.Form[file.FileName + "s"];
                    var medHistory = Request.Form[file.FileName + "id"];
                    string extension = Path.GetExtension(file.FileName);
                    if (allowedFormats.Contains(extension))
                    {
                        report = new MedicalReport();
                        report.DoctorId = Convert.ToInt32(User.Identity.GetUserId());
                        report.HistoryId = Convert.ToInt32(medHistory);
                        report.ReportDescription = desc;
                        report.UpdatedDate = DateTime.Now;
                        report.OriginalReportName = Path.GetFileNameWithoutExtension(file.FileName);
                        report.TestReportName = string.Format("{0:MMddyyhhmmss}{1}", DateTime.Now, extension);
                        var ServerSavePath = Path.Combine(Server.MapPath("~/Assets/images/Reports/") + report.TestReportName);
                        //Save file to server folder  
                        reportID = new BookingLogic().SaveMedicalReport(report);
                        file.SaveAs(ServerSavePath);
                    }
                }
            }
            return reportID;
        }

        [HttpPost]
        public void DeleteReport(int reportID)
        {
            new BookingLogic().DeleteReport(reportID);
        }

        [HttpPost]
        public ActionResult MedicalHistory(int? id)
        {
            var model = new PatientLogic().GetPatientMedicalHistory(id.Value);
            return PartialView("_PatientMedicalHistory", model);
        }
    }
}