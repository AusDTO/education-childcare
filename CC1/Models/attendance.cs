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
    
    public partial class attendance
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public attendance()
        {
            this.attendanceStatus = new HashSet<attendanceStatu>();
        }
    
        public int AttendanceId { get; set; }
        public int ProviderId { get; set; }
        public int ChildId { get; set; }
        public Nullable<System.DateTime> SignInTime { get; set; }
        public Nullable<int> SignInUserId { get; set; }
        public Nullable<System.DateTime> SignOutTime { get; set; }
        public Nullable<int> SignOutUserId { get; set; }
        public string Comment { get; set; }
        public bool IsLocked { get; set; }
        public Nullable<int> UserStatusId { get; set; }
        public Nullable<bool> Absent { get; set; }
        public int CreatedUserId { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int UpdateUserId { get; set; }
        public System.DateTime UpdateDate { get; set; }
        public byte[] TRTimestamp { get; set; }
    
        public virtual ccChild ccChild { get; set; }
        public virtual provider provider { get; set; }
        public virtual user user { get; set; }
        public virtual user user1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<attendanceStatu> attendanceStatus { get; set; }
    }
}
