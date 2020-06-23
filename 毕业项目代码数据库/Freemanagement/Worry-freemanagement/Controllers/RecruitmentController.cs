using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Worry_freemanagement.Models;
using System.IO;

namespace Worry_freemanagement.Controllers
{
    public class RecruitmentController : Controller
    {
        /// <summary>
        /// 招聘控制器
        /// </summary>
        /// <returns></returns>
        // GET: Recruitment

        Entities1 db = new Entities1();
        public ActionResult Index()
        {
            List<Recruitment> list = db.Recruitment.ToList();
            return View(list);
        }
        /// <summary>
        /// 查看用户个人信息
        /// </summary>
        /// <returns></returns>
        public ActionResult Delsit(int id)
        { 
            Recruitment er = db.Recruitment.Find(id);
            var de = db.Departmental.Where(p => p.DepartmentID == er.DepartmentID).FirstOrDefault();
            ViewBag.de = de;   
            return View(er);
        }
        /// <summary>
        /// 录用员工
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Hire(int id)
        {
            Recruitment er = db.Recruitment.Find(id);

            return View(er);
        }
        [HttpPost]
        public ActionResult Hire(Stafftable sta,HttpPostedFileBase file,int id)
        {
            
            if (file != null)
            {
                string fileName = Path.GetFileName(file.FileName);
                //2.判断文件是否是图片
                //string hz = Path.GetExtension(fileName);
                if (fileName.EndsWith("jpg") || fileName.EndsWith("png") || fileName.EndsWith("jpeg") || fileName.EndsWith("gif"))
                {
                    //3.保存图片到项目文件夹当中
                    file.SaveAs(Server.MapPath("~/images" + fileName));
                    //4.将图片文件名，绑定到该用户的photo字段中
                    sta.Photos = fileName;
                }
            }
            sta.EntryTime = System.DateTime.Now;
            sta.Password = "123456";
            sta.UserName = "aa";
            db.Configuration.ValidateOnSaveEnabled = false;
            db.Stafftable.Add(sta);
            db.SaveChanges();
            db.Configuration.ValidateOnSaveEnabled = true;
            db.Recruitment.Remove(db.Recruitment.Find(id));
            db.SaveChanges();
            return RedirectToAction("Index", "Employee");
        
        }
        /// <summary>
        /// 添加新的应聘者
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Add()
        {
            var de = db.Departmental.ToList();
            ViewBag.de = de;
            return View();
        }
        [HttpPost]
        public ActionResult Add(Recruitment rec,HttpPostedFileBase file)
        {
            if (file != null)
            {
                string fileName = Path.GetFileName(file.FileName);
                //2.判断文件是否是图片
                //string hz = Path.GetExtension(fileName);
                if (fileName.EndsWith("jpg") || fileName.EndsWith("png") || fileName.EndsWith("jpeg") || fileName.EndsWith("gif"))
                {
                    //3.保存图片到项目文件夹当中
                    file.SaveAs(Server.MapPath("~/images" + fileName));
                    //4.将图片文件名，绑定到该用户的photo字段中
                    rec.Photos = fileName;
                }
            }
            if (ModelState.IsValid)
            {
                db.Recruitment.Add(rec);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }
    }
}