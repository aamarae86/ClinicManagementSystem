using DAL;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ReceptionistLogic
    {
        ClinicManagementSystemEntities db = new ClinicManagementSystemEntities();
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
                    message = "Success: Receptionist's info has been updated successfully.";
                }
                else
                {
                    message = "Error: Receptionist does not exists.";
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
    }
}
