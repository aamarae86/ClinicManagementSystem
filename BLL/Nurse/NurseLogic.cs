using DAL;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace BLL
{
    public class NurseLogic
    {
        ClinicManagementSystemEntities db = new ClinicManagementSystemEntities();

        public CallBackData Fetch(Paging paging,string role)
        {
            CallBackData callBackData = new CallBackData();
            try
            {
                CommonFilters filters = paging.SearchJson.Deserialize<CommonFilters>();
                List<FetchDoctors_Result> listData = db.FetchDoctors(paging.DisplayLength, paging.DisplayStart, paging.SortColumn, paging.SortOrder,filters.Search, filters.Status,role).ToList();
                callBackData = listData.ToDataTable(paging);
            }
            catch (Exception ex)
            {
                callBackData.msg.Success = false;
                callBackData.msg.MessageDetail = Message.ErrorMessage;
            }
            return callBackData;
        }

        public AspNetUser GetByID(int id)
        {
            return db.AspNetUsers.Where(s => s.Id == id).FirstOrDefault();
        }

        public string SaveUpdate(AspNetUser user)
        {
            string message = string.Empty;
            try
            {
                AspNetUser oldUser = db.AspNetUsers.Where(s => s.Id == user.Id).FirstOrDefault();
                if (oldUser != null)
                {
                    oldUser.FirstName = user.FirstName;
                    oldUser.LastName = user.LastName;
                    oldUser.IsActive = user.IsActive;
                    oldUser.ClinicStartTime = user.ClinicStartTime;
                    oldUser.ClinicEndTime = user.ClinicEndTime;
                    oldUser.DateOfBirth = user.DateOfBirth;
                    oldUser.Experience = user.Experience;
                    oldUser.Gender = user.Gender;
                    oldUser.Address = user.Address;
                    if (!string.IsNullOrEmpty(user.Photo))
                    {
                        oldUser.Photo = user.Photo;
                    }
                    oldUser.Qualification = user.Qualification;
                    oldUser.Password = user.Password;
                    oldUser.ConfirmPassword = user.ConfirmPassword;
                    

                    db.SaveChanges();
                    message = "Success: Nurse's info has been updated successfully.";
                }
                else
                {
                    message = "Error: Nurse does not exists.";
                }
            }
            catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                throw;
            }
            catch (Exception ex)
            {
                message = ex.Message;
            }
            return message;
        }

        public List<DropDown> GetNursesList()
        {
            return db.FetchNurseList().Select(s => new DropDown() { ID = s.Id, Name = s.Name }).ToList();
        }
    }
}
