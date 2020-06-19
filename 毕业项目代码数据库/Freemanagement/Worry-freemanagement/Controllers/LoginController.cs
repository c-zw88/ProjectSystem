using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Worry_freemanagement.Models;

namespace Worry_freemanagement.Controllers
{
    public class LoginController : Controller
    {
        Entities1 db = new Entities1();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Department()
        {
            List<Departmental> list = db.Departmental.ToList();
            return View(list);
        }
        /// <summary>
        /// 查看部门信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Delsit(int id)
        {
            Departmental dep = db.Departmental.Find(id);
            return View(dep);
        }
        /// <summary>
        /// 修改部门信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Edit(int? id)
        {
            var dep = db.Departmental.Find(id);
            return View(dep);
        }
        [HttpPost]
        public ActionResult Edit(Departmental dep)
        {
            db.Entry(dep).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Department", "Login");
        }
        /// <summary>
        /// 添加部门
        /// </summary>
        /// <returns></returns>
        public ActionResult Add()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Add(Departmental dep)
        {
            if (ModelState.IsValid)
            {
                db.Departmental.Add(dep);
                db.SaveChanges();
                return RedirectToAction("Department");
            }
            else
            {
                return View();
            }
        }
    }
}