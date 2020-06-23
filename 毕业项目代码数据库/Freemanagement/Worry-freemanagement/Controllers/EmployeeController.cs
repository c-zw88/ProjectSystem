using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Worry_freemanagement.Models;

namespace Worry_freemanagement.Controllers
{
    public class EmployeeController : Controller
    {
        Entities1 db = new Entities1();
        // GET: Employee
        /// <summary>
        /// 查看所有员工
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {

            List<Stafftable> sta = db.Stafftable.ToList();
            return View(sta);
        }
        /// <summary>
        /// 员工详细信息查询
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Delsit(int id)
        {
            Stafftable sta = db.Stafftable.Find(id);
            return View(sta);
        }
        /// <summary>
        /// 员工登录页面
        /// </summary>
        /// <returns></returns>
        public ActionResult Login()
        {
            return View();
        }
        /// <summary>
        /// 添加员工
        /// </summary>
        /// <returns></returns>
        public ActionResult Add()
        {
            var de = db.Departmental.ToList();
            ViewBag.de = de;
            return View();
        }
        [HttpPost]
        public ActionResult Add(Stafftable stafftable,HttpPostedFileBase file)
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
                        file.SaveAs(Server.MapPath("~/images" + fileName));
                        //4.将图片文件名，绑定到该用户的photo字段中
                        stafftable.Photos = fileName;
                    }
                }
                //通过注册时间填写的账号去数据库中查找账号是否存在
                Stafftable st = db.Stafftable.SingleOrDefault(p => p.Name == stafftable.Name);
                if (st == null)
                {
                    stafftable.EntryTime = System.DateTime.Now;
                    stafftable.Password = "123456";
                    stafftable.UserName = "aa";
                    db.Stafftable.Add(stafftable);
                    db.SaveChanges();
                    return RedirectToAction("Index");

                }
                else
                {
                    ModelState.AddModelError("", "该账号已存在");
                    return View();
                }
            }
            else
            {
                return View();
            }
        }
    }
}