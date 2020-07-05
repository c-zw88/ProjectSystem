using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Worry_freemanagement.Models;

namespace Worry_freemanagement.Controllers
{
    public class noticeController : Controller
    {
        Entities1 db = new Entities1();
        // GET: notice
        public ActionResult Index()
        {
            return View();
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Index(notice not)
        {
            if (ModelState.IsValid)
            {
                not.datatime = System.DateTime.Now;
                db.notice.Add(not);
                db.SaveChanges();
                return RedirectToAction("select", "notice");
            }
            else
            {
                return View();
            }
        }
        /// <summary>
        /// 公告标题显示
        /// </summary>
        /// <returns></returns>
        public ActionResult select()
        {
            List<notice> list = db.notice.ToList();
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
    }
}