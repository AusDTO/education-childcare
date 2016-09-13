using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CC1.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "This is the 2016 Childcare Attendance Beta.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Please contact http://education.gov.au/ for more information.";

            return View();
        }

        public ActionResult Providers()
        {
            ViewBag.Message = "Provider Information";

            return View();
        }

        public ActionResult Guardians()
        {
            ViewBag.Message = "Guardians Information";

            return View();
        }

        public ActionResult Attendance()
        {
            ViewBag.Message = "Provider Attendance";

            return View();
        }
    }
}