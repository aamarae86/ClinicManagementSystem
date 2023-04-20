using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAL;
using BLL;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using TravelPermit.Models;

namespace TravelPermit.Controllers
{
    [Authorize]
    public class UserController : Controller
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
        // GET: User
        [Authorize(Roles = "Admin")]
        public ActionResult Index()
        {
            return View();
        }


        [HttpGet]
        public ActionResult UserProfile(bool? ShowProfile, string msg, int? userId)
        {

            Boolean IsChangePass = Convert.ToBoolean(TempData["IsSuccessfullypasswordChanged"]);
            if (IsChangePass == true)
            {
                TempData["IspasswordChanged"] = "Password has been Changed Successfully";
            }
            if (!User.IsInRole("Admin"))
            {
                userId = null;
            }
            AspNetUser aspNetUser = new UserLogic().FetchUserProfile(ShowProfile, msg, userId);
            return View(aspNetUser);
        }


        [HttpPost]
        public ActionResult UserProfile(AspNetUser model)
        {
            if (User.Identity.GetUserId<int>() == model.Id)
            {
                model.IsActive = true;
            }
            string msg = new UserLogic().UpdateProfile(model, Request.Files);
            if (User.IsInRole("Admin") && model.Id != User.Identity.GetUserId<int>())
            {
                return RedirectToAction("index", "User");
            }
            else
            {
                return RedirectToAction("UserProfile", new { ShowProfile = true, msg });
            }


        }

        [Authorize(Roles = "Admin")]
        public JsonResult Fetch()
        {

            CallBackData callBackData = new CallBackData(); //(new UserLogic()).Fetch(Request.FetchPaging());
            return Json(callBackData, JsonRequestBehavior.AllowGet);
        }

        [Authorize(Roles = "Admin")]
        public ActionResult UserSetup()
        {
            return View();
        }
        [Authorize(Roles = "Admin")]
        public JsonResult RegisterUser(RegisterViewModel model)
        {
            model.RoleId = 2;
            Message msg = new Message();
            msg.Action = "Save";
            if (ModelState.IsValid)
            {
                var user = new ApplicationUser { UserName = model.Username, Email = model.Email, Address = model.Address, FirstName = model.FirstName, LastName = model.LastName, CreatedTime = DateTime.Now, UpdatedTime = DateTime.Now, IsActive = model.IsActive, PhoneNumber = model.PhoneNumber };
                var result = UserManager.Create(user, model.Password);
                if (result.Succeeded)
                {
                    var foundUserRole = db.AspNetRoles.AsNoTracking().FirstOrDefault(u => u.Id == model.RoleId);
                    UserManager.AddToRole(user.Id, foundUserRole.Name);
                    msg.MessageDetail = "New user has been saved successfully";
                    string profileName = user.FirstName + " " + (String.IsNullOrEmpty(user.LastName) ? string.Empty : user.LastName);
                    (new GenericModel()).FetchUserProfile().activityLog(foundUserRole.Name + " creation", "<b>Profile of '" + profileName + "'</b> has been created", user.Id, "AspNetUser");
                    return Json(msg, JsonRequestBehavior.AllowGet);
                }
                msg.Success = false;
                foreach (var error in result.Errors)
                {
                    msg.MessageDetail += error + "\n";
                }
                (new GenericModel()).FetchUserProfile().activityLog(db.AspNetRoles.AsNoTracking().FirstOrDefault(u => u.Id == model.RoleId).Name + " creation", "<b>Profile creation</b> has been failed", 0, "AspNetUser");
                return Json(msg, JsonRequestBehavior.AllowGet);
            }
            else
            {
                string errorstring = string.Empty;
                foreach (ModelState modelState in ViewData.ModelState.Values)
                {
                    foreach (ModelError error in modelState.Errors)
                    {
                        errorstring += error.ErrorMessage + "\n";
                    }
                }
                msg.Success = false;
                msg.MessageDetail = errorstring;
                return Json(msg, JsonRequestBehavior.AllowGet);
            }
        }

    }
}