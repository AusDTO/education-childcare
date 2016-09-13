using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace CC1.Models
{
    public partial class childGuardian
    {
        [DisplayName("Created Date")]
        public DateTime? CreatedDateMeta
            {get { return CreatedDate; } }

        [DisplayName("Updated Date")]
        public DateTime? UpdatedDateMeta
        { get { return UpdateDate; } }

        [DisplayName("Updated by")]
        public int? UpdatedUserIdMeta
        { get { return UpdateUserId; } }

        [DisplayName("Created by")]
        public int? CreatedUserIdMeta
        { get { return CreatedUserId; } }

    }
}