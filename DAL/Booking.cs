//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Booking
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Booking()
        {
            this.PatientMedicalHistories = new HashSet<PatientMedicalHistory>();
        }
    
        public int Id { get; set; }
        public Nullable<int> PatientId { get; set; }
        public Nullable<int> DiseaseId { get; set; }
        public Nullable<System.DateTime> BookingDate { get; set; }
        public Nullable<System.TimeSpan> BookingTime { get; set; }
        public Nullable<int> DoctorId { get; set; }
        public Nullable<int> NurseId { get; set; }
        public string BookingStatus { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PatientMedicalHistory> PatientMedicalHistories { get; set; }
    }
}
