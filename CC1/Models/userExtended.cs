using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CC1.Models
{
    public partial class user
    {
        public string FullName { get { return this.FirstName + " " + this.Surname; } }

        public string FullNameRev { get { return this.Surname + ", " + this.FirstName; } }

    }
}