using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.Identity;
using System.IO;

namespace BLL
{
    public class Generic
    {
        public ClinicManagementSystemEntities db = new ClinicManagementSystemEntities();
        public ReturnData FetchCategories()
        {
            ReturnData returnData = new ReturnData();
            try
            {
                //db.Configuration.ProxyCreationEnabled = false;
                //returnData.Data = db.Categories.AsNoTracking().Where(x => x.IsActive == true).ToList();
            }
        
            catch (Exception ex)
            {
                returnData.msg.Success = false;
                returnData.msg.MessageDetail = Message.ErrorMessage;
            }

            return returnData;
        }
        public ReturnData FetchProducts()
        {
            ReturnData returnData = new ReturnData();
            try
            {
                //db.Configuration.ProxyCreationEnabled = false;
                //returnData.Data = db.AspNetUsers.AsNoTracking().Where(x => x.IsActive == true).ToList();
            }
            catch (Exception ex)
            {
                returnData.msg.Success = false;
                returnData.msg.MessageDetail = Message.ErrorMessage;
            }

            return returnData;
        }

        public List<DropDown> FetchStatus()
        {
            List<DropDown> lstStatus = new List<DropDown>();
            lstStatus.Add(new DropDown() { ID = 1, Name = "Pending" });
            lstStatus.Add(new DropDown() { ID = 2, Name = "Approved" });
            lstStatus.Add(new DropDown() { ID = 3, Name = "Rejected" });
            return lstStatus;
        }


        //public ReturnData FetchCategoriesAndProducts()
        //{
        //    ReturnData returnData = new ReturnData();
        //    try
        //    {
        //        var lstReturn = new
        //        {
        //            lstProducts = FetchProducts(),
        //            lstCategories = FetchCategories()
        //        };
        //        returnData.Data = lstReturn;
        //    }
        //    catch (Exception ex)
        //    {
        //        returnData.msg.Success = false;
        //        returnData.msg.MessageDetail = Message.ErrorMessage;
        //    }

        //    return returnData;
        //}
        public ReturnData FetchUserByRoleName(string roleName)
        {
            ReturnData returnData = new ReturnData();
            try
            {
                //db.Configuration.ProxyCreationEnabled = false;
                ////int roleID = db.AspNetRoles.FirstOrDefault(r=>r.Name == roleName).Id;
                //returnData.Data = db.AspNetUsers.AsNoTracking().Where(u => u.AspNetRole.Name == roleName).ToList();
            }
            catch (Exception ex)
            {
                returnData.msg.Success = false;
                returnData.msg.MessageDetail = Message.ErrorMessage;
            }

            return returnData;

        }


        public ReturnData FetchActiveUserByRoleName(string roleName)
        {
            ReturnData returnData = new ReturnData();
            try
            {
                //db.Configuration.ProxyCreationEnabled = false;
                ////int roleID = db.AspNetRoles.FirstOrDefault(r=>r.Name == roleName).Id;
                //returnData.Data = db.AspNetUsers.Where(u => u.AspNetRole.Name == roleName && (u.IsActive==true)).ToList();
            }
            catch (Exception ex)
            {
                returnData.msg.Success = false;
                returnData.msg.MessageDetail = Message.ErrorMessage;
            }

            return returnData;

        }
        
        public ReturnData FetchActions(bool isRequester, bool isBuyer, bool isVendor)
        {
            ReturnData returnData = new ReturnData();
            try
            {
                //db.Configuration.ProxyCreationEnabled = false;
                //if (isRequester)
                //{
                //    returnData.Data = db.OrderRequestActions.AsNoTracking().Where(a => a.ID != 1 && a.ID != 2 && a.ID != 3).ToList();
                //}
                //else if (isBuyer)
                //{
                //    returnData.Data = db.OrderRequestActions.AsNoTracking().Where(a => a.ID != 1 && a.ID !=2 && a.ID != 5).ToList();
                //}
                //else if (isVendor)
                //{
                //    returnData.Data = db.OrderRequestActions.AsNoTracking().Where(a => a.ID != 3 && a.ID != 5).ToList();
                //}
                //else
                //{
                //    returnData.Data = db.OrderRequestActions.AsNoTracking().ToList();

                //}
            }
            catch (Exception ex)
            {
                returnData.msg.Success = false;
                returnData.msg.MessageDetail = Message.ErrorMessage;
            }

            return returnData;

        }

    }
}
