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
    
    public partial class providerUserRole
    {
        public int ProviderUserRoleId { get; set; }
        public int RoleId { get; set; }
        public int ProviderUserId { get; set; }
        public byte[] TrTimestamp { get; set; }
        public int CreateUserId { get; set; }
        public System.DateTime CreateDate { get; set; }
        public int UpdateUserId { get; set; }
        public System.DateTime UpdateDate { get; set; }
    
        public virtual providerUser providerUser { get; set; }
        public virtual user user { get; set; }
        public virtual user user1 { get; set; }
        public virtual refRole refRole { get; set; }
    }
}
