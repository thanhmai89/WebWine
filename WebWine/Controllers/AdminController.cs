using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebWine.Models;
using PagedList;
using PagedList.Mvc;
using System.Net;

namespace WebWine.Controllers
{
    public class AdminController : Controller
    {
        dbQLBanRuouDataContext db = new dbQLBanRuouDataContext();
        // GET: Admin
        public ActionResult Home()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var tendn = collection["username"];
            var matkhau = collection["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                Admin ad = db.Admins.SingleOrDefault(n => n.UserAdmin == tendn && n.PassAdmin == matkhau);
                if (ad != null)
                {
                    Session["Taikhoanadmin"] = ad;
                    return RedirectToAction("Home", "Admin");
                }
            }
            return View();
        }

        //=================================================== QUẢN LÝ RƯỢU =================================================//
        public ActionResult Ruou(int? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 5;
            return View(db.Ruous.ToList().OrderBy(n => n.MaSP).ToPagedList(pageNumber, pageSize));
        }

        [HttpGet]
        public ActionResult ThemRuou()
        {
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX");
            ViewBag.MaCD = new SelectList(db.CapDos.ToList().OrderBy(n => n.Capdo1), "MaCD", "Capdo1");
            ViewBag.MaHL = new SelectList(db.HuongLieus.ToList().OrderBy(n => n.TenHL), "MaHL", "TenHL");
            ViewBag.MaLoai = new SelectList(db.LoaiRuous.ToList().OrderBy(n => n.LoaiRuou1), "MaLoai", "LoaiRuou1");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemRuou(Ruou ruou, HttpPostedFileBase fileUpload)
        {
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX");
            ViewBag.MaCD = new SelectList(db.CapDos.ToList().OrderBy(n => n.Capdo1), "MaCD", "Capdo1");
            ViewBag.MaHL = new SelectList(db.HuongLieus.ToList().OrderBy(n => n.TenHL), "MaHL", "TenHL");
            ViewBag.MaLoai = new SelectList(db.LoaiRuous.ToList().OrderBy(n => n.LoaiRuou1), "MaLoai", "LoaiRuou1");

            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/images/bg-img"), fileName);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại!";
                    }
                    else
                    {
                        fileUpload.SaveAs(path);
                    }
                    ruou.Anhbia = fileName;
                    db.Ruous.InsertOnSubmit(ruou);
                    db.SubmitChanges();
                }
            }
            return RedirectToAction("Ruou");
        }

        [HttpGet]
        public ActionResult SuaRuou(int id)
        {
            Ruou ruou = db.Ruous.SingleOrDefault(n => n.MaSP == id);

            if (ruou == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX", ruou.MaNSX);
            ViewBag.MaCD = new SelectList(db.CapDos.ToList().OrderBy(n => n.Capdo1), "MaCD", "Capdo1", ruou.MaCD);
            ViewBag.MaHL = new SelectList(db.HuongLieus.ToList().OrderBy(n => n.TenHL), "MaHL", "TenHL", ruou.MaHL);
            ViewBag.MaLoai = new SelectList(db.LoaiRuous.ToList().OrderBy(n => n.LoaiRuou1), "MaLoai", "LoaiRuou1", ruou.MaLoai);

            return View(ruou);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SuaRuou(Ruou ruou, HttpPostedFileBase fileUpload, FormCollection col)
        {
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX");
            ViewBag.MaCD = new SelectList(db.CapDos.ToList().OrderBy(n => n.Capdo1), "MaCD", "Capdo1");
            ViewBag.MaHL = new SelectList(db.HuongLieus.ToList().OrderBy(n => n.TenHL), "MaHL", "TenHL");
            ViewBag.MaLoai = new SelectList(db.LoaiRuous.ToList().OrderBy(n => n.LoaiRuou1), "MaLoai", "LoaiRuou1");

            Ruou r = db.Ruous.First(n => n.MaSP == ruou.MaSP);
            r.Ruou1 = col["Ruou1"];
            r.Mota = col["Mota"];

            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/images/bg-img/"), fileName);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại!";
                    }
                    else
                    {
                        fileUpload.SaveAs(path);
                    }
                    ruou.Anhbia = fileName;
                    UpdateModel(ruou);
                    db.SubmitChanges();
                }
            }

            return RedirectToAction("Ruou");
        }

        public ActionResult ChiTiet(int id)
        {
            Ruou ruou = db.Ruous.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSP = ruou.MaSP;
            if (ruou == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(ruou);
        }

        [HttpGet]
        public ActionResult XoaRuou(int id)
        {
            Ruou ruou = db.Ruous.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSP = ruou.MaSP;
            if (ruou == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(ruou);
        }

        [HttpPost, ActionName("XoaRuou")]
        public ActionResult Xacnhanxoa(int id)
        {
            Ruou ruou = db.Ruous.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSP = ruou.MaSP;
            if (ruou != null)
            {
                ruou.Soluong = -1;
                db.SubmitChanges();
            }
            return RedirectToAction("Ruou");
        }

        //============================================= QUẢN LÝ NHÀ SẢN XUẤT ===============================================//
        public ActionResult NhaSanXuat(int? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 5;
            return View(db.NhaSanXuats.ToList().OrderBy(n => n.MaNSX).ToPagedList(pageNumber, pageSize));
        }

        [HttpGet]
        public ActionResult ThemNSX()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemNSX(NhaSanXuat sanxuat)
        {
            db.NhaSanXuats.InsertOnSubmit(sanxuat);
            db.SubmitChanges();
            return RedirectToAction("NhaSanXuat");
        }

        [HttpGet]
        public ActionResult SuaNSX(int id)
        {
            NhaSanXuat sanxuat = db.NhaSanXuats.SingleOrDefault(n => n.MaNSX == id);

            if (sanxuat == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            return View(sanxuat);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SuaNSX(NhaSanXuat sx, FormCollection col)
        {
            NhaSanXuat sanxuat = db.NhaSanXuats.SingleOrDefault(n => n.MaNSX == sx.MaNSX);
            sanxuat.TenNSX = col["TenNSX"];
            sanxuat.DiachiNSX = col["DiachiNSX"];
            sanxuat.DienthoaiNSX = col["DienthoaiNSX"];
            sanxuat.WebsiteNSX = col["WebsiteNSX"];

            UpdateModel(sx);
            db.SubmitChanges();
            return RedirectToAction("NhaSanXuat");
        }

        [HttpGet]
        public ActionResult XoaNSX(int id)
        {
            NhaSanXuat sanxuat = db.NhaSanXuats.SingleOrDefault(n => n.MaNSX == id);
            ViewBag.MaNSX = sanxuat.MaNSX;
            if (sanxuat == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sanxuat);
        }

        [HttpPost, ActionName("XoaNSX")]
        public ActionResult XacnhanxoaNSX(int id)
        {
            NhaSanXuat sanxuat = db.NhaSanXuats.SingleOrDefault(n => n.MaNSX == id);
            ViewBag.MaNSX = sanxuat.MaNSX;
            if (sanxuat == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.NhaSanXuats.DeleteOnSubmit(sanxuat);
            db.SubmitChanges();

            return RedirectToAction("NhaSanXuat");
        }

        //============================================== QUẢN LÝ KHÁCH HÀNG ================================================//
        public ActionResult KhachHang(int? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 5;
            return View(db.KhachHangs.ToList().OrderBy(n => n.MaKH).ToPagedList(pageNumber, pageSize));
        }

        [HttpGet]
        public ActionResult SuaKH(int id)
        {
            KhachHang khachhang = db.KhachHangs.SingleOrDefault(n => n.MaKH == id);

            if (khachhang == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            return View(khachhang);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SuaKH(KhachHang kh, FormCollection col)
        {
            KhachHang khachhang = db.KhachHangs.SingleOrDefault(n => n.MaKH == kh.MaKH);
            khachhang.TenKH = col["TenKH"];
            khachhang.Gioitinh = col["Gioitinh"];
            khachhang.EmailKH = col["EmailKH"];
            khachhang.DiachiKH = col["DiachiKH"];
            khachhang.DienthoaiKH = col["DienthoaiKH"];

            UpdateModel(kh);
            db.SubmitChanges();
            return RedirectToAction("KhachHang");
        }

        public ActionResult ChiTietKH(int id)
        {
            KhachHang khachhang = db.KhachHangs.SingleOrDefault(n => n.MaKH == id);
            ViewBag.MaKH = khachhang.MaKH;
            if (khachhang == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(khachhang);
        }

        [HttpGet]
        public ActionResult XoaKH(int id)
        {
            KhachHang khachhang = db.KhachHangs.SingleOrDefault(n => n.MaKH == id);
            ViewBag.MaKH = khachhang.MaKH;
            if (khachhang == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(khachhang);
        }

        [HttpPost, ActionName("XoaKH")]
        public ActionResult XacnhanxoaKH(int id)
        {
            KhachHang khachhang = db.KhachHangs.SingleOrDefault(n => n.MaKH == id);
            ViewBag.MaKH = khachhang.MaKH;
            if (khachhang != null)
            {
                khachhang.Taikhoan = "Khóa";
                db.SubmitChanges();
            }
            return RedirectToAction("KhachHang");
        }
    }
}