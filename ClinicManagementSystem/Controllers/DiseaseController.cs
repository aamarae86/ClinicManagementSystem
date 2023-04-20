using BLL;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ClinicManagementSystem.Controllers
{
    [Authorize]
    public class DiseaseController : Controller
    {
        // GET: Disease
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult Fetch()
        {
            CallBackData callBackData = (new DiseaseLogic()).Fetch(Request.FetchPaging());
            return Json(callBackData, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Create(int? id)
        {
            Disease model = new Disease();
            if (id.HasValue)
            {
                model = new DiseaseLogic().GetByID(id.Value);
            }
            return PartialView("_Disease", model);
        }

        [HttpPost]
        public ActionResult CreateDisease(Disease model)
        {
            TempData["Message"] = new DiseaseLogic().SaveUpdate(model);
            return Redirect("/Disease/Index");
        }
    }
}