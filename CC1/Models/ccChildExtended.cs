using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CC1.Models
{
    public partial class ccChild
    {
      public string FullName { get { return this.FirstName + " " + this.Surname; } }
    }
}