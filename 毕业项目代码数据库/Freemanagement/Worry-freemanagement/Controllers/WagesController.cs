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
        public ActionResult Index()
        {
            List<Wage> list = db.Wage.ToList();
            return View(list);
        }
        /// <summary>
        /// 添加员工工资
        /// </summary>
        /// <returns></returns>
        public ActionResult AddWage()
        {
            return View();
        }
    }
}