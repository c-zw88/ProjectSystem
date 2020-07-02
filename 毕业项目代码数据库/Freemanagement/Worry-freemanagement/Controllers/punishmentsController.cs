using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Worry_freemanagement.Models;

namespace Worry_freemanagement.Controllers
{
    public class punishmentsController : Controller
    {
        Entities1 db = new Entities1();
        // GET: punishments
        public ActionResult Index(string Name = "", int pageIndex = 1, int pageCount = 4)
        {
            //List<punishments> list = db.punishments.ToList();
            //return View(list);
            int totalCount = db.punishments.OrderBy(p => p.EventsID).Count();
            //总页数
            double totalPage = Math.Ceiling((double)totalCount / pageCount);
            //获得用户集合 , 分页查询Skip（）跳过指定数量的集合 Take() 从过滤后返回的集合中再从第一行取出指定的行数
            List<punishments> sta = db.punishments.OrderBy(p => p.EventsID).ToList().Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
            ViewBag.pageIndex = pageIndex;
            ViewBag.pageCount = pageCount;
            ViewBag.totalCount = totalCount;
            ViewBag.totalPage = totalPage;
            ViewBag.Name = Name;
            return View(sta);
        }
        /// <summary>
        /// 查看奖罚信息
        /// </summary>
        /// <returns></returns>
        public ActionResult Delsit(int id)
        {
            punishments pum = db.punishments.Find(id);
            return View(pum);
        }
        /// <summary>
        /// 添加员工奖罚信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Add()
        {
            var de = db.Stafftable.ToList();
            ViewBag.de = de;
            return View();
        }
        [HttpPost]
        public ActionResult Add(punishments pun)
        {
            var Employee = db.Stafftable.Where(p => p.Name == pun.Name).FirstOrDefault();
            pun.Datatime = System.DateTime.Now;
            pun.EmployeeID = Employee.EmployeeID;
            db.punishments.Add(pun);
            db.SaveChanges();
            return RedirectToAction( "Index","punishments");
           
        }
        /// <summary>
        /// 修改奖罚信息
        /// </summary>
        /// <returns></returns>
        public ActionResult alter()
        {
            return  View();
        }
    }
}