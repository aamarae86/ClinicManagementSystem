﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class ClinicManagementSystemEntities : DbContext
    {
        public ClinicManagementSystemEntities()
            : base("name=ClinicManagementSystemEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }
        public virtual DbSet<EmailTemplate> EmailTemplates { get; set; }
        public virtual DbSet<Specialization> Specializations { get; set; }
        public virtual DbSet<Disease> Diseases { get; set; }
        public virtual DbSet<PatientDisease> PatientDiseases { get; set; }
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<Booking> Bookings { get; set; }
        public virtual DbSet<PatientMedicalHistory> PatientMedicalHistories { get; set; }
        public virtual DbSet<MedicalReport> MedicalReports { get; set; }
    
        public virtual int FetchUser(Nullable<int> displayLength, Nullable<int> displayStart, Nullable<int> sortCol, string sortOrder, string search, string active)
        {
            var displayLengthParameter = displayLength.HasValue ?
                new ObjectParameter("DisplayLength", displayLength) :
                new ObjectParameter("DisplayLength", typeof(int));
    
            var displayStartParameter = displayStart.HasValue ?
                new ObjectParameter("DisplayStart", displayStart) :
                new ObjectParameter("DisplayStart", typeof(int));
    
            var sortColParameter = sortCol.HasValue ?
                new ObjectParameter("SortCol", sortCol) :
                new ObjectParameter("SortCol", typeof(int));
    
            var sortOrderParameter = sortOrder != null ?
                new ObjectParameter("SortOrder", sortOrder) :
                new ObjectParameter("SortOrder", typeof(string));
    
            var searchParameter = search != null ?
                new ObjectParameter("Search", search) :
                new ObjectParameter("Search", typeof(string));
    
            var activeParameter = active != null ?
                new ObjectParameter("Active", active) :
                new ObjectParameter("Active", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("FetchUser", displayLengthParameter, displayStartParameter, sortColParameter, sortOrderParameter, searchParameter, activeParameter);
        }
    
        public virtual ObjectResult<FetchSpecializations_Result> FetchSpecializations(Nullable<int> displayLength, Nullable<int> displayStart, Nullable<int> sortCol, string sortOrder, string status)
        {
            var displayLengthParameter = displayLength.HasValue ?
                new ObjectParameter("DisplayLength", displayLength) :
                new ObjectParameter("DisplayLength", typeof(int));
    
            var displayStartParameter = displayStart.HasValue ?
                new ObjectParameter("DisplayStart", displayStart) :
                new ObjectParameter("DisplayStart", typeof(int));
    
            var sortColParameter = sortCol.HasValue ?
                new ObjectParameter("SortCol", sortCol) :
                new ObjectParameter("SortCol", typeof(int));
    
            var sortOrderParameter = sortOrder != null ?
                new ObjectParameter("SortOrder", sortOrder) :
                new ObjectParameter("SortOrder", typeof(string));
    
            var statusParameter = status != null ?
                new ObjectParameter("Status", status) :
                new ObjectParameter("Status", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<FetchSpecializations_Result>("FetchSpecializations", displayLengthParameter, displayStartParameter, sortColParameter, sortOrderParameter, statusParameter);
        }
    
        public virtual ObjectResult<FetchDiseases_Result> FetchDiseases(Nullable<int> displayLength, Nullable<int> displayStart, Nullable<int> sortCol, string sortOrder, string status)
        {
            var displayLengthParameter = displayLength.HasValue ?
                new ObjectParameter("DisplayLength", displayLength) :
                new ObjectParameter("DisplayLength", typeof(int));
    
            var displayStartParameter = displayStart.HasValue ?
                new ObjectParameter("DisplayStart", displayStart) :
                new ObjectParameter("DisplayStart", typeof(int));
    
            var sortColParameter = sortCol.HasValue ?
                new ObjectParameter("SortCol", sortCol) :
                new ObjectParameter("SortCol", typeof(int));
    
            var sortOrderParameter = sortOrder != null ?
                new ObjectParameter("SortOrder", sortOrder) :
                new ObjectParameter("SortOrder", typeof(string));
    
            var statusParameter = status != null ?
                new ObjectParameter("Status", status) :
                new ObjectParameter("Status", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<FetchDiseases_Result>("FetchDiseases", displayLengthParameter, displayStartParameter, sortColParameter, sortOrderParameter, statusParameter);
        }
    
        public virtual ObjectResult<FetchDoctors_Result> FetchDoctors(Nullable<int> displayLength, Nullable<int> displayStart, Nullable<int> sortCol, string sortOrder, string search, string status, string role)
        {
            var displayLengthParameter = displayLength.HasValue ?
                new ObjectParameter("DisplayLength", displayLength) :
                new ObjectParameter("DisplayLength", typeof(int));
    
            var displayStartParameter = displayStart.HasValue ?
                new ObjectParameter("DisplayStart", displayStart) :
                new ObjectParameter("DisplayStart", typeof(int));
    
            var sortColParameter = sortCol.HasValue ?
                new ObjectParameter("SortCol", sortCol) :
                new ObjectParameter("SortCol", typeof(int));
    
            var sortOrderParameter = sortOrder != null ?
                new ObjectParameter("SortOrder", sortOrder) :
                new ObjectParameter("SortOrder", typeof(string));
    
            var searchParameter = search != null ?
                new ObjectParameter("search", search) :
                new ObjectParameter("search", typeof(string));
    
            var statusParameter = status != null ?
                new ObjectParameter("Status", status) :
                new ObjectParameter("Status", typeof(string));
    
            var roleParameter = role != null ?
                new ObjectParameter("role", role) :
                new ObjectParameter("role", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<FetchDoctors_Result>("FetchDoctors", displayLengthParameter, displayStartParameter, sortColParameter, sortOrderParameter, searchParameter, statusParameter, roleParameter);
        }
    
        public virtual ObjectResult<GetPatients_Result> GetPatients()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetPatients_Result>("GetPatients");
        }
    
        public virtual ObjectResult<GetPatientByName_Result> GetPatientByName(string userName)
        {
            var userNameParameter = userName != null ?
                new ObjectParameter("userName", userName) :
                new ObjectParameter("userName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetPatientByName_Result>("GetPatientByName", userNameParameter);
        }
    
        public virtual ObjectResult<GetPatientByUserName_Result> GetPatientByUserName(string userName)
        {
            var userNameParameter = userName != null ?
                new ObjectParameter("userName", userName) :
                new ObjectParameter("userName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetPatientByUserName_Result>("GetPatientByUserName", userNameParameter);
        }
    
        public virtual ObjectResult<FetchDoctorList_Result> FetchDoctorList()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<FetchDoctorList_Result>("FetchDoctorList");
        }
    
        public virtual ObjectResult<FetchNurseList_Result> FetchNurseList()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<FetchNurseList_Result>("FetchNurseList");
        }
    
        public virtual ObjectResult<FetchBookings_Result> FetchBookings(Nullable<int> displayLength, Nullable<int> displayStart, Nullable<int> sortCol, string sortOrder, string search, string status, string role, string fromDate, string toDate, Nullable<int> userId)
        {
            var displayLengthParameter = displayLength.HasValue ?
                new ObjectParameter("DisplayLength", displayLength) :
                new ObjectParameter("DisplayLength", typeof(int));
    
            var displayStartParameter = displayStart.HasValue ?
                new ObjectParameter("DisplayStart", displayStart) :
                new ObjectParameter("DisplayStart", typeof(int));
    
            var sortColParameter = sortCol.HasValue ?
                new ObjectParameter("SortCol", sortCol) :
                new ObjectParameter("SortCol", typeof(int));
    
            var sortOrderParameter = sortOrder != null ?
                new ObjectParameter("SortOrder", sortOrder) :
                new ObjectParameter("SortOrder", typeof(string));
    
            var searchParameter = search != null ?
                new ObjectParameter("search", search) :
                new ObjectParameter("search", typeof(string));
    
            var statusParameter = status != null ?
                new ObjectParameter("Status", status) :
                new ObjectParameter("Status", typeof(string));
    
            var roleParameter = role != null ?
                new ObjectParameter("role", role) :
                new ObjectParameter("role", typeof(string));
    
            var fromDateParameter = fromDate != null ?
                new ObjectParameter("fromDate", fromDate) :
                new ObjectParameter("fromDate", typeof(string));
    
            var toDateParameter = toDate != null ?
                new ObjectParameter("toDate", toDate) :
                new ObjectParameter("toDate", typeof(string));
    
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("userId", userId) :
                new ObjectParameter("userId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<FetchBookings_Result>("FetchBookings", displayLengthParameter, displayStartParameter, sortColParameter, sortOrderParameter, searchParameter, statusParameter, roleParameter, fromDateParameter, toDateParameter, userIdParameter);
        }
    
        public virtual ObjectResult<FetchPatientMedicalHistory_Result> FetchPatientMedicalHistory(Nullable<int> patientId)
        {
            var patientIdParameter = patientId.HasValue ?
                new ObjectParameter("patientId", patientId) :
                new ObjectParameter("patientId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<FetchPatientMedicalHistory_Result>("FetchPatientMedicalHistory", patientIdParameter);
        }
    
        public virtual ObjectResult<FetchMedicines_Result> FetchMedicines(Nullable<int> displayLength, Nullable<int> displayStart, Nullable<int> sortCol, string sortOrder, string status)
        {
            var displayLengthParameter = displayLength.HasValue ?
                new ObjectParameter("DisplayLength", displayLength) :
                new ObjectParameter("DisplayLength", typeof(int));
    
            var displayStartParameter = displayStart.HasValue ?
                new ObjectParameter("DisplayStart", displayStart) :
                new ObjectParameter("DisplayStart", typeof(int));
    
            var sortColParameter = sortCol.HasValue ?
                new ObjectParameter("SortCol", sortCol) :
                new ObjectParameter("SortCol", typeof(int));
    
            var sortOrderParameter = sortOrder != null ?
                new ObjectParameter("SortOrder", sortOrder) :
                new ObjectParameter("SortOrder", typeof(string));
    
            var statusParameter = status != null ?
                new ObjectParameter("Status", status) :
                new ObjectParameter("Status", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<FetchMedicines_Result>("FetchMedicines", displayLengthParameter, displayStartParameter, sortColParameter, sortOrderParameter, statusParameter);
        }
    
        public virtual ObjectResult<GetPatientMedicineHistory_Result> GetPatientMedicineHistory(Nullable<int> patientId)
        {
            var patientIdParameter = patientId.HasValue ?
                new ObjectParameter("patientId", patientId) :
                new ObjectParameter("patientId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetPatientMedicineHistory_Result>("GetPatientMedicineHistory", patientIdParameter);
        }
    
        public virtual ObjectResult<FetchDashboardData_Result> FetchDashboardData(Nullable<int> userId, string role, Nullable<System.DateTime> date)
        {
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("userId", userId) :
                new ObjectParameter("userId", typeof(int));
    
            var roleParameter = role != null ?
                new ObjectParameter("role", role) :
                new ObjectParameter("role", typeof(string));
    
            var dateParameter = date.HasValue ?
                new ObjectParameter("date", date) :
                new ObjectParameter("date", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<FetchDashboardData_Result>("FetchDashboardData", userIdParameter, roleParameter, dateParameter);
        }
    }
}