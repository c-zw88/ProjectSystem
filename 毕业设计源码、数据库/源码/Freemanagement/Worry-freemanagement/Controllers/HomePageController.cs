using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Worry_freemanagement.Models;
using System.IO;
using System.Web.Services.Description;

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
        /// <summary>
        /// 员工首页
        /// </summary>
        /// <returns></returns>
        public ActionResult Personal()
        {
            return View();
        }
        public ActionResult Personalce()
        {
           
            return View();
        }
        /// <summary>
        /// 员工中心
        /// </summary>
        /// <returns></returns>
        public ActionResult Personalcenter()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Personalcenter(Stafftable sta,HttpPostedFileBase file)
        {
            if (file != null)
            {
                string fileName = Path.GetFileName(file.FileName);
                //2.判断文件是否是图片
                //string hz = Path.GetExtension(fileName);
                if (fileName.EndsWith(".jpg") || fileName.EndsWith(".png") || fileName.EndsWith(".jpeg") || fileName.EndsWith("gif"))
                {
                    //3.保存图片到项目文件夹当中
                    file.SaveAs(Server.MapPath("~/image/" + fileName));
                    //4.将图片文件名，绑定到该用户的photo字段中
                    sta.Photos = fileName;
                }
            }
            db.Entry(sta).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            var sta1 = db.Stafftable.Where(p => p.UserName == sta.UserName && p.Password == sta.Password).SingleOrDefault();
            Departmental dep = db.Departmental.Where(p => p.DepartmentID == sta.DepartmentID).SingleOrDefault();
            sta1.Departmental = dep;
            Session["user"] = sta1;
            return RedirectToAction("Personalce", "HomePage");
        }
        /// <summary>
        /// 查看员工搞工资表
        /// </summary>
        /// <returns></returns>
        public ActionResult Wages()
        {
            Stafftable user = Session["user"] as Stafftable;
            List<Wage> Wage = db.Wage.Where(p => p.EmployeeID == user.EmployeeID).ToList();
            ViewBag.wages = Wage;
            return View();
        }
        /// <summary>
        /// 员工查看工资详情
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult WageSelelct(int id)
        {
            Stafftable user = Session["user"] as Stafftable;
            var wage = db.Wage.Find(id);
            ViewBag.weg = wage;
            return View();
        }
        /// <summary>
        /// 员工查看自己奖罚信息
        /// </summary>
        /// <returns></returns>
        public ActionResult Punate()
        {
            Stafftable user = Session["user"] as Stafftable;
            List<punishments> pun = db.punishments.Where(p => p.EmployeeID == user.EmployeeID).ToList();
            ViewBag.pun = pun;
            return View();
        }
        /// <summary>
        /// 员工查看详细的奖罚信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult PunateSelelct(int id)
        {
            Stafftable user = Session["user"] as Stafftable;
            var punishments = db.punishments.Find(id);
            ViewBag.punishments = punishments;
            return View();
        }
        /// <summary>
        /// 打卡
        /// </summary>
        /// <returns></returns>
        public ActionResult Clockins()
        {
            Stafftable stafftable = Session["User"] as Stafftable;
            Clockin col = db.Clockin.OrderByDescending(p => p.Clockinid).FirstOrDefault(p => p.EmployeeID == stafftable.EmployeeID);
            if (col == null)
            {
                ViewBag.isCol = false;
                return View();
            }
            string colTime = string.Format("{0:D}", col.Gotowork);
            string nawTime = string.Format("{0:D}", DateTime.Now);
            if (colTime == nawTime)
            {
                ViewBag.isCol = true;
            }
            else
            {
                ViewBag.isCol = false;
            }
            
            return View();
        }
        [HttpPost]
        public ActionResult Clockins(string Name,int EmployeeID)
        {
            Clockin col = new Clockin
            {
                Name = Name,
                EmployeeID = EmployeeID
            };
            string Gooffwork = DateTime.Now.Year.ToString() + "-"
                + DateTime.Now.Month.ToString() + "-" + DateTime.Now.Day.ToString() + " 17:00:00.000";
            DateTime Gooffwork1 = DateTime.Parse(Gooffwork);
            col.Gooffwork = Gooffwork1;
            col.Gotowork = DateTime.Now;
            db.Clockin.Add(col);
            db.SaveChanges();
            return Content("<script>alert('打卡成功！');history.go(-1)</script>");
        }
    }
}