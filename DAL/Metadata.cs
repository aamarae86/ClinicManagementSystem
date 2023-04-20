using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DAL
{
    public class AspnetUserMetadata
    {
        [Required(ErrorMessage ="First Name is required.")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = "Last Name is required.")]
        public string LastName { get; set; }
        [Required(ErrorMessage = "Email is required.")]
        [EmailAddress]
        public string Email { get; set; }
        [Required(ErrorMessage = "Username is required.")]
        public string UserName { get; set; }
        
    }
    
    [MetadataType(typeof(AspnetUserMetadata))]
    public partial class AspNetUser
    {
        public string Name
        {
            get
            {
                return (this.FirstName + " " + (String.IsNullOrEmpty(this.LastName) ? string.Empty : this.LastName));
            }
        }
        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        [NotMapped]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [NotMapped]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
        public List<DropDown> lstGender { get; set; }
        public List<DropDown> lstSpecialization { get; set; }
        public HttpPostedFileBase ProfilePicture { get; set; }
    }

    public partial class SpecializationMetadata
    {
        [Required(ErrorMessage = "Specialization is required.")]
        public string Specialization1 { get; set; }
    }

    [MetadataType(typeof(SpecializationMetadata))]
    public partial class Specialization
    { 
    
    }

    public partial class BookingMetadata
    {
        [Required(ErrorMessage = "Patient is required.")]
        public Nullable<int> PatientId { get; set; }
        [Required(ErrorMessage = "Disease is required.")]
        public Nullable<int> DiseaseId { get; set; }
        [Required(ErrorMessage = "Booking date is required.")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public Nullable<System.DateTime> BookingDate { get; set; }
        [Required(ErrorMessage = "Booking time is required.")]
        public Nullable<System.TimeSpan> BookingTime { get; set; }
    }
    
    [MetadataType(typeof(BookingMetadata))]
    public partial class Booking
    {
        [NotMapped]
        [Required(ErrorMessage = "Patient name is required.")]
        public string PatientName { get; set; }
        [Required(ErrorMessage = "Patient username is required.")]
        [NotMapped]
        public string PatientUserName { get; set; }
        public List<DropDown> lstDoctor { get; set; }
        public List<DropDown> lstNurse { get; set; }
        public List<DropDown> lstStatus { get; set; }
        public List<DropDown> lstDisease { get; set; }
    }

    public partial class BookingDetailMetaData
    {
        [Required(ErrorMessage = "Height is required.")]
        public Nullable<double> Height { get; set; }
        [Required(ErrorMessage = "Weight is required.")]
        public Nullable<double> Weight { get; set; }
        [Required(ErrorMessage = "Temperature is required.")]
        public Nullable<double> Temperature { get; set; }
        [Required(ErrorMessage = "BloodPressure min is required.")]
        public Nullable<double> BloodPressureMin { get; set; }
        [Required(ErrorMessage = "BloodPressure max is required.")]
        public Nullable<double> BloodPressureMax { get; set; }
        [Required(ErrorMessage = "Symptoms is required.")]
        public string Symptoms { get; set; }
    }

    [MetadataType(typeof(BookingDetailMetaData))]
    public partial class PatientMedicalHistory
    {
        public string PatientName { get; set; }
        public int? DoctorId { get; set; }
        public List<DropDown> lstDoctors { get; set; }
        
        [Display(Name = "Browse File")]
        [NotMapped]
        public HttpPostedFileBase[] files { get; set; }

        public string FileName { get; set; }
        public string Description { get; set; }
    }

    public partial class DiseaseMetadata
    {
        [Required(ErrorMessage = "Disease is required.")]
        public string Name { get; set; }
    }

    [MetadataType(typeof(DiseaseMetadata))]
    public partial class Disease
    {

    }


    public partial class FetchBookings_Result
    { 
        public string Role { get; set; }
    }


    public partial class CommonFilters
    {
        public string Search { get; set; }
        public string Active { get; set; }
        public string StrStartDate { get; set; }
        public string StrEndDate { get; set; }
        public string SearchDateRange { get; set; }
        public string Status { get; set; }
    }

    public class DropDown
    {
        public int ID { get; set; }
        public string Name { get; set; }
    }
}
