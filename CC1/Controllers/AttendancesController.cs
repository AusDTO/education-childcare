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
    public class AttendancesController : Controller
    {
        private CCAttendanceEntities db = new CCAttendanceEntities();

        // GET: Attendances
        public ActionResult Index(string fromDate, string toDate)
        {
            var attendances = db.attendances.Include(a => a.ccChild).Include(a => a.provider).Include(a => a.user).Include(a => a.user1);

            if (!String.IsNullOrEmpty(fromDate))
            {
                DateTime d;
                if (DateTime.TryParse(fromDate, out d))
                {
                    attendances = attendances.Where(a => a.SignInTime >= d);
                }
            }

            if (!String.IsNullOrEmpty(fromDate))
            {
                DateTime d;
                if (DateTime.TryParse(toDate, out d))
                {
                    attendances = attendances.Where(a => a.SignOutTime < d);
                }
            }

            return View(attendances.OrderBy(a => a.SignInTime).ToList());
        }

        // GET: Attendances/Welcome
        public ActionResult Welcome(string name, int ID = 1)
        {
            ViewBag.Message = "Hello " + name;
            ViewBag.NumTimes = ID;

            var attendances = db.attendances.Include(a => a.ccChild).Include(a => a.provider).Include(a => a.user).Include(a => a.user1);
            return View(attendances.ToList());
        }

        // GET: Attendances/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            attendance attendance = db.attendances.Find(id);
            if (attendance == null)
            {
                return HttpNotFound();
            }
            return View(attendance);
        }

        // GET: Attendances/Create
        public ActionResult Create()
        {
            ViewBag.ChildId = new SelectList(db.ccChilds, "ChildId", "FirstName");
            ViewBag.ProviderId = new SelectList(db.providers, "ProviderId", "Name");
            ViewBag.CreatedUserId = new SelectList(db.users, "UserId", "FirstName");
            ViewBag.UpdateUserId = new SelectList(db.users, "UserId", "FirstName");
            return View();
        }

        // POST: Attendances/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AttendanceId,ProviderId,ChildId,SignInTime,SignInUserId,SignOutTime,SignOutUserId,Comment,IsLocked,UserStatusId,Absent,CreatedUserId,CreatedDate,UpdateUserId,UpdateDate,TRTimestamp")] attendance attendance)
        {
            if (ModelState.IsValid)
            {
                db.attendances.Add(attendance);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ChildId = new SelectList(db.ccChilds, "ChildId", "FirstName", attendance.ChildId);
            ViewBag.ProviderId = new SelectList(db.providers, "ProviderId", "Name", attendance.ProviderId);
            ViewBag.CreatedUserId = new SelectList(db.users, "UserId", "FirstName", attendance.CreatedUserId);
            ViewBag.UpdateUserId = new SelectList(db.users, "UserId", "FirstName", attendance.UpdateUserId);
            return View(attendance);
        }

        // GET: Attendances/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            attendance attendance = db.attendances.Find(id);
            if (attendance == null)
            {
                return HttpNotFound();
            }
            ViewBag.ChildId = new SelectList(db.ccChilds, "ChildId", "FirstName", attendance.ChildId);
            ViewBag.ProviderId = new SelectList(db.providers, "ProviderId", "Name", attendance.ProviderId);
            ViewBag.CreatedUserId = new SelectList(db.users, "UserId", "FirstName", attendance.CreatedUserId);
            ViewBag.UpdateUserId = new SelectList(db.users, "UserId", "FirstName", attendance.UpdateUserId);
            return View(attendance);
        }

        // POST: Attendances/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AttendanceId,ProviderId,ChildId,SignInTime,SignInUserId,SignOutTime,SignOutUserId,Comment,IsLocked,UserStatusId,Absent,CreatedUserId,CreatedDate,UpdateUserId,UpdateDate,TRTimestamp")] attendance attendance)
        {
            if (ModelState.IsValid)
            {
                db.Entry(attendance).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ChildId = new SelectList(db.ccChilds, "ChildId", "FirstName", attendance.ChildId);
            ViewBag.ProviderId = new SelectList(db.providers, "ProviderId", "Name", attendance.ProviderId);
            ViewBag.CreatedUserId = new SelectList(db.users, "UserId", "FirstName", attendance.CreatedUserId);
            ViewBag.UpdateUserId = new SelectList(db.users, "UserId", "FirstName", attendance.UpdateUserId);
            return View(attendance);
        }

        // GET: Attendances/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            attendance attendance = db.attendances.Find(id);
            if (attendance == null)
            {
                return HttpNotFound();
            }
            return View(attendance);
        }

        // POST: Attendances/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            attendance attendance = db.attendances.Find(id);
            db.attendances.Remove(attendance);
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
