using System;
using System.ComponentModel.DataAnnotations;

namespace CC1.Models
{
    public partial class attendance
    {
        [Display(Name = "Styled Date")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime StyledDate { get; set; }
    }
}