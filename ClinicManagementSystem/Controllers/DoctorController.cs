using BLL;
using DAL;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TravelPermit;
using TravelPermit.Models;

namespace ClinicManagementSystem.Controllers
{
    [Authorize]
    public class DoctorController : Controller
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
        // GET: Doctor
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult Fetch()
        {
            CallBackData callBackData = (new DoctorLogic()).Fetch(Request.FetchPaging(), "Doctor", Server.MapPath("~/Assets/images/ProfilePicture"));
            return Json(callBackData, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DoctorView(int? id)
        {
            AspNetUser model = new AspNetUser();
            List<DropDown> lstGender = new List<DropDown>();
            lstGender.Add(new DropDown() { ID = 1, Name = "Male" });
            lstGender.Add(new DropDown() { ID = 2, Name = "Female" });
            if (id.HasValue)
            {
                model = new UserLogic().GetById(id.Value);
                if (string.IsNullOrEmpty(model.Photo) || string.IsNullOrWhiteSpace(model.Photo))
                {
                    model.Photo = "DefaultImage.jpg";
                }
                model.ConfirmPassword = model.PasswordHash;
                model.Password = model.PasswordHash;
            }
            else
            {
                model.Photo = "DefaultImage.jpg";
            }
            model.lstSpecialization = new SpecializationLogic().GetSpecialization();
            model.lstGender = lstGender;
            return View(model);

        }
        public ActionResult Create(int? id)
        {
            AspNetUser model = new AspNetUser();
            List<DropDown> lstGender = new List<DropDown>();
            lstGender.Add(new DropDown() { ID = 1, Name = "Male" });
            lstGender.Add(new DropDown() { ID = 2, Name = "Female" });
            if (id.HasValue)
            {
                model = new UserLogic().GetById(id.Value);
                if (string.IsNullOrEmpty(model.Photo) || string.IsNullOrWhiteSpace(model.Photo))
                {
                    model.Photo = "DefaultImage.jpg";
                }
                model.ConfirmPassword = model.PasswordHash;
                model.Password = model.PasswordHash;
            }
            else
            {
                model.Photo = "DefaultImage.jpg";
            }
            model.lstSpecialization = new SpecializationLogic().GetSpecialization();
            model.lstGender = lstGender;
            return View(model);
        }

        [Authorize(Roles = "Admin")]
        [HttpPost]
        public ActionResult Create(AspNetUser model)
        {
            List<DropDown> lstGender = new List<DropDown>();
            lstGender.Add(new DropDown() { ID = 1, Name = "Male" });
            lstGender.Add(new DropDown() { ID = 2, Name = "Female" });
            model.lstSpecialization = new SpecializationLogic().GetSpecialization();
            model.lstGender = lstGender;
            if (ModelState.IsValid)
            {
                if (model.ProfilePicture != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(model.ProfilePicture.FileName);
                    string extension = Path.GetExtension(model.ProfilePicture.FileName);
                    if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg")
                    {
                        fileName = fileName + DateTime.Now.ToString("yymmssff") + extension;
                        model.Photo = fileName;
                        model.ProfilePicture.SaveAs(Path.Combine(Server.MapPath("~/Assets/images/ProfilePicture"), fileName));
                    }
                    else
                    {
                        ModelState.AddModelError("", "Only png,jpg and jpeg formats are allowed.");
                        return View(model);
                    }

                }
                if (model.Id > 0)
                {
                    TempData["Message"] = new DoctorLogic().SaveUpdate(model);
                    return Redirect("/Doctor/Index");
                }
                else
                {
                    var user = new ApplicationUser { UserName = model.UserName, Email = model.Email, Address = model.Address, FirstName = model.FirstName, LastName = model.LastName, CreatedTime = DateTime.Now, UpdatedTime = DateTime.Now, IsActive = model.IsActive, PhoneNumber = model.PhoneNumber, ClinicStartTime = model.ClinicStartTime, ClinicEndTime = model.ClinicEndTime, Gender = model.Gender, Qualification = model.Qualification, Experience = model.Experience, SpecializationId = model.SpecializationId, DateOfBirth = model.DateOfBirth, Photo = model.Photo };
                    var result = UserManager.Create(user, model.Password);
                    if (result.Succeeded)
                    {
                        UserManager.AddToRole(user.Id, "Doctor");
                        TempData["Message"] = "Success : Doctor has been added successfully";
                        string profileName = user.FirstName + " " + (String.IsNullOrEmpty(user.LastName) ? string.Empty : user.LastName);
                        (new GenericModel()).FetchUserProfile().activityLog("Doctor creation", "<b>Profile of '" + profileName + "'</b> has been created", user.Id, "AspNetUser");
                        return Redirect("/Doctor/Index");
                    }

                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError("", error);
                    }
                    (new GenericModel()).FetchUserProfile().activityLog("Doctor creation", "<b>Profile creation</b> has been failed", 0, "AspNetUser");
                    return View(model);
                }

            }
            else
            {
                return View(model);
            }
        }
    }
}