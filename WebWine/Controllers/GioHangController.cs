using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebWine.Models;

namespace WebWine.Controllers
{
    public class GioHangController : Controller
    {
        dbQLBanRuouDataContext data = new dbQLBanRuouDataContext();

        public List<GioHang> Laygiohang()
        {
            List<GioHang> lstGiohang = Session["Giohang"] as List<GioHang>;

            if (lstGiohang == null)
            {
                lstGiohang = new List<GioHang>();
                Session["Giohang"] = lstGiohang;
            }

            return lstGiohang;
        }

        public ActionResult ThemGiohang(int iMaSP, string strURL)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang ruou = lstGiohang.Find(n => n.iMaSP == iMaSP);

            if (ruou == null)
            {
                ruou = new GioHang(iMaSP);
                lstGiohang.Add(ruou);
                return Redirect(strURL);
            }

            else
            {
                ruou.iSoluong++;
                return Redirect(strURL);
            }
        }

        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;

            if (lstGiohang != null)
            {
                iTongSoLuong = lstGiohang.Sum(n => n.iSoluong);
            }

            return iTongSoLuong;
        }

        private double TongTien()
        {
            double iTongTien = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;

            if (lstGiohang != null)
            {
                iTongTien = lstGiohang.Sum(n => n.dThanhtien);
            }

            return iTongTien;
        }

        // GET: GioHang
        public ActionResult GioHang()
        {
            List<GioHang> lstGiohang = Laygiohang();

            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("Home", "Ruou");
            }

            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return View(lstGiohang);
        }

        public ActionResult GiohangPartial()
        {
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return PartialView();
        }

        public ActionResult XoaGiohang(int iMaSp)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang ruou = lstGiohang.SingleOrDefault(n => n.iMaSP == iMaSp);

            if (ruou != null)
            {
                lstGiohang.RemoveAll(n => n.iMaSP == iMaSp);
                return RedirectToAction("GioHang");
            }

            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("Home", "Ruou");
            }

            return RedirectToAction("GioHang");
        }


        public ActionResult CapnhatGiohang(int iMaSp, FormCollection f)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang ruou = lstGiohang.SingleOrDefault(n => n.iMaSP == iMaSp);

            if (ruou != null)
            {
                ruou.iSoluong = int.Parse(f["txtSoluong"].ToString());
            }

            return RedirectToAction("GioHang");
        }

        public ActionResult XoaTatcaGiohang()
        {
            List<GioHang> lstGiohang = Laygiohang();
            lstGiohang.Clear();
            return RedirectToAction("Home", "Ruou");
        }

        [HttpGet]
        public ActionResult DatHang()
        {
            if (Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
            {
                return RedirectToAction("DangNhap", "KhachHang");
            }

            if (Session["Giohang"] == null)
            {
                return RedirectToAction("Home", "Ruou");
            }

            List<GioHang> lstGiohang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return View(lstGiohang);
        }

        [HttpPost]
        public ActionResult DatHang(FormCollection collection)
        {
            DonDatHang ddh = new DonDatHang();
            KhachHang kh = (KhachHang)Session["Taikhoan"];
            List<GioHang> gh = Laygiohang();
            ddh.MaKH = kh.MaKH;
            ddh.Ngaydat = DateTime.Now;
            ddh.Diachigiao = kh.DiachiKH;
            data.DonDatHangs.InsertOnSubmit(ddh);
            data.SubmitChanges();

            foreach (var item in gh)
            {
                CTDatHang ctdh = new CTDatHang();
                ctdh.MaDH = ddh.MaDH;
                ctdh.MaSP = item.iMaSP;
                ctdh.Soluong = item.iSoluong;
                ctdh.Dongia = (decimal)item.dDongia;
                data.CTDatHangs.InsertOnSubmit(ctdh);
            }

            Session["Giohang"] = null;
            return RedirectToAction("Xacnhandonhang", "GioHang");
        }

        public ActionResult Xacnhandonhang()
        {
            return View();
        }
    }
}