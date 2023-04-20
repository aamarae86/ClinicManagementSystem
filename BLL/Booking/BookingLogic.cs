using DAL;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Hierarchy;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class BookingLogic
    {
        ClinicManagementSystemEntities db = new ClinicManagementSystemEntities();

        public CallBackData Fetch(Paging paging, string role, string path, int userID)
        {
            CallBackData callBackData = new CallBackData();
            try
            {
                CommonFilters filters = paging.SearchJson.Deserialize<CommonFilters>();
                List<FetchBookings_Result> listData = db.FetchBookings(paging.DisplayLength, paging.DisplayStart, paging.SortColumn, paging.SortOrder, filters.Search, filters.Status, role, filters.StrStartDate, filters.StrEndDate, userID).ToList();
                foreach (var item in listData)
                {
                    item.Role = role;
                    if (string.IsNullOrEmpty(item.Photo))
                    {
                        item.Photo = "DefaultImage.jpg";
                    }
                    else
                    {
                        if (!System.IO.File.Exists(path + "/" + item.Photo))
                        {
                            item.Photo = "DefaultImage.jpg";
                        }
                    }
                }
                callBackData = listData.ToDataTable(paging);
            }
            catch (Exception ex)
            {
                callBackData.msg.Success = false;
                callBackData.msg.MessageDetail = Message.ErrorMessage;
            }
            return callBackData;
        }

        public Booking GetByID(int id)
        {
            return db.Bookings.Where(s => s.Id == id).FirstOrDefault();
        }

        public string AddUpdateBooking(Booking booking)
        {
            string message = string.Empty;
            var oldBooking = db.Bookings.Where(s => s.Id == booking.Id).FirstOrDefault();
            if (oldBooking != null)
            {
                try
                {
                    oldBooking.BookingStatus = booking.BookingStatus;
                    oldBooking.PatientId = booking.PatientId;
                    oldBooking.NurseId = booking.NurseId;
                    oldBooking.DoctorId = booking.DoctorId;
                    oldBooking.BookingDate = booking.BookingDate;
                    oldBooking.BookingTime = booking.BookingTime;
                    oldBooking.DiseaseId = booking.DiseaseId;
                    oldBooking.UpdatedBy = booking.UpdatedBy;
                    oldBooking.PatientName = booking.PatientName;
                    oldBooking.PatientUserName = booking.PatientUserName;
                    db.SaveChanges();
                    message = "Success: Booking has been updated successfully.";
                }

                catch (Exception ex)
                {
                    message = ex.Message;
                }
            }
            else
            {
                try
                {
                    booking.BookingStatus = "Pending";
                    db.Bookings.Add(booking);
                    db.SaveChanges();
                    message = "Success: Booking has been added successfully.";
                }
                catch (Exception ex)
                {
                    message = ex.Message;
                }

            }
            return message;
        }

        public string AddUpdateBookingDetail(PatientMedicalHistory model)
        {
            string message = string.Empty;
            try
            {
                var oldDetail = db.PatientMedicalHistories.Where(s => s.DetailID == model.DetailID).FirstOrDefault();
                
                if (oldDetail != null)
                {
                    oldDetail.BloodPressureMax = model.BloodPressureMax;
                    oldDetail.BloodPressureMin = model.BloodPressureMin;
                    oldDetail.Height = model.Height;
                    oldDetail.Temperature = model.Temperature;
                    oldDetail.MedicalHistory = model.MedicalHistory;
                    oldDetail.MedicalHistoryDetail = model.MedicalHistoryDetail;
                    oldDetail.Symptoms = model.Symptoms;
                    oldDetail.Weight = model.Weight;
                    oldDetail.DoctorComments = model.DoctorComments;
                    oldDetail.Medicine = model.Medicine;
                    oldDetail.RecommendedTests = model.RecommendedTests;
                    if (model.DoctorId.HasValue)
                    {
                        oldDetail.Booking.DoctorId = model.DoctorId;
                    }
                    db.SaveChanges();
                    message = "Success: Details has been updated successfully.";
                }
                else
                {
                    db.PatientMedicalHistories.Add(model);
                    var booking = db.Bookings.FirstOrDefault(s => s.Id == model.BookingID);
                    if (booking != null)
                    {
                        if (model.DoctorId.HasValue)
                        {
                            booking.DoctorId = model.DoctorId;
                            booking.PatientName = booking.AspNetUser.FirstName;
                            booking.PatientUserName = booking.AspNetUser.UserName;
                        }
                    }
                    db.SaveChanges();
                    message = "Success: Details has been added successfully.";
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

        public PatientMedicalHistory GetBookingDetailByID(int bookingId)
        {
            PatientMedicalHistory model = db.PatientMedicalHistories.Where(s => s.BookingID == bookingId).FirstOrDefault();
            if (model != null)
            {
                model.PatientName = string.Format("{0} {1}", model.Booking.AspNetUser.FirstName, model.Booking.AspNetUser.LastName);
                model.DoctorId = model.Booking.DoctorId;
            }
            else
            {
                model = new PatientMedicalHistory();
                Booking booking = db.Bookings.Where(s => s.Id == bookingId).FirstOrDefault();
                model.PatientName = string.Format("{0} {1}", booking.AspNetUser.FirstName, booking.AspNetUser.LastName);
                model.BookingID = bookingId;
            }
            return model;
        }

        public int SaveMedicalReport(MedicalReport report)
        {
            try
            {
                db.MedicalReports.Add(report);
                db.SaveChanges();
                return report.ReportId;
            }
            catch (Exception ex)
            {
                return 0;
            }
            
        }

        public void DeleteReport(int reportId)
        {
            var report = db.MedicalReports.Where(s => s.ReportId == reportId).FirstOrDefault();
            if (report != null)
            {
                db.MedicalReports.Remove(report);
                db.SaveChanges();
            }
        }

    }
}
