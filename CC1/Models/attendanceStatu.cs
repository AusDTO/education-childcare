//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CC1.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class attendanceStatu
    {
        public int AttendanceStatusId { get; set; }
        public int StatusId { get; set; }
        public int AttendanceId { get; set; }
        public int CreatedUserId { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int UpdateUserId { get; set; }
        public System.DateTime UpdateDate { get; set; }
        public byte[] TRTimestamp { get; set; }
    
        public virtual attendance attendance { get; set; }
        public virtual refStatu refStatu { get; set; }
        public virtual user user { get; set; }
        public virtual user user1 { get; set; }
    }
}
