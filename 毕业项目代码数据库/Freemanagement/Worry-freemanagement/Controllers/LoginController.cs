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
        Entities db = new Entities();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Department()
        {
            List<Departmental> list  = db.Departmental.ToList();
            return View(list);
        }
        public ActionResult Add()
        {
            return View();
        }
    }
}