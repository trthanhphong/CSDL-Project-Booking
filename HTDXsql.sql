use master;
Drop database HeThongDieuPhoi_CSDL;

-- Tạo CSDl 
Create database HeThongDieuPhoi_CSDL;

-- Sử sụng cơ sở dữ liệu
go
use HeThongDieuPhoi_CSDL;
go

-- Tạo bảng USER
create table Users(
	ID int NOT NULL Primary key,
	HoTen nvarchar(50),
	SDT nvarchar(11) NOT NULL,
	MatKhau nvarchar(50),
	CreatedAt datetime, 
	UpdatedAt datetime
);

-- Tạo bảng DriverState
create table DriverState(
	DriverId int NOT NULL Primary key,
	BienSoXe nvarchar(50),
	TrangThai int NOT NULL,
	LatCurrrent float,
	LongCurrernt float,
	Duong nvarchar(100),
	PhuongXa nvarchar(100),
	QuanHuyen nvarchar(100),
	TinhTP nvarchar(max),
	CreatedAt datetime, 
	UpdatedAt datetime
);

-- Tạo bảng CUỐC XE
create table CuocXe(
	MaCuoc int NOT NULL Primary key,
	MaKhachHang int NOT NULL,
	MaTaiXe int NOT NULL,
	MaTaxi nvarchar(50),
	DiemDoan nvarchar(max),
	LatStart float,
	LongStart float,
	DiemDen nvarchar(max),
	LatDes float,
	LongDes float,
	KhoangCach float,
	NgayChay date,
	GioKhoiHanh time,
	GioKetThuc time,
	TrangThai int,
	DanhGia nvarchar(max),
	TongTien float,
	CreatedAt datetime, 
	UpdatedAt datetime

);

-- Tạo bảng TAXI
create table Taxi(
	BienSoXe nvarchar(50)Primary key,
	LoaiXe int,
	CreatedAt datetime, 
	UpdatedAt datetime
);

-- Tạo bảng LOAIXE
create table LoaiXe(
	MaLoaiXe int Primary key,
	SoGhe int,
	DonGia float
);

-- Tạo bảng roles
create table Roles(
	RoleId int Primary key,
	NameRole nvarchar(50),
);

-- Tạo bảng uers role
create table UserRoles(
	UserId int NOT NULL ,
	RoleId int NOT NULL, 
	Primary key(UserId,RoleId)
);

-- Bổ sung khóa ngoại
-- Bảng Taxi
go 
alter table Taxi
	add constraint fk_Taxi_LoaiXe
	foreign key (LoaiXe)
	references LoaiXe (MaLoaiXe);

-- Bảng DriverState
go 
alter table DriverState
	add constraint fk_DriverSate_BienSoXe
	foreign key (BienSoXe)
	references Taxi (BienSoXe);

-- Bảng Cuốc xe
		go 
alter table CuocXe
	add constraint fk_CuocXe_BienSoXe
	foreign key (MaTaxi)
	references Taxi (BienSoXe);

alter table CuocXe
	add constraint fk_CuocXe_MaKhachHang
	foreign key (MaKhachHang)
	references Users (ID);

alter table CuocXe
	add constraint fk_CuocXe_MaTaiXe
	foreign key (MaTaiXe)
	references Users (ID);

-- Bảng UserRole
		go 
alter table UserRoles
	add constraint fk_UserRole_UserId
	foreign key (RoleId)
	references Roles (RoleId);

alter table UserRoles
	add constraint fk_UserRole_User
	foreign key (UserId)
	references Users (ID);

/*drop table Users;
drop table DriverState;
drop table Taxi;
drop table CuocXe;
drop table LoaiXe;
drop table Roles;
drop table UserRoles;*/


-- THÊM DỮ LIỆU VÀO BẢNG
	--Bảng Users
	insert into Users (ID,HoTen,SDT,MatKhau,CreatedAt, UpdatedAt ) values
	(1,N'Trần Thanh Phong','0328321525','phong123','05/05/2023','05/05/2023'),
	(2,N'Nguyễn Thanh Hương','0328596540','a12345','04/03/2023','04/03/2023'),
	(3,N'Nguyễn Phúc Luân','0986859799','abc123','10/10/2023','10/11/2023'),
	(4,N'Trần Tấn Tài','0376996799','Tai1705','05/06/2023','05/07/2023'),
	(5,N'Trần Ngọc Yến Như','0378965211','12345','05/04/2023','05/04/2023'),
	(6,N'Lê Trung Chiến','0378965333','12345','05/04/2023','05/04/2023')

	--Bảng Loại xe
	insert into LoaiXe(MaLoaiXe, SoGhe, DonGia) values
	(1,4,8000),
	(2,7,10000),
	(3,7,12000)

	--Bảng taxi
	insert into TAXI(BienSoXe, LoaiXe, CreatedAt, UpdatedAt) values
	('64B1-94135',1,'11/22/2023','11/22/2023'),
	('59S1-13579',1,'11/22/2023','11/22/2023'),
	('72A1-66677',2,'11/22/2023','11/22/2023'),
	('59V1-94135',2,'11/22/2023','11/22/2023'),
	('59V1-26666',2,'11/22/2023','11/22/2023'),
	('59E1-34567',3,'11/22/2023','11/22/2023'),
	('59C2-99999',3,'11/22/2023','11/22/2023'),
	('59K1-89899',3,'11/22/2023','11/22/2023')

	--Bảng DriverState , N'Nguyễn Văn Long','0969321654'  N'Lâm Đình Khoa','0989874561', N'Trần Tú Như','0909654789', N'Ngô Thanh Nhàn','0931472589', N'Nguyễn Phúc Hân','0973214567', N'Tô Lâm','0969321654'
	insert into DriverState(DriverId, BienSoXe,TrangThai,LatCurrrent, LongCurrernt, Duong, PhuongXa, QuanHuyen, TinhTP,CreatedAt, UpdatedAt) values
	(1,'64B1-94135',0,10.80358802139973, 106.66493890878085, N'12 Phan Đình Giót',N'Phường 2', N'Quận Tân Bình', N'TP HCM','11/22/2023','11/22/2023'),
	(2,'59C2-99999',1,10.822234268889186, 106.68749403087087, N'12 Nguyễn Văn Bảo',N'Phường 4', N'Quận Gò Vấp', N'TP HCM','11/22/2023','11/22/2023'),
	(3,'59E1-34567',2,10.777095215205978, 106.70328407731053, N'7 Công Trường Lam Sơn',N'Phường Bến Nghé', N'Quận 1', N'TP HCM','11/22/2023','11/22/2023'),
	(4,'59K1-89899',1,10.801430170627556, 106.70862703761675, N'299 Điện Biên Phủ',N'Phường 15', N'Quận Bình Thạnh', N'TP HCM','11/22/2023','11/22/2023'),
	(5,'72A1-66677',0,10.805044939601153, 106.69457226251421, N'47 Nguyễn Huy Lượng',N'Phường 7', N'Quận Bình Thạnh', N'TP HCM','11/22/2023','11/22/2023'),
	(6,'59V1-26666',0,10.777095215205978, 106.70328407731053, N'7 Công Trường Lam Sơn',N'Phường Bến Nghé', N'Quận 1', N'TP HCM','11/22/2023','11/22/2023')

	
	--Bảng Cuốc xe 10.786269516419686, 106.65312833388649
	insert into CUOCXE(MaCuoc, MaKhachHang, MaTaiXe, MaTaxi, DiemDoan, LatStart, LongStart,
	DiemDen, LatDes, LongDes, KhoangCach, NgayChay, GioKhoiHanh, GioKetThuc, TrangThai, DanhGia, TongTien, CreatedAt, UpdatedAt) values
	(1,1, 2,'64B1-94135',N'14/9 Đường số 12, Tăng Nhơn Phú B, TP Thủ Đức', 10.838224992415398, 106.77412901860261,
	N'01 Võ Văn Ngân Phường Linh Chiểu, TP Thủ Đức', 10.85081151856429, 106.7719452817971,1.8, '05/05/2023','09:30:12','09:45:18',1, N'Tốt', 14400,'11/22/2023','11/22/2023'),
	(2,3, 4,'59V1-26666',N'22 Bà Hạt, Phường 9, Quận 5, THCM', 10.764834828897648, 106.67109101598979,
	N'341 Đường Sư Vạn Hạnh, Phường 10, Quận 10, Thành phố Hồ Chí Minh', 10.768834337281476, 106.67003015396853,2.2, '10/8/2023','14:30:12','09:38:40',1, N'Tốt', 26400,'11/22/2023','11/22/2023'),
	(3,5, 2,'72A1-66677',N'300 Nam Kì Khởi Nghĩa, Phường 8, Quận 1, THCM', 10.790357996984001, 106.68356485819652,
	N'32 Nguyễn Văn Bảo, Phường 4, Gò Vấp, Thành phố Hồ Chí Minh', 10.823488891934922, 106.68602404977099,4.3, '4/3/2023','17:35:12','17:46:40',1, N'Tốt', 51600,'11/22/2023','11/22/2023')

	--Bảng Roles
	insert Roles(RoleId,NameRole) values
	(1,N'Custumer' ),
	(2,N'Driver'),
	(3,N'Admin' )

	--Bảng UserRoles
	insert UserRoles(UserId,RoleId) values
	(1,1),
	(2,2),
	(3,1),
	(4,2),
	(5,1),
	(6,3)