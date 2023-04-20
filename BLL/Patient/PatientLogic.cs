using DAL;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class PatientLogic
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
                    oldUser.Disability = user.Disability;
                    oldUser.DisabilityDescription = user.DisabilityDescription;
                    if (!string.IsNullOrEmpty(user.ProofOfResidence))
                    {
                        oldUser.ProofOfResidence = user.ProofOfResidence;
                    }
                    oldUser.ConfirmPassword = user.ConfirmPassword;


                    db.SaveChanges();
                    message = "Success: Patient's info has been updated successfully.";
                }
                else
                {
                    message = "Error: Patient does not exists.";
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

        public List<DropDown> GetPatients()
        {
            return db.GetPatients().Select(s => new DropDown() { ID = s.Id, Name = s.Name }).ToList();
        }

        public List<AutoComplete> GetPatientByUserName(string userName)
        {
            return db.GetPatientByUserName(userName).Select(s => new AutoComplete() { Name = s.Name, Id = s.Id, Code = s.UserName }).ToList();
        }

        public List<AutoComplete> GetPatientByName(string name)
        {
            return db.GetPatientByName(name).Select(s => new AutoComplete() { Name = s.Name, Id = s.Id, Code = s.UserName }).ToList();
        }

        public List<FetchPatientMedicalHistory_Result> GetPatientMedicalHistory(int patientId)
        {
            return db.FetchPatientMedicalHistory(patientId).ToList();
        }

        public List<GetPatientMedicineHistory_Result> GetPatientMedicineHistory(int patientId)
        {
            return db.GetPatientMedicineHistory(patientId).ToList();
        }

        public CallBackData FetchMedicines(Paging paging)
        {
            CallBackData callBackData = new CallBackData();
            try
            {
                CommonFilters filters = paging.SearchJson.Deserialize<CommonFilters>();
                List<FetchMedicines_Result> listData = db.FetchMedicines(paging.DisplayLength, paging.DisplayStart, paging.SortColumn, paging.SortOrder, filters.Search).ToList();
                callBackData = listData.ToDataTable(paging);
            }
            catch (Exception ex)
            {
                callBackData.msg.Success = false;
                callBackData.msg.MessageDetail = Message.ErrorMessage;
            }
            return callBackData;
        }
    }
}
