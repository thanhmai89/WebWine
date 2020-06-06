using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebWine.Models
{
    public class GioHang
    {
        dbQLBanRuouDataContext data = new dbQLBanRuouDataContext();

        public int iMaSP { set; get; }
        public string sRuou1 { set; get; }
        public string sAnhbia { set; get; }
        public Double dDongia { set; get; }
        public int iSoluong { set; get; }

        public Double dThanhtien
        {
            get { return iSoluong * dDongia; }
        }

        public GioHang(int MaSP)
        {
            iMaSP = MaSP;
            Ruou ruou = data.Ruous.Single(n => n.MaSP == iMaSP);
            sRuou1 = ruou.Ruou1;
            sAnhbia = ruou.Anhbia;
            dDongia = double.Parse(ruou.Giaban.ToString());
            iSoluong = 1;
        }
    }
}