create database QuanLiBanRuou
go

use QuanLiBanRuou

create table KhachHang
(
	MaKH int identity(1, 1),
	TenKH nvarchar(50) not null,
	Taikhoan varchar(50),
	Matkhau varchar(50),
	Ngaysinh datetime,
	Gioitinh nvarchar(5),
	EmailKH varchar(50) unique,
	DiachiKH nvarchar(200),
	DienthoaiKH varchar(11),
	constraint PK_KhachHang primary key (MaKH)
)

insert into KhachHang (TenKH, Taikhoan, Matkhau, Ngaysinh, Gioitinh, EmailKH, DiachiKH, DienthoaiKH)
values (N'Nam Dạ Tước', 'tuocthieu', 'datuoc123', '10/10/1988', N'Nam', 'namdatuoc@gmail.com', N'16 Võ Văn Tần, Phường 5, Quận Tân Bình, TP.HCM', '0941329171')
insert into KhachHang (TenKH, Taikhoan, Matkhau, Ngaysinh, Gioitinh, EmailKH, DiachiKH, DienthoaiKH)
values (N'Kỷ Dĩ Ninh', 'dininh', 'dininh456', '2/10/1993', N'Nữ', 'kydininh@gmail.com', N'6 Chân Lý, Phường 15, Quận Thủ Đức, TP.HCM', '0989689514')
insert into KhachHang (TenKH, Taikhoan, Matkhau, Ngaysinh, Gioitinh, EmailKH, DiachiKH, DienthoaiKH)
values (N'Bạch Lăng Lăng', 'sudoluyen', 'langlang99', '9/9/1991', N'Nữ', 'bachlanglang@gmail.com', N'131 Võ Thị Sáu, Phường 7, Quận 8, TP.HCM', '0390987654')
insert into KhachHang (TenKH, Taikhoan, Matkhau, Ngaysinh, Gioitinh, EmailKH, DiachiKH, DienthoaiKH)
values (N'Hàn Trạc Thần', 'hoadiep', 'thienthan789', '8/6/1983', N'Nam', 'hantracthan@gmail.com', N'15 Nguyễn Hữu Cảnh, Phường 11, Quận Bình Tân, TP.HCM', '0398705349')
insert into KhachHang (TenKH, Taikhoan, Matkhau, Ngaysinh, Gioitinh, EmailKH, DiachiKH, DienthoaiKH)
values (N'Dương Lam Hàng', 'moreonemore', 'lamhang135','2/10/1991', N'Nam', 'duonglamhang@gmail.com', N'68/1 Nguyễn Thị Minh Khai, Phường 25, Quận 10, TP.HCM', '0396562298')
insert into KhachHang (TenKH, Taikhoan, Matkhau, Ngaysinh, Gioitinh, EmailKH, DiachiKH, DienthoaiKH)
values (N'Tiết Đồng', 'dongenglish', 'tietdong579','8/9/1992', N'Nữ', 'tietdong@gmail.com', N'9/3/1 Phạm Ngũ Lão, Phường 4, Quận 1, TP.HCM', '0396523412')
insert into KhachHang (TenKH, Taikhoan, Matkhau, Ngaysinh, Gioitinh, EmailKH, DiachiKH, DienthoaiKH)
values (N'Diệp Chính Thần', '70cforever', 'suhuynh520', '1/11/1987', N'Nam', 'diepchinhthan@gmail.com', N'17 Cách Mạng Tháng 8, Phường 7, Quận Gò Vấp, TP.HCM', '0399823465')
insert into KhachHang (TenKH, Taikhoan, Matkhau, Ngaysinh, Gioitinh, EmailKH, DiachiKH, DienthoaiKH)
values (N'Lạc Tranh', 'dailuatsu', 'louis69', '9/2/1989', N'Nữ', 'lactranh@gmail.com', N'27 Lý Thường Kiệt, Phường 9, Quận 10, TP.HCM', '0397843652')
insert into KhachHang (TenKH, Taikhoan, Matkhau, Ngaysinh, Gioitinh, EmailKH, DiachiKH, DienthoaiKH)
values (N'Mộ Thừa Hòa', 'cuongvatly', 'hoadong12', '7/9/1989', N'Nam', 'mothuahoa@gmail.com', N'30 Tháng 4, Phường 6, Quận Phú Nhuận, TP.HCM', '0392332467')
insert into KhachHang (TenKH, Taikhoan, Matkhau, Ngaysinh, Gioitinh, EmailKH, DiachiKH, DienthoaiKH)
values (N'Bạc Cận Ngôn', 'ngontucao', 'besttuky', '4/3/1988', N'Nam', 'baccanngon@gmail.com', N'17 Võ Văn Ngân, Phường 25, Quận Thủ Đức, TP.HCM', '0398976234')

create table NhaSanXuat
(
	MaNSX int identity(1, 1),
	TenNSX nvarchar(50) not null,
	DiachiNSX nvarchar(200),
	DienthoaiNSX varchar(11),
	WebsiteNSX varchar(50),
	constraint PK_NhaSX primary key (MaNSX)
)

insert into NhaSanXuat (TenNSX, DiachiNSX, DienthoaiNSX, WebsiteNSX)
values ('Absolut', N'Ahus, Scania, phía Nam Thụy Điển', '0283995295', 'absolut.com')
insert into NhaSanXuat (TenNSX, DiachiNSX, DienthoaiNSX, WebsiteNSX)
values ('Hennessy', N'Cognac, Pháp', '0933302403', 'hennessy.com')
insert into NhaSanXuat (TenNSX, DiachiNSX, DienthoaiNSX, WebsiteNSX)
values ('Johnnie Walker', N'Kilmarnock, Ayrshire, Scotland', '0914511124', 'johnniewalker.com')
insert into NhaSanXuat (TenNSX, DiachiNSX, DienthoaiNSX, WebsiteNSX)
values ('Chivas', N'Keith, Moray in Speyside, Scotland', '0947555900', 'chivas.com')
insert into NhaSanXuat (TenNSX, DiachiNSX, DienthoaiNSX, WebsiteNSX)
values ('Moet & Chandon', N'Épernay, Pháp', '0938272276', 'moetchandon.com')
insert into NhaSanXuat (TenNSX, DiachiNSX, DienthoaiNSX, WebsiteNSX)
values ('Remy Martin', N'Cognac, Pháp', '0908336341', 'remymartin.com')
insert into NhaSanXuat (TenNSX, DiachiNSX, DienthoaiNSX, WebsiteNSX)
values ('Martell', N'Cognac, Pháp', '0916068596', 'martell.com')
insert into NhaSanXuat (TenNSX, DiachiNSX, DienthoaiNSX, WebsiteNSX)
values ('Cardhu', N'Knockando, Aberlour AB38 7RY, United Kingdom', '0942600500', 'cardhu.com')
insert into NhaSanXuat (TenNSX, DiachiNSX, DienthoaiNSX, WebsiteNSX)
values ('Bacardi Rhum', N'Hamilton, Bermuda', '0397625252', 'bacardirhum.com')
insert into NhaSanXuat (TenNSX, DiachiNSX, DienthoaiNSX, WebsiteNSX)
values ('Ballantines', N'Dumbarton, Scotland', '0390915374', 'ballantines.com')

create table LoaiRuou
(
	MaLoai int identity(1, 1),
	LoaiRuou nvarchar(50) not null,
	constraint PK_Loai primary key (MaLoai)
)

insert into LoaiRuou (LoaiRuou) values (N'Wishkey Scotland')
insert into LoaiRuou (LoaiRuou) values (N'Cognac')
insert into LoaiRuou (LoaiRuou) values (N'Gin')
insert into LoaiRuou (LoaiRuou) values (N'Vodka')
insert into LoaiRuou (LoaiRuou) values (N'Vang')
insert into LoaiRuou (LoaiRuou) values (N'Chivas')
insert into LoaiRuou (LoaiRuou) values (N'Ballantines')
insert into LoaiRuou (LoaiRuou) values (N'Sherry')

create table HuongLieu
(
	MaHL int identity(1, 1),
	TenHL nvarchar(50) not null,
	constraint PK_Huong primary key (MaHL)
)

insert into HuongLieu (TenHL) values (N'Chateau')
insert into HuongLieu (TenHL) values (N'Merlot hay Shiraz')
insert into HuongLieu (TenHL) values (N'Maule Valley')
insert into HuongLieu (TenHL) values (N'Cabernet Sauvignon')
insert into HuongLieu (TenHL) values (N'Bordeaux')

create table CapDo
(
	MaCD int identity(1, 1),
	Capdo nvarchar(50) not null,
	constraint PK_Capdo primary key (MaCD)
)

insert into CapDo (Capdo) values (N'Gran Reserva')
insert into CapDo (Capdo) values (N'Vin de Pays')
insert into CapDo (Capdo) values (N'Varietal')
insert into CapDo (Capdo) values (N'Reserva')

create table Ruou
(
	MaSP int identity(1, 1),
	MaLoai int,
	Ruou nvarchar(50) not null,
	Anhbia varchar(50),
	Anh1 varchar(50),
	Anh2 varchar(50),
	Mota nvarchar(max),
	MaHL int,
	NamSX int,
	MaNSX int,
	MaCD int,
	Nongdo int,
	Dungtich int,
	Ngaycapnhat datetime,
	Soluong int,
	Giaban decimal(18, 0) check (Giaban >= 0),
	constraint PK_Ruou primary key (MaSP),
	constraint FK_Loai foreign key (MaLoai) references LoaiRuou(MaLoai),
	constraint FK_Huong foreign key (MaHL) references HuongLieu(MaHL),
	constraint FK_NhaSX foreign key (MaNSX) references NhaSanXuat(MaNSX),
	constraint FK_Capdo foreign key (MaCD) references CapDo(MaCD)
)

insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Absolut Raspberri', 'absolutraspberri.jpg', 'absolutraspberri1.jpg', 'absolutraspberri2.jpg', N'Absolut Raspberri mang hương vị đặc biệt của quả mâm xôi - một trong những hương vị trái cây tự nhiên thuần túy nhất, làm tăng thêm hương vị khiến người uống có cảm giác như đang ở giữa thiên nhiên trong lành.', 2003, 35, 750, '5/8/2018', 87, 420000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Hennessy VSOP', 'hennessyvsop.png', 'hennessyvsop1.png', 'hennessyvsop2.png', N'Đây là sản phẩm được đặt tên theo yêu cầu của vị vua George V của Anh Quốc vào năm 1817. Hennessy có vị của mật ong, cam thảo, lá cây đinh hương cùng với vị ngọt mật của trái chín cây. Đây chính là đặc trưng của sự cân bằng hoàn hảo và kết thúc êm dịu.', 1999, 42, 700, '12/6/2018', 51, 1100000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Johnnie Walker King George V', 'johnwalkerkingv.jpg', 'johnwalkerking1.jpg', 'johnwalkerking2.jpg', N'Ban đầu khi mới thưởng thức, King George V mang một hương thơm sâu sắc đặc trưng của khói, tiếp theo là vị hoa quả tươi ngọt (táo, lê, chuối) và gia vị phức tạp, phong phú như nho khô, quả sung, quế,...', 2001, 55, 500, '3/1/2019', 32, 7900000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Absolut Mandrin', 'absolutmandrin.jpg', 'absolutmandrin1.jpg', 'absolutmandrin2.jpg', N'Vị êm dịu pha với một chút vị chát của quả nho đen Hy Lạp. Hương vị đậm đà xem lẫn vị chát sẽ giúp làm nên một ly Cocktail thật hấp dẫn nếu biết cách kết hợp với Orangina, Tonic và Sprite.', 2015, 32, 750, '1/5/2018', 94, 400000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Chivas 25', 'chivas25.jpg', 'chivas251.jpg', 'chivas252.jpg', N'Chivas 25 có màu vàng hổ phách đặc trưng và mang hương thơm nhiều lớp của trái cây khô và kẹo bơ, socola đắng cùng một ít vị khó. Dư vị ấm áp kéo dài và đáng nhớ với một chút hương mai và đào.', 1994, 65, 750, '11/12/2018', 44, 6100000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Champagne Moet & Chandon Rose Imperial', 'moetchandonrose.jpg', 'moetchandonrose1.jpg', 'moetchandonrose2.jpg', N'Loại Champagne này có màu vàng rơm thanh nhã cùng sắc hổ phách, có hương vị mạnh mẽ nồng nàn với vị trái cây điểm thêm hương vị của đào chín và một chút vị cay của vỏ cam sẽ lưu lại khá lâu trong vòm họng sau khi uống.', 2005, 40, 750, '7/4/2018', 62, 1900000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Remy Martin XO', 'remymartinxo.jpg', 'remymartinxo1.jpg', 'remymartinxo2.jpg', N'Đây là một "Bản giao hưởng" của hơn 300 loại rượu chưng cất từ 10 cho đến 37 tuổi. Remy Martin XO có hương thơm của các loại hoa trắng kết hợp với mùi vị của quả mận ngọt, quả sung chín, cam tây, quế nghiền và quả phỉ.', 1992, 70, 700, '4/3/2019', 30, 2600000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Vang Pháp Chateau Belle Vue Haut Medoc', 'vangchateau2014.jpg', 'vangchateau20141.jpg', 'vangchateau20142.jpg', N'Nó là kết quả của sự pha trộn sành điệu của các loại rượu chưng cất độ tuổi từ 5 đến 25 tuổi, có hương vị phức hợp, ban đầu khi vào miệng là hương vanilla, hoa hồng và hoa nhài.', 2015, 13,750, '10/4/2019', 81, 1050000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Chivas 62 Gun Salute', 'chivas62gun.jpg', 'chivas62gun1.jpg', 'chivas62gun2.jpg', N'Royal Salute là nhãn hiệu duy nhất sử dụng whisky tuổi từ 21 năm trở lên, dựa theo truyền thống của Chivas Brothers trong quá trình ủ whisky. Dòng whisky duy nhất, cho một hỗn hợp chỉ sử dụng whisky được ủ ít nhất 40 năm.', 1982, 65, 1000, '10/4/2019', 10, 56000000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Cardhu 18', 'cardhu18.jpg', 'cardhu181.jpg', 'cardhu182.jpg', N'Đặc trưng điển hình của dòng Whisky mạch nha vùng Speyside này là cực kỳ dễ chịu, vị êm mượt, ngọt dịu, không quá cầu kỳ nhưng luôn tròn đầy hương vị. Rượu Cardhu 18 là sản phẩm tinh tế và cao cấp nhất của thương hiệu Cardhu.', 2001, 45, 700, '8/3/2018', 51, 1600000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Rhum Bacardi Gold', 'rhumbacardigold.jpg', 'rhumbacardigold1.jpg', 'rhumbacardigold2.jpg', N'Rhum Bacardi Gold là sự kết hợp của 14 loại rượu Rhum khác nhau và được ủ ròng từ 3 đến 5 năm để tạo nên một hương vị ngon nổi bật đem đến cho người thưởng thức một cảm giác ngọt ngào từ một loại rượu Rhum cao cấp.', 2015, 40, 750, '6/1/2019', 74, 260000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Ballantines Christmas Reserve', 'ballantineschristmas.jpg', 'ballantineschristmas1.jpg', 'ballantineschristmas2.jpg', N'Đây là dòng Whisky pha trộn đặc biệt với chất lượng cao, được sản xuất với số lượng có hạn hàng năm và cũng được bán ra trong khoảng thời gian rất giới hạn. Mang hương vị sang trọng của mùa Giáng sinh như hương gỗ sồi ngọt ngào, nho khô và quế.', 2013, 55, 750, '5/5/2018', 80, 850000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Martell VSOP', 'martellvsop.jpg', 'martellvsop1.jpg', 'martellvsop2.jpg', N'Martell Vsop là loại rượu êm dịu, hương vị phức hợp tinh tế. Trên nhãn chai còn có chạm trổ Huy chương vàng và chân dung của vị vua Louis XIV, vị vua trị vì triều đại Pháp khi Martell ra đời vào năm 1715.', 1715, 45, 700, '9/2/2019', 42, 1050000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Johnnie Walker X.R', 'johnniewalkerxr.jpg', 'johnniewalkerxr1.jpg', 'johnniewalkerxr2.jpg', N'Đây là sản phẩm 21 năm tuổi đầy danh giá dành cho những sự kiện quan trọng. Được chế tác từ các loại whisky thượng hạng và được ủ trong những thùng gỗ sồi ít nhất là 21 năm cùng với sự hòa quyện hoàn hảo của mùi gỗ sồi lâu năm và hương vị vanilla phảng phất.', 1998, 50, 500, '3/3/2019', 28, 2650000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Hennessy XO', 'hennessyxo.jpg', 'hennessyxo1.jpg', 'hennessyxo2.jpg', N'Đây là sự pha trộn của hơn 100 loại rượu cốt khác nhau. Hennessy XO là sự kết hợp giữa vị cay cay của gỗ sồi, mùi da thuộc mới cùng với mùi thơm của hoa và trái cây chín mọng.', 2007, 55, 700, '5/8/2018', 17, 3700000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Vang Pháp Chateau Latour Grand Vin 2011', 'vangchateau2011.jpg', 'vangchateau20111.jpg', 'vangchateau20112.jpg', N'Kết hợp với hương thơm nhẹ nhàng mùi trái cây sấy khô cộng với vị tròn đều, mạnh mẽ của mật ong, hoa cỏ và trái cây tạo nên một Chateau Latour Grand Vin 2011 rất hiếm có.', 2011, 13, 750, '12/10/2018', 105, 850000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Chivas Revolve', 'chivasrevolve.jpg', 'chivasrevolve1.jpg', 'chivasrevolve2.jpg', N'Có hình dáng chai rượu đầy phá cách và lạ mắt. Đây là loại rượu Blended Scotch Whisky mịn có màu vàng hổ phách và mùi hương cân bằng của socola đắng, thạch nam đốt, táo đỏ và hạnh nhân nghiền và một ít vị khói.', 2000, 45, 750, '9/2/2019', 41, 1350000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Vang Pháp Chateau Pontet Fumet', 'vangchateaupontet.png', 'vangchateaupontet1.png', 'vangchateaupontet2.png', N'Mỗi bình sứ được bọc một cách cẩn thận trong một hộp nhung đỏ đầy tao nhã. Đỉnh cao nằm ở hương thơm của gỗ cây tuyết tùng và hương hạnh nhân nghiền đặc trưng kết hợp cùng với hương thơm đến từ những thùng gỗ sồi.', 2010, 14, 750, '6/8/2018', 75, 900000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Cardhu 12', 'cardhu12.jpg', 'cardhu121.jpg', 'cardhu122.jpg', N'Cardhu 12 được Diageo nhập khẩu trực tiếp vào Việt Nam và là một loại Whisky mạch nha có độ cân bằng, êm mượt và thoảng hương vị của táo, lê cùng một ít vị khói.', 2007, 40, 700, '11/3/2019', 39, 900000)
insert into Ruou(Ruou, Anhbia, Anh1, Anh2, Mota, NamSX, Nongdo, Dungtich, Ngaycapnhat, Soluong, Giaban)
values (N'Martell Cordon Bleu', 'martellcordonblue.jpg', 'martellcordonblue1.jpg', 'martellcordonblue2.jpg', N'Martell Cordon Bleu được pha chế vào năm 1912. Nhờ hương vị hấp dẫn rất đặc trưng, Cordon Bleu đã chiếm được một vị thế rất riêng trong dòng Cognac cũng như thu hút một lượng lớn giới sành điệu thưởng thức.', 1912, 52, 700, '9/12/2018', 21, 2000000)

create table ThanhToan
(
	MaTT int identity(1, 1),
	Thanhtoan nvarchar(50) not null,
	constraint PK_Thanhtoan primary key (MaTT)
)

insert into ThanhToan (Thanhtoan) values (N'Chuyển khoản ngân hàng')
insert into ThanhToan (Thanhtoan) values (N'Tiền mặt')
insert into ThanhToan (Thanhtoan) values (N'Ví điện tử')

create table DonDatHang
(
	MaDH int identity(1, 1),
	MaKH int,
	Ngaydat datetime,
	Diachigiao nvarchar(max),
	Tongtien decimal(18, 0),
	MaTT int,
	constraint PK_DonDH primary key (MaDH),
	constraint FK_Khachhang foreign key (MaKH) references KhachHang(MaKH),
	constraint FK_Thanhtoan foreign key (MaTT) references ThanhToan(MaTT)
)

insert into DonDatHang (Ngaydat, Diachigiao, Tongtien) values ('6/8/2018', N'16 Võ Văn Tần, Phường 5, Quận Tân Bình, TP.HCM', 11100000)
insert into DonDatHang (Ngaydat, Diachigiao, Tongtien) values ('12/1/2019', N'6 Chân Lý, Phường 15, Quận Thủ Đức, TP.HCM', 7900000)
insert into DonDatHang (Ngaydat, Diachigiao, Tongtien) values ('9/12/2018', N'131 Võ Thị Sáu, Phường 7, Quận 8, TP.HCM', 4500000)
insert into DonDatHang (Ngaydat, Diachigiao, Tongtien) values ('5/5/2018', N'15 Nguyễn Hữu Cảnh, Phường 11, Quận Bình Tân, TP.HCM', 4200000)
insert into DonDatHang (Ngaydat, Diachigiao, Tongtien) values ('10/4/2019', N'68/1 Nguyễn Thị Minh Khai, Phường 25, Quận 10, TP.HCM', 8500000)
insert into DonDatHang (Ngaydat, Diachigiao, Tongtien) values ('5/8/2018', N'9/3/1 Phạm Ngũ Lão, Phường 4, Quận 1, TP.HCM', 12000000)
insert into DonDatHang (Ngaydat, Diachigiao, Tongtien) values ('7/4/2018', N'17 Cách Mạng Tháng 8, Phường 7, Quận Gò Vấp, TP.HCM', 3600000)
insert into DonDatHang (Ngaydat, Diachigiao, Tongtien) values ('12/6/2018', N'27 Lý Thường Kiệt, Phường 9, Quận 10, TP.HCM', 56000000)
insert into DonDatHang (Ngaydat, Diachigiao, Tongtien) values ('1/5/2018', N'30 Tháng 4, Phường 6, Quận Phú Nhuận, TP.HCM', 13200000)
insert into DonDatHang (Ngaydat, Diachigiao, Tongtien) values ('11/12/2018', N'17 Võ Văn Ngân, Phường 25, Quận Thủ Đức, TP.HCM', 2520000)
insert into DonDatHang (Ngaydat, Diachigiao, Tongtien) values ('9/2/2019', N'15 Nguyễn Hữu Cảnh, Phường 11, Quận Bình Tân, TP.HCM', 3200000)
insert into DonDatHang (Ngaydat, Diachigiao, Tongtien) values ('4/3/2019', N'16 Võ Văn Tần, Phường 5, Quận Tân Bình, TP.HCM', 6300000)
insert into DonDatHang (Ngaydat, Diachigiao, Tongtien) values ('10/4/2019', N'27 Lý Thường Kiệt, Phường 9, Quận 10, TP.HCM', 13000000)
insert into DonDatHang (Ngaydat, Diachigiao, Tongtien) values ('30/3/2019', N'131 Võ Thị Sáu, Phường 7, Quận 8, TP.HCM', 10200000)

create table CTDatHang
(
	MaDH int,
	MaSP int,
	Soluong int check (Soluong > 0),
	Dongia decimal(18, 0) check (Dongia >= 0),
	constraint PK_CTDH primary key (MaDH),
	constraint FK_Dathang foreign key (MaDH) references DonDatHang(MaDH),
	constraint FK_Ruou foreign key (MaSP) references Ruou(MaSP)
)

insert into CTDatHang (MaDH, Soluong, Dongia) values (15, 3, 11100000) --15
insert into CTDatHang (MaDH, Soluong, Dongia) values (3, 1, 7900000) --3
insert into CTDatHang (MaDH, Soluong, Dongia) values (1, 5, 4500000) --18
insert into CTDatHang (MaDH, Soluong, Dongia) values (9, 4, 4200000) --8
insert into CTDatHang (MaDH, Soluong, Dongia) values (5, 10, 8500000) --16
insert into CTDatHang (MaDH, Soluong, Dongia) values (11, 6, 12000000) --20
insert into CTDatHang (MaDH, Soluong, Dongia) values (2, 9, 3600000) --4
insert into CTDatHang (MaDH, Soluong, Dongia) values (6, 1, 56000000) --9
insert into CTDatHang (MaDH, Soluong, Dongia) values (10, 12, 13200000) --2
insert into CTDatHang (MaDH, Soluong, Dongia) values (8, 6, 2520000) --1
insert into CTDatHang (MaDH, Soluong, Dongia) values (12, 2, 3200000) --10
insert into CTDatHang (MaDH, Soluong, Dongia) values (4, 7, 6300000) --19
insert into CTDatHang (MaDH, Soluong, Dongia) values (7, 5, 13000000) --7
insert into CTDatHang (MaDH, Soluong, Dongia) values (13, 15, 10200000) --12

create table Admin
(
	UserAdmin varchar(30) primary key,
	PassAdmin varchar(30) not null,
	Hoten nvarchar(50)
)

insert into Admin (UserAdmin, PassAdmin, Hoten) values ('admin', '123456', N'Tước Thiếu')
insert into Admin (UserAdmin, PassAdmin, Hoten) values ('user', '654321', N'Dung Ân')

set dateformat dmy;