using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
   public class DashboardLogic
    {
        ClinicManagementSystemEntities db = new ClinicManagementSystemEntities();

        public FetchDashboardData_Result Fetch(string role,int userID,DateTime date)
        {
            FetchDashboardData_Result listData = new FetchDashboardData_Result();
            try
            {
                
                listData = db.FetchDashboardData(userID, role,date).FirstOrDefault();
            }
            catch (Exception ex)
            {
                
            }
            return listData;
        }

    }
}
