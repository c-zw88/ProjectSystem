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
        Entities db = new Entities();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Department()
        {
            List<Departmental> list  = db.Departmental.ToList();
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
        public ActionResult Edit(int id)
        {
            Departmental dep = db.Departmental.Find(id);
            return View(dep);
        }
        public ActionResult Add()
        {
            return View();
        }
    }
}