using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CC1.Models;


namespace CC1.Controllers
{
    public class ProvidersController : Controller
    {
        private CCAttendanceEntities db = new CCAttendanceEntities();

        // GET: Providers
        public ActionResult Index()
        {

            var providers = db.providers.Include(p => p.provider2).Include(p => p.user).Include(x=>x.refState);
            return View(providers.ToList());
        }


        public ActionResult Choose()
        {
            string aspNetUserId = CC1Helpers.GetCurrentClaimsUserId(User);
            var aspNetUser = db.AspUserUsers.Where(x => x.AspUserId == aspNetUserId).FirstOrDefault();
            int ccAttendanceUserId = aspNetUser.UserId.Value;
            List<provider> providers = CC1Helpers.GetProvidersForUser(ccAttendanceUserId);
            ViewBag.ProviderOptions = new SelectList(providers.OrderBy(x => x.Name), "ProviderId", "Name");

            return View();


        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Choose([Bind(Include = "ProviderId")] provider provider)
        {
            string aspNetUserId = CC1Helpers.GetCurrentClaimsUserId(User);
            var aspNetUser = db.AspUserUsers.Where(x => x.AspUserId == aspNetUserId).FirstOrDefault();

            int ccAttendanceUserId = aspNetUser.UserId.Value;
            List<provider> providers = CC1Helpers.GetProvidersForUser(ccAttendanceUserId);
            ViewBag.ProviderOptions = new SelectList(providers.OrderBy(x => x.Name), "ProviderId", "Name");

            return RedirectToAction("Details", new { id = provider.ProviderId });


        }





        //public ActionResult Index(List<provider> userProvider)
        //{
        //    var providers = db.providers.Include(p => p.provider2).Include(p => p.user).Include(x => x.refState);
        //    return View(providers.ToList());
        //}



        // GET: Providers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            provider provider = db.providers.Find(id);
            if (provider == null)
            {
                return HttpNotFound();
            }
            return View(provider);
        }

        // GET: Providers/Create
        public ActionResult Create()
        {
            ViewBag.HeadProviderId = new SelectList(db.providers, "ProviderId", "Name");
            ViewBag.PrimaryContactUserId = new SelectList(db.users, "UserId", "FullNameRev").Where(x => !x.Text.Contains("System"));
            ViewBag.StateId = new SelectList(db.refStates, "StateId", "StateCode");
            return View();
        }

        // POST: Providers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProviderId,Name,Description,PrimaryContactUserId,HeadProviderId,IsHub,TRTimestamp,AddressLine1,AddressLine2,Locality,StateCode,Postcode,CountryCode,PhonePrefix,PhoneNumber")] provider provider)
        {


            if (ModelState.IsValid)
            {
                DateTime createdDate = DateTime.Now;
                provider.CreatedDate = createdDate;
                provider.UpdateDate = createdDate;

                provider.CreatedUserId = 1; //TODO: make this the current user
                provider.UpdateUserId = 1; //TODO: make this the current user

                db.providers.Add(provider);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.HeadProviderId = new SelectList(db.providers, "ProviderId", "Name", provider.HeadProviderId);
            ViewBag.PrimaryContactUserId = new SelectList(db.users.OrderBy(x=>x.Surname), "UserId", "FullNameRev", provider.PrimaryContactUserId).Where(x => !x.Text.Contains("System"));
            ViewBag.StateId = new SelectList(db.refStates, "StateId", "StateCode");
            return View(provider);
        }

        // GET: Providers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            provider provider = db.providers.Find(id);
            if (provider == null)
            {
                return HttpNotFound();
            }
            ViewBag.HeadProviderId = new SelectList(db.providers.Where(x=>x.IsHub), "ProviderId", "Name", provider.HeadProviderId);
            ViewBag.PrimaryContactUserId = new SelectList(db.users.OrderBy(x => x.Surname), "UserId", "FullNameRev", provider.PrimaryContactUserId);
            ViewBag.StateId = new SelectList(db.refStates, "StateId", "StateCode",provider.StateId);
            return View(provider);
        }

        // POST: Providers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProviderId,Name,Description,PrimaryContactUserId,HeadProviderId,IsHub,UpdateUserId,UpdateDate,TRTimestamp,AddressLine1,AddressLine2,Locality,StateCode,Postcode,CountryCode,PhonePrefix,PhoneNumber,CreatedUserId,CreatedDate")] provider provider)
        {
            if (ModelState.IsValid)
            {
                db.Entry(provider).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.HeadProviderId = new SelectList(db.providers, "ProviderId", "Name", provider.HeadProviderId);
            ViewBag.PrimaryContactUserId = new SelectList(db.users, "UserId", "FirstName", provider.PrimaryContactUserId);
            ViewBag.StateId = new SelectList(db.refStates, "StateId", "StateCode", provider.StateId);
            return View(provider);
        }

        // GET: Providers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            provider provider = db.providers.Find(id);
            if (provider == null)
            {
                return HttpNotFound();
            }
            return View(provider);
        }

        // POST: Providers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            provider provider = db.providers.Find(id);
            db.providers.Remove(provider);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
