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
    
    public partial class providerUser
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public providerUser()
        {
            this.providerUserRoles = new HashSet<providerUserRole>();
        }
    
        public int ProviderUserId { get; set; }
        public Nullable<int> ProviderId { get; set; }
        public Nullable<int> UserId { get; set; }
        public byte[] TrTimestamp { get; set; }
        public int CreateUserId { get; set; }
        public System.DateTime CreateDate { get; set; }
        public int UpdateUserId { get; set; }
        public System.DateTime UpdateDate { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<providerUserRole> providerUserRoles { get; set; }
        public virtual user user { get; set; }
        public virtual user user1 { get; set; }
        public virtual provider provider { get; set; }
    }
}