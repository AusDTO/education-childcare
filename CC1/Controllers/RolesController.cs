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
    public class RolesController : Controller
    {
        private CCAttendanceEntities db = new CCAttendanceEntities();

        // GET: Roles
        public ActionResult Index()
        {
            return View(db.refRoles.ToList());
        }

        // GET: Roles/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            refRole refRole = db.refRoles.Find(id);
            if (refRole == null)
            {
                return HttpNotFound();
            }
            return View(refRole);
        }

        // GET: Roles/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Roles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "RoleId,Name,Description,TrTimestamp,CreateUserId,CreateDate,UpdateUserId,UpdateDate")] refRole refRole)
        {
            if (ModelState.IsValid)
            {
                db.refRoles.Add(refRole);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(refRole);
        }

        // GET: Roles/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            refRole refRole = db.refRoles.Find(id);
            if (refRole == null)
            {
                return HttpNotFound();
            }
            return View(refRole);
        }

        // POST: Roles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "RoleId,Name,Description,TrTimestamp,CreateUserId,CreateDate,UpdateUserId,UpdateDate")] refRole refRole)
        {
            if (ModelState.IsValid)
            {
                db.Entry(refRole).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(refRole);
        }

        // GET: Roles/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            refRole refRole = db.refRoles.Find(id);
            if (refRole == null)
            {
                return HttpNotFound();
            }
            return View(refRole);
        }

        // POST: Roles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            refRole refRole = db.refRoles.Find(id);
            db.refRoles.Remove(refRole);
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
