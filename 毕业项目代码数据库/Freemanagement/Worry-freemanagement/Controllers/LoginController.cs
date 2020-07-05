using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Worry_freemanagement.Models;

namespace Worry_freemanagement.Controllers
{
    public class LoginController : Controller
    {
        Entities1 db = new Entities1();
        // GET: Login
        /// <summary>
        /// 登录
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();

        }
        [HttpPost]
        public ActionResult Index(string Name, string password)
        {
            var user = db.Admini.Where(u => u.Name == Name && u.Password == password).SingleOrDefault();
            //存在登录的用户信息储存在session中
            if (user != null)
            {
                //将Hashet储存，用户对应菜单信息，原因，hashet
                Session["user"] = user;
                //定义hashest
                HashSet<Admini> menusList = new HashSet<Admini>();
                Session["menusList"] = menusList;
                return RedirectToAction("Department", "Login");
            }
            else
            {
                return Content("<script>alert('账号或密码错误！');location.go(-1)</script>");
            }

        }
        /// <summary>
        /// 查看所有部门
        /// </summary>
        /// <param name="Name"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageCount"></param>
        /// <returns></returns>
        public ActionResult Department(string Name = "", int pageIndex = 1, int pageCount = 4)
        {
            //List<Departmental> list = db.Departmental.ToList();
            //return View(list);
            int totalCount = db.Departmental.OrderBy(p => p.DepartmentID).Where(p => p.DepartmentName.Contains(Name) || Name == "").Count();
            //总页数
            double totalPage = Math.Ceiling((double)totalCount / pageCount);
            //获得用户集合 , 分页查询Skip（）跳过指定数量的集合 Take() 从过滤后返回的集合中再从第一行取出指定的行数
            List<Departmental> tad = db.Departmental.OrderBy(p => p.DepartmentID).Where(p => p.DepartmentName.Contains(Name) || Name == "").ToList().Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
            ViewBag.pageIndex = pageIndex;
            ViewBag.pageCount = pageCount;
            ViewBag.totalCount = totalCount;
            ViewBag.totalPage = totalPage;
            ViewBag.Name = Name;
            return View(tad);
        }
        /// <summary>
        /// 查看部门信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Delsit(int id)
        {
            Departmental dep = db.Departmental.Find(id);
            return View(dep);
        }
        /// <summary>
        /// 修改部门信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Edit(int? id)
        {
            var dep = db.Departmental.Find(id);
            return View(dep);
        }
        [HttpPost]
        public ActionResult Edit(Departmental dep)
        {
            db.Entry(dep).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Department", "Login");
        }
        /// <summary>
        /// 添加部门
        /// </summary>
        /// <returns></returns>
        public ActionResult Add()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Add(Departmental dep)
        {
            if (ModelState.IsValid)
            {
                db.Departmental.Add(dep);
                db.SaveChanges();
                return RedirectToAction("Department");
            }
            else
            {
                return View();
            }
        }
    }
}