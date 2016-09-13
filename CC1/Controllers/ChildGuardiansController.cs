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
    public class ChildGuardiansController : Controller
    {
        private CCAttendanceEntities db = new CCAttendanceEntities();

        // GET: ChildGuardians
        public ActionResult Index()
        {
            var childGuardians = db.childGuardians.Include(c => c.ccChild).Include(c => c.user);
            return View(childGuardians.ToList());
        }

        // GET: ChildGuardians/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            childGuardian childGuardian = db.childGuardians.Find(id);
            if (childGuardian == null)
            {
                return HttpNotFound();
            }
            return View(childGuardian);
        }

        // GET: ChildGuardians/Create
        public ActionResult Create()
        {
            ViewBag.childId = new SelectList(db.ccChilds, "ChildId", "FullName");
            ViewBag.guardianId = new SelectList(db.users, "UserId", "FullName").Where(x => !x.Text.Contains("System"));
            return View();
        }

        public ActionResult Create2()
        {
            ViewBag.childId = new SelectList(db.ccChilds, "ChildId", "FullName");
            ViewBag.guardianId = new SelectList(db.users, "UserId", "FullName").Where(x=>!x.Text.Contains("System"));
            return View();
        }

        // POST: ChildGuardians/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "childGuardianId,guardianId,childId,Relationship,CreatedUserId,CreatedDate,UpdateUserId,UpdateDate,TRTimestamp")] childGuardian childGuardian)
        {
            if (ModelState.IsValid)
            {
                DateTime Created = DateTime.Now;

                childGuardian.CreatedUserId = 1; //TODO: add the current user id here
                childGuardian.UpdateUserId = 1; //TODO: add the current user id here

                childGuardian.CreatedDate = Created;
                childGuardian.UpdateDate = Created;


                db.childGuardians.Add(childGuardian);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.childId = new SelectList(db.ccChilds, "ChildId", "FirstName", childGuardian.ChildId);
            ViewBag.guardianId = new SelectList(db.users, "UserId", "FirstName", childGuardian.GuardianId);
            return View(childGuardian);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create2([Bind(Include = "childGuardianId,guardianId,childId,CreatedUserId,CreatedDate,UpdateUserId,UpdateDate,TRTimestamp")] childGuardian childGuardian)
        {
            if (ModelState.IsValid)
            {
                db.childGuardians.Add(childGuardian);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.childId = new SelectList(db.ccChilds, "ChildId", "FirstName", childGuardian.ChildId);
            ViewBag.guardianId = new SelectList(db.users, "UserId", "FirstName", childGuardian.GuardianId);
            return View(childGuardian);
        }

        // GET: ChildGuardians/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            childGuardian childGuardian = db.childGuardians.Find(id);
            if (childGuardian == null)
            {
                return HttpNotFound();
            }
            ViewBag.childId = new SelectList(db.ccChilds, "ChildId", "FullName", childGuardian.ChildId);
            ViewBag.guardianId = new SelectList(db.users, "UserId", "FullName", childGuardian.GuardianId);
            return View(childGuardian);
        }

        // POST: ChildGuardians/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "childGuardianId,guardianId,childId,Relationship,CreatedUserId,CreatedDate,UpdateUserId,UpdateDate,TRTimestamp")] childGuardian childGuardian)
        {
            if (ModelState.IsValid)
            {
                childGuardian.UpdateUserId = 1; //TODO: pass the current userId to this
                DateTime updateDate  = DateTime.Now;

                childGuardian.UpdateDate = updateDate;

                db.Entry(childGuardian).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.childId = new SelectList(db.ccChilds, "ChildId", "FullName", childGuardian.ChildId);
            ViewBag.guardianId = new SelectList(db.users, "UserId", "FullName", childGuardian.GuardianId);
            return View(childGuardian);
        }

        // GET: ChildGuardians/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            childGuardian childGuardian = db.childGuardians.Find(id);
            if (childGuardian == null)
            {
                return HttpNotFound();
            }
            return View(childGuardian);
        }

        // POST: ChildGuardians/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            childGuardian childGuardian = db.childGuardians.Find(id);
            db.childGuardians.Remove(childGuardian);
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
