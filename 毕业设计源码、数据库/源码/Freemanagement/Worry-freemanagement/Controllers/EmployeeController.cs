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
        public ActionResult Index(string Name = "",int pageIndex = 1, int pageCount = 4)
        {

            //List<Stafftable> sta = db.Stafftable.ToList();
            //总行数
            int totalCount = db.Stafftable.OrderBy(p => p.EmployeeID).Where(p => p.Name.Contains(Name) || Name == "").Count();
            //总页数
            double totalPage = Math.Ceiling((double)totalCount / pageCount);
            //获得用户集合 , 分页查询Skip（）跳过指定数量的集合 Take() 从过滤后返回的集合中再从第一行取出指定的行数
            List<Stafftable> sta = db.Stafftable.OrderBy(p => p.EmployeeID).Where(p => p.Name.Contains(Name) || Name == "")
                .ToList().Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
            ViewBag.pageIndex = pageIndex;
            ViewBag.pageCount = pageCount;
            ViewBag.totalCount = totalCount;
            ViewBag.totalPage = totalPage;
            ViewBag.Name = Name;  
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
        [HttpPost]
        public ActionResult Login(string name, string password)
        {
            var sta = db.Stafftable.Where(p => p.UserName == name && p.Password == password).SingleOrDefault();
            if (sta!= null)
            {
                Session["user"] = sta;
                //定义hashest
                return RedirectToAction("Personal","HomePage");
            }
            else
            {
                return Content("<script>alert('账号密码错误！');history.go(-1)</script>");
            }
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
                        file.SaveAs(Server.MapPath("~/image/" + fileName));
                        //4.将图片文件名，绑定到该用户的photo字段中
                        stafftable.Photos = fileName;
                    }
                }
                //通过注册时间填写的账号去数据库中查找账号是否存在
                
                Stafftable st = db.Stafftable.Where(p => p.Name == stafftable.Name).FirstOrDefault();
                if (st == null)
                {
                    stafftable.EntryTime = System.DateTime.Now;
                    db.Stafftable.Add(stafftable);
                    db.SaveChanges();
                    return RedirectToAction("Index");

                }
                else
                {
                    //ModelState.AddModelError("", "该账号已存在");
                    var de = db.Departmental.ToList();
                    ViewBag.de = de;
                    return Content("<script >alert('该员工已存在');window.open('" + Url.Content("/Employee/Index") + "', '_self')</script >", "text/html");
                }
            }
            else
            {
                return View();
            }
        }
    }
}