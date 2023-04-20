﻿using DAL;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BLL
{
    public class UserLogic
    {
        ClinicManagementSystemEntities db = new ClinicManagementSystemEntities();

        public AspNetUser FetchUserProfile(bool? ShowProfile, string msg, int? userId)
        {
            int CurrentUserId = 0;
            if (userId != null)
            {
                CurrentUserId = userId.Value;
            }
            else
            {
                CurrentUserId = Convert.ToInt32(HttpContext.Current.User.Identity.GetUserId());
            }
            AspNetUser CurrentUserProfile = db.AspNetUsers.Where(x => x.Id == CurrentUserId).FirstOrDefault();

            try
            {
                if (CurrentUserProfile != null)
                {
                    //if (ShowProfile == true)
                    //{
                    //    CurrentUserProfile.IsShowProfile = true;
                    //}
                    //if (msg != "")
                    //{
                    //    CurrentUserProfile.msg = msg;
                    //}
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            return CurrentUserProfile;
        }


        public string UpdateProfile(AspNetUser model, HttpFileCollectionBase files)
        {
            string msg = string.Empty;
            AspNetUser user = db.AspNetUsers.FirstOrDefault(s => s.Id == model.Id);
            try
            {
                if (files.Count != 0)
                {
                    HttpPostedFileBase postedFile = files[0];
                    string extension = Path.GetExtension(postedFile.FileName).ToLower();
                    string image = ".png,.jpg,.jpeg";
                    if (extension != string.Empty)
                    {
                        if (image.Contains(extension))
                        {
                            string path = HttpContext.Current.Server.MapPath("~/Assets/images/ProfilePicture");
                            if (!String.IsNullOrEmpty(model.Photo))
                            {
                                if (System.IO.File.Exists(path + "/" + model.Photo))
                                {
                                    System.IO.File.Delete(path + "/" + model.Photo);
                                }
                            }
                            model.Photo = model.Id + "_" + path.FetchUniquePath(postedFile.FileName);
                            postedFile.SaveAs(path + "/" + model.Photo);
                        }
                    }
                    if (model.Id != 0)
                    {
                        user.FirstName = model.FirstName;
                        user.LastName = model.LastName;
                        user.PhoneNumber = model.PhoneNumber;
                        user.Address = model.Address;
                        if (model.Photo != null)
                        {
                            user.Photo = model.Photo;
                        }
                        user.IsActive = model.IsActive;
                        msg = "(" + user.Name + ") Profile has been Updated Successfully";
                        db.Entry(user).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                //msg.Success = false;
                //msg.MessageDetail = Message.ErrorMessage;
                msg = "Error:" + ex;

            }
            return msg;
        }

        public AspNetUser GetById(int id)
        {
            return db.AspNetUsers.Where(s => s.Id == id).FirstOrDefault();
        }
        //public CallBackData Fetch(Paging paging)
        //{
        //    CallBackData callBackData = new CallBackData();
        //    try
        //    {
        //        CommonFilters filters = paging.SearchJson.Deserialize<CommonFilters>();
        //        List<FetchUser_Result> listData = db.FetchUser(paging.DisplayLength, paging.DisplayStart, paging.SortColumn, paging.SortOrder, filters.Search, filters.Active).ToList();
        //        callBackData = listData.ToDataTable(paging);
        //    }
        //    catch (Exception ex)
        //    {
        //        callBackData.msg.Success = false;
        //        callBackData.msg.MessageDetail = Message.ErrorMessage;
        //    }

        //    return callBackData;

        //}

    }
}
