using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Worry_freemanagement.Models;
using System.IO;

namespace Worry_freemanagement.Controllers
{
    public class TrainingController : Controller
    {
        Entities1 db = new Entities1();
        // GET: Training
        /// <summary>
        /// 员工培训列表
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            List<Trainingform> list = db.Trainingform.ToList();
            return View(list);
        }
        /// <summary>
        /// 查看培训详情
        /// </summary>
        /// <returns></returns>
        public ActionResult Delsit(int id)
        {
            Trainingform er = db.Trainingform.Find(id);
            return View(er);
        }
        /// <summary>
        /// 添加新的培训信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Add()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Add(Trainingform tra)
        {
            if (ModelState.IsValid)
            {
                db.Trainingform.Add(tra);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }
        /// <summary>
        /// 修改培训内容
        /// </summary>
        /// <returns></returns>
        public ActionResult alter(int id)
        {
            var dep = db.Trainingform.Find(id);
            return View(dep);
        }
        [HttpPost]
        public ActionResult alter(Trainingform tra)
        {
            db.Entry(tra).State= System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index","Training" );
        }
    }
}