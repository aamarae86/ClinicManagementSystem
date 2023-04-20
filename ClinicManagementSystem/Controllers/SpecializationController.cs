using BLL;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;

namespace ClinicManagementSystem.Controllers
{
    [Authorize]
    public class SpecializationController : Controller
    {
        // GET: Specialization
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult Fetch()
        {
            CallBackData callBackData = (new SpecializationLogic()).Fetch(Request.FetchPaging());
            return Json(callBackData, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Create(int? id)
        {
            Specialization model = new Specialization();
            if (id.HasValue)
            {
                model = new SpecializationLogic().GetByID(id.Value);
            }
            return PartialView("_Specialization", model);
        }

        [HttpPost]
        public ActionResult CreateSpecialization(Specialization model)
        {
            TempData["Message"] = new SpecializationLogic().SaveUpdate(model);
            return Redirect("/Specialization/Index");
        }
    }
}