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
    
    public partial class attendanceExpected
    {
        public int AttendanceExpectedId { get; set; }
        public int ProviderId { get; set; }
        public int GuardianId { get; set; }
        public int ChildId { get; set; }
        public Nullable<bool> Monday { get; set; }
        public Nullable<bool> Tuesday { get; set; }
        public Nullable<bool> Wednesday { get; set; }
        public Nullable<bool> Friday { get; set; }
        public Nullable<bool> Saturday { get; set; }
        public Nullable<bool> Sunday { get; set; }
        public Nullable<System.DateTime> EffectiveDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public int CreatedUserId { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int UpdateUserId { get; set; }
        public System.DateTime UpdateDate { get; set; }
        public byte[] TRTimestamp { get; set; }
        public string Room { get; set; }
    
        public virtual ccChild ccChild { get; set; }
        public virtual provider provider { get; set; }
        public virtual user user { get; set; }
        public virtual user user1 { get; set; }
        public virtual user user2 { get; set; }
    }
}
