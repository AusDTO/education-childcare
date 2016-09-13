using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace CC1.Models
{
    public partial class refState
    {
        [DisplayName("State")]
        public string StateCodeMeta
        { get { return StateCode; } }
    }
}