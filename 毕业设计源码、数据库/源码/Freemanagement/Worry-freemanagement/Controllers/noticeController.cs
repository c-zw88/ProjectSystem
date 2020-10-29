using System;
using System.Collections.Generic;
using System.IO;
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
        /// <summary>
        /// 添加公告
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Index(notice not, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    string fileName = Path.GetFileName(file.FileName);
                    //2.判断文件是否是图片
                    //string hz = Path.GetExtension(fileName);
                    if (fileName.EndsWith("jpg") || fileName.EndsWith("png") || fileName.EndsWith("jpeg") || fileName.EndsWith("gif"))
                    {
                        //3.保存图片到项目文件夹当中
                        file.SaveAs(Server.MapPath("~/image/" + fileName));
                        //4.将图片文件名，绑定到该用户的photo字段中
                        not.photo = fileName;
                    }
                }
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
        public ActionResult Delete(int id)
        {
            notice not = db.notice.Find(id);
            db.notice.Remove(not);
            db.SaveChanges();
            return View();
        }
    }
}