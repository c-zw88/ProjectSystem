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
        public ActionResult Index(string Name = "", int pageIndex = 1, int pageCount = 4)
        {
            //List<Trainingform> list = db.Trainingform.ToList();
            //return View(list);
            int totalCount = db.Trainingform.OrderBy(p => p.TrainingID).Count();
            //总页数
            double totalPage = Math.Ceiling((double)totalCount / pageCount);
            //获得用户集合 , 分页查询Skip（）跳过指定数量的集合 Take() 从过滤后返回的集合中再从第一行取出指定的行数
            List<Trainingform> tra = db.Trainingform.OrderBy(p => p.TrainingID).ToList().Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
            ViewBag.pageIndex = pageIndex;
            ViewBag.pageCount = pageCount;
            ViewBag.totalCount = totalCount;
            ViewBag.totalPage = totalPage;
            return View(tra);
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