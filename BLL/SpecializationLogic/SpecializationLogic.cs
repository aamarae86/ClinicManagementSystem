using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using System.Threading.Tasks;

namespace BLL
{
    public class SpecializationLogic
    {
        ClinicManagementSystemEntities db = new ClinicManagementSystemEntities();

        public CallBackData Fetch(Paging paging)
        {
            CallBackData callBackData = new CallBackData();
            try
            {
                CommonFilters filters = paging.SearchJson.Deserialize<CommonFilters>();
                List<FetchSpecializations_Result> listData = db.FetchSpecializations(paging.DisplayLength, paging.DisplayStart, paging.SortColumn, paging.SortOrder, filters.Status).ToList();
                callBackData = listData.ToDataTable(paging);
            }
            catch (Exception ex)
            {
                callBackData.msg.Success = false;
                callBackData.msg.MessageDetail = Message.ErrorMessage;
            }
            return callBackData;
        }

        public Specialization GetByID(int id)
        {
            return db.Specializations.Where(s => s.Id == id).FirstOrDefault();
        }

        public string SaveUpdate(Specialization specialization)
        {
            string message = string.Empty;
            try
            {
                Specialization oldSpec = db.Specializations.Where(s => s.Id == specialization.Id).FirstOrDefault();
                if (oldSpec != null)
                {
                    oldSpec.Specialization1 = specialization.Specialization1;
                    oldSpec.IsActive = specialization.IsActive;
                    db.SaveChanges();
                    message = "Success: Specialization has been updated successfully.";
                }
                else
                {
                    db.Specializations.Add(specialization);
                    db.SaveChanges();
                    message = "Success: Specialization has been added successfully.";
                }
            }
            catch (Exception ex)
            {
                message = ex.Message;
            }
            return message;
        }

        public List<DropDown> GetSpecialization()
        {
            return db.Specializations.Where(s => s.IsActive == true).Select(s => new DropDown() { ID = s.Id, Name = s.Specialization1 }).ToList();
        }
    }
}
