using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class DiseaseLogic
    {
        ClinicManagementSystemEntities db = new ClinicManagementSystemEntities();

        public CallBackData Fetch(Paging paging)
        {
            CallBackData callBackData = new CallBackData();
            try
            {
                CommonFilters filters = paging.SearchJson.Deserialize<CommonFilters>();
                List<FetchDiseases_Result> listData = db.FetchDiseases(paging.DisplayLength, paging.DisplayStart, paging.SortColumn, paging.SortOrder, filters.Status).ToList();
                callBackData = listData.ToDataTable(paging);
            }
            catch (Exception ex)
            {
                callBackData.msg.Success = false;
                callBackData.msg.MessageDetail = Message.ErrorMessage;
            }
            return callBackData;
        }

        public List<DropDown> GetDiseases()
        {
            return db.Diseases.Where(s => s.IsActive == true).Select(s => new DropDown() { ID = s.Id, Name = s.Name }).ToList();
        }

        public Disease GetByID(int id)
        {
            return db.Diseases.Where(s => s.Id == id).FirstOrDefault();
        }

        public string SaveUpdate(Disease disease)
        {
            string message = string.Empty;
            try
            {
                Disease oldSpec = db.Diseases.Where(s => s.Id == disease.Id).FirstOrDefault();
                if (oldSpec != null)
                {
                    oldSpec.Name = disease.Name;
                    oldSpec.IsActive = disease.IsActive;
                    db.SaveChanges();
                    message = "Success: Disease has been updated successfully.";
                }
                else
                {
                    db.Diseases.Add(disease);
                    db.SaveChanges();
                    message = "Success: Disease has been added successfully.";
                }
            }
            catch (Exception ex)
            {
                message = ex.Message;
            }
            return message;
        }
    }
}
