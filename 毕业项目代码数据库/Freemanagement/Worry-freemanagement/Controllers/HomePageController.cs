using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Worry_freemanagement.Models;

namespace Worry_freemanagement.Controllers
{
    public class HomePageController : Controller
    {
        Entities1 db = new Entities1();
        // GET: HomePage
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult tegm()
        {
            return View();
        }
        /// <summary>
        /// 公告标题显示
        /// </summary>
        /// <returns></returns>
        public ActionResult select()
        {
            List<notice> list = db.notice.OrderByDescending(p=>p.datatime).ToList();
            return View(list);
        }
        /// <summary>
        /// 显示公告内容
        /// </summary>
        /// <returns></returns>
        public ActionResult Content(int id)
        {
            notice not = db.notice.Find(id);
            return View(not);
        }
        public ActionResult Personal()
        {
            return View();
        }
    }
}