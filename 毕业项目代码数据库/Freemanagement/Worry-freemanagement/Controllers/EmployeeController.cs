using System;
using System.Collections.Generic;
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
        public ActionResult Index()
        {
            List<Stafftable> sta = db.Stafftable.ToList();
            return View(sta);
        }
        public ActionResult Delsit(int id)
        {
            Stafftable sta = db.Stafftable.Find(id);
            return View(sta);
        }
    }
}