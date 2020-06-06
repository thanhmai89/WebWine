using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebWine.Models;
using PagedList;
using PagedList.Mvc;

namespace WebWine.Controllers
{
    public class RuouController : Controller
    {
        // GET: Ruou
        dbQLBanRuouDataContext data = new dbQLBanRuouDataContext();

        private List<Ruou> Layruoumoi(int count)
        {
            return data.Ruous.OrderByDescending(a => a.Ngaycapnhat).Take(count).ToList();
        }
        // GET: Ruou
        public ActionResult Home(int ? page)
        {
            int pageSize = 6;
            int pageNum = (page ?? 1);

            var ruoumoi = Layruoumoi(20);
            return View(ruoumoi.ToPagedList(pageNum, pageSize));
        }

        public ActionResult HuongLieu()
        {
            var huong = from TenHL in data.HuongLieus select TenHL;
            return PartialView(huong);
        }

        public ActionResult NhaSanXuat()
        {
            var sanxuat = from TenNSX in data.NhaSanXuats select TenNSX;
            return PartialView(sanxuat);
        }

        public ActionResult SPTheoHuonglieu(int id)
        {
            var ruou = from m in data.Ruous where m.MaHL == id select m;
            return View(ruou);
        }

        public ActionResult SPTheoNSX(int id)
        {
            var ruou = from m in data.Ruous where m.MaNSX == id select m;
            return View(ruou);
        }

        public ActionResult Details(int id)
        {
            var ruou = from m in data.Ruous where m.MaSP == id select m;
            return View(ruou.Single());
        }

        public ActionResult GioiThieu()
        {
            return View();
        }

        public ActionResult LienHe()
        {
            return View();
        }

        public ActionResult ShowAllNhaSanXuat(int ? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 5;
            return View(data.NhaSanXuats.ToList().OrderBy(n => n.MaNSX).ToPagedList(pageNumber, pageSize));
        }
    }
}