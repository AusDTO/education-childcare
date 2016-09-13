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
    public class ChildrenController : Controller
    {
        private CCAttendanceEntities db = new CCAttendanceEntities();

        // GET: Children
        public ActionResult Index()
        {
            var ccChilds = db.ccChilds.Include(c => c.user);
            var ccChilds2 = db.ccChilds.Include(c => c.childGuardians);


            return View(ccChilds.ToList());
        }

        // GET: Children/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ccChild ccChild = db.ccChilds.Find(id);
            if (ccChild == null)
            {
                return HttpNotFound();
            }
            return View(ccChild);
        }

        // GET: Children/Create
        public ActionResult Create()
        {
            ViewBag.PrimaryGuardianId = new SelectList(db.users.OrderBy(x=>x.Surname), "UserId", "FullName").Where(x => !x.Text.Contains("System"));

            return View();
        }



        // POST: Children/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ChildId,PrimaryGuardianId,FirstName,Surname,OtherNames,BirthDate,TRTimestamp")] ccChild ccChild)
        {
            if (ModelState.IsValid)
            {
                DateTime createdDate = DateTime.Now;
                ccChild.CreatedDate = createdDate;
                ccChild.UpdateDate = createdDate;

                ccChild.UpdateUserId = 1; //TODO: updated by user needs to be current user
                ccChild.CreatedUserId = 1; //TODO: updated by user needs to be current user


                db.ccChilds.Add(ccChild);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PrimaryGuardianId = new SelectList(db.users, "UserId", "FullNameRev", ccChild.PrimaryGuardianId);
            return View(ccChild);
        }


        // GET: Children/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ccChild ccChild = db.ccChilds.Find(id);
            if (ccChild == null)
            {
                return HttpNotFound();
            }
            ViewBag.PrimaryGuardianId = new SelectList(db.users, "UserId", "FirstName", ccChild.PrimaryGuardianId);
            return View(ccChild);
        }

        // POST: Children/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ChildId,PrimaryGuardianId,FirstName,Surname,OtherNames,BirthDate,CreatedUserId,CreatedDate,UpdateUserId,UpdateDate,TRTimestamp")] ccChild ccChild)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ccChild).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PrimaryGuardianId = new SelectList(db.users, "UserId", "FirstName", ccChild.PrimaryGuardianId);
            return View(ccChild);
        }

        // GET: Children/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ccChild ccChild = db.ccChilds.Find(id);
            if (ccChild == null)
            {
                return HttpNotFound();
            }
            return View(ccChild);
        }

        // POST: Children/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ccChild ccChild = db.ccChilds.Find(id);
            db.ccChilds.Remove(ccChild);
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
