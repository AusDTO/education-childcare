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
    public class AttendanceExpectedsController : Controller
    {
        private CCAttendanceEntities db = new CCAttendanceEntities();

        // GET: AttendanceExpecteds
        public ActionResult Index()
        {
            var attendanceExpecteds = db.attendanceExpecteds.Include(a => a.ccChild).Include(a => a.provider).Include(a => a.user).Include(a => a.user1).Include(a => a.user2);
            return View(attendanceExpecteds.ToList());
        }

        // GET: AttendanceExpecteds/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            attendanceExpected attendanceExpected = db.attendanceExpecteds.Find(id);
            if (attendanceExpected == null)
            {
                return HttpNotFound();
            }
            return View(attendanceExpected);
        }

        // GET: AttendanceExpecteds/Create
        public ActionResult Create()
        {
            ViewBag.ChildId = new SelectList(db.ccChilds, "ChildId", "FirstName");
            ViewBag.ProviderId = new SelectList(db.providers, "ProviderId", "Name");
            ViewBag.CreatedUserId = new SelectList(db.users, "UserId", "FirstName");
            ViewBag.GuardianId = new SelectList(db.users, "UserId", "FirstName");
            ViewBag.UpdateUserId = new SelectList(db.users, "UserId", "FirstName");
            return View();
        }

        // POST: AttendanceExpecteds/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AttendanceExpectedId,ProviderId,GuardianId,ChildId,Monday,Tuesday,Wednesday,Friday,Saturday,Sunday,EffectiveDate,EndDate,CreatedUserId,CreatedDate,UpdateUserId,UpdateDate,TRTimestamp")] attendanceExpected attendanceExpected)
        {
            if (ModelState.IsValid)
            {
                db.attendanceExpecteds.Add(attendanceExpected);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ChildId = new SelectList(db.ccChilds, "ChildId", "FirstName", attendanceExpected.ChildId);
            ViewBag.ProviderId = new SelectList(db.providers, "ProviderId", "Name", attendanceExpected.ProviderId);
            ViewBag.CreatedUserId = new SelectList(db.users, "UserId", "FirstName", attendanceExpected.CreatedUserId);
            ViewBag.GuardianId = new SelectList(db.users, "UserId", "FirstName", attendanceExpected.GuardianId);
            ViewBag.UpdateUserId = new SelectList(db.users, "UserId", "FirstName", attendanceExpected.UpdateUserId);
            return View(attendanceExpected);
        }

        // GET: AttendanceExpecteds/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            attendanceExpected attendanceExpected = db.attendanceExpecteds.Find(id);
            if (attendanceExpected == null)
            {
                return HttpNotFound();
            }
            ViewBag.ChildId = new SelectList(db.ccChilds, "ChildId", "FirstName", attendanceExpected.ChildId);
            ViewBag.ProviderId = new SelectList(db.providers, "ProviderId", "Name", attendanceExpected.ProviderId);
            ViewBag.CreatedUserId = new SelectList(db.users, "UserId", "FirstName", attendanceExpected.CreatedUserId);
            ViewBag.GuardianId = new SelectList(db.users, "UserId", "FirstName", attendanceExpected.GuardianId);
            ViewBag.UpdateUserId = new SelectList(db.users, "UserId", "FirstName", attendanceExpected.UpdateUserId);
            return View(attendanceExpected);
        }

        // POST: AttendanceExpecteds/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AttendanceExpectedId,ProviderId,GuardianId,ChildId,Monday,Tuesday,Wednesday,Friday,Saturday,Sunday,EffectiveDate,EndDate,CreatedUserId,CreatedDate,UpdateUserId,UpdateDate,TRTimestamp")] attendanceExpected attendanceExpected)
        {
            if (ModelState.IsValid)
            {
                db.Entry(attendanceExpected).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ChildId = new SelectList(db.ccChilds, "ChildId", "FirstName", attendanceExpected.ChildId);
            ViewBag.ProviderId = new SelectList(db.providers, "ProviderId", "Name", attendanceExpected.ProviderId);
            ViewBag.CreatedUserId = new SelectList(db.users, "UserId", "FirstName", attendanceExpected.CreatedUserId);
            ViewBag.GuardianId = new SelectList(db.users, "UserId", "FirstName", attendanceExpected.GuardianId);
            ViewBag.UpdateUserId = new SelectList(db.users, "UserId", "FirstName", attendanceExpected.UpdateUserId);
            return View(attendanceExpected);
        }

        // GET: AttendanceExpecteds/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            attendanceExpected attendanceExpected = db.attendanceExpecteds.Find(id);
            if (attendanceExpected == null)
            {
                return HttpNotFound();
            }
            return View(attendanceExpected);
        }

        // POST: AttendanceExpecteds/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            attendanceExpected attendanceExpected = db.attendanceExpecteds.Find(id);
            db.attendanceExpecteds.Remove(attendanceExpected);
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
