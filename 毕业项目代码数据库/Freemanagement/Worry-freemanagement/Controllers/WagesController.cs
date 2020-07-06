using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Worry_freemanagement.Models;

namespace Worry_freemanagement.Controllers
{
    public class WagesController : Controller
    {
        Entities1 db = new Entities1();
        // GET: Wages
        /// <summary>
        /// 查看员工工资
        /// </summary>
        /// <returns></returns>
        public ActionResult Index(string Name = "", int pageIndex = 1, int pageCount = 4)
        {
            //List<Wage> list = db.Wage.ToList();
            //总行数
            int totalCount = db.Wage.OrderBy(p => p.EmployeeID).Where(p => p.Name.Contains(Name) || Name == "").Count();
            //总页数
            double totalPage = Math.Ceiling((double)totalCount / pageCount);
            //获得用户集合 , 分页查询Skip（）跳过指定数量的集合 Take() 从过滤后返回的集合中再从第一行取出指定的行数
            List<Wage> wages = db.Wage.OrderBy(p => p.EmployeeID).Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
            ViewBag.pageIndex = pageIndex;
            ViewBag.pageCount = pageCount;
            ViewBag.totalCount = totalCount;
            ViewBag.totalPage = totalPage;
            var sta = db.Stafftable.ToList();
            ViewBag.sta = sta;
            return View(wages);
        }
        [HttpPost]
        public ActionResult Index(int EmployeeID, string Name = "", int pageIndex = 1, int pageCount = 4)
        {
            //List<Wage> list = db.Wage.ToList();
            //总行数
            int totalCount = db.Wage.OrderBy(p => p.EmployeeID).Where(p => p.Name.Contains(Name) || Name == "").Count();
            //总页数
            double totalPage = Math.Ceiling((double)totalCount / pageCount);
            //获得用户集合 , 分页查询Skip（）跳过指定数量的集合 Take() 从过滤后返回的集合中再从第一行取出指定的行数
            List<Wage> wages = db.Wage.OrderBy(p => p.EmployeeID).Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
            ViewBag.pageIndex = pageIndex;
            ViewBag.pageCount = pageCount;
            ViewBag.totalCount = totalCount;
            ViewBag.totalPage = totalPage;
            var sta = db.Wage.Where(p=>p.EmployeeID== EmployeeID).ToList();
            ViewBag.see = sta;
            var stae = db.Stafftable.ToList();
            ViewBag.sta = stae;
            return View(sta);
        }
        /// <summary>
        /// 查看工资详情
        /// </summary>
        /// <returns></returns>
        public ActionResult selelct(int id)
        {
            Wage we = db.Wage.Find(id);
            ViewBag.we = we;
            return View();
        }
        /// <summary>
        /// 添加员工工资
        /// </summary>
        /// <returns></returns>
        public ActionResult AddWage(int id)
        {
            Stafftable ste = db.Stafftable.Find(id);
            return View(ste);
        }
        //[HttpPost]
        //public ActionResult AddWage(int EmployeeID)
        //{
        //    var add = db.
        //    return View(ste);
        //}
    }
}