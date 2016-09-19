using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CC1.Models;
using System.Security.Principal;


namespace CC1
{
    public static class CC1Helpers
    {
        private static CCAttendanceEntities db = new CCAttendanceEntities();



        public static List<providerUserRole> GetProviderUserRolesForUser(int? userId)
        {
            if (!userId.HasValue)
                return null;
            else
                return db.providerUserRoles.Where(x => x.providerUser.UserId == userId.Value).ToList();
        }

        public static List<provider> GetProvidersForUser(int? userId)
        {

             List<provider> providers = new List<provider>();   

            if(userId == null || !userId.HasValue)
            {
                    return null;
            }

            foreach (var provider in db.providerUsers.Where(x => x.UserId == userId.Value).Select(y => y.provider))
            {
                    providers.Add(provider);
            }
             return providers;
       }



        public static string GetCurrentClaimsUserId(IPrincipal User)
        {
            string ASPNetUserId = ((System.Security.Claims.ClaimsIdentity)User.Identity).Claims.FirstOrDefault().Value;
            return ASPNetUserId;
        }
}
}