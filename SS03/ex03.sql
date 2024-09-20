create database ex03;
use ex03;
create table PhieuXuat(
soPX int AUTO_INCREMENT PRIMARY key,
ngayXuat datetime
);
insert into PhieuXuat(ngayXuat) values
('2024-09-10'),
('2024-05-10'),
('2024-04-10'),
('2024-06-10'),
('2024-08-10');

create table PhieuNhap(
soPN int AUTO_INCREMENT PRIMARY key,
ngayNhap datetime
);

insert into PhieuNhap(ngayNhap) values
('2023-09-10'),
('2023-05-10'),
('2023-04-10'),
('2023-06-10'),
('2023-08-10');
create table MaVatTu(
maVT int AUTO_INCREMENT PRIMARY key,
tenVT varchar(255)
);
insert into MaVatTu(tenVT) values
('xi mang'),
('thep'),
('cat vang'),
('da'),
('gach');
create table NhaCungCap(
maNCC int AUTO_INCREMENT PRIMARY key,
tenNCC varchar(255),
diaChi varchar(255),
soDienThoai varchar(11)
);
insert into NhaCungCap(tenNCC, diaChi, soDienThoai) values
('sao mai','HN','0987654321'),
('hoang ha','HP','0987654322'),
('hai phong','QN','0987654323'),
('duc phuc','VT','0987654324'),
('cat loi','DN','0987654325');
create table DonDatHang(
soDH int AUTO_INCREMENT PRIMARY key,
maNCC int REFERENCES NhaCungCap(maNCC),
ngayDH datetime
);
insert into DonDatHang(maNCC, ngayDH) values
('1','2024-10-10'),
('1','2024-10-18'),
('2','2024-10-15'),
('3','2024-10-22'),
('4','2024-10-12');
create table PhieuNhapChiTiet(
soPN int REFERENCES PhieuNhap(soPN),
maVT int REFERENCES MaVatTu(maVT),
primary key (soPN,maVT),
donGiaNhap double,
soLuongNhap int
);
insert into PhieuNhapChiTiet(soPN,maVT,donGiaNhap,soLuongNhap) values
(1,2, 100, 20),
(1,4, 300, 10),
(2,1, 500, 3),
(3,5, 200, 5),
(4,3, 400, 8),
(5,2, 100, 12);
create table PhieuXuatChiTiet(
soPX int REFERENCES PhieuXuat(soPX),
maVT int REFERENCES MaVatTu(maVT),
primary key (soPx,maVT),
donGiaXuat double,
soLuongXuat int
);
insert into PhieuXuatChiTiet(soPX,maVT,donGiaXuat,soLuongXuat) values
(1,2, 150, 10),
(1,4, 350, 2),
(2,1, 550, 1),
(3,5, 250, 2),
(4,3, 450, 5),
(5,2, 150, 10);
create table ChiTietDonHang(
maVT int REFERENCES MaVatTu(maVT), 
soDH int REFERENCES DonDatHang(soDH),
primary key (maVT,soDH)
);
insert into ChiTietDonHang(maVT,soDH) values
(1,1),
(2,2),
(3,2),
(3,3),
(1,4),
(2,5);

SELECT vt.*, sum(pxct.soLuongXuat)AS qty 
from MaVatTu vt
join PhieuXuatChiTiet pxct on pxct.maVT = vt.maVT
GROUP BY vt.maVT
ORDER BY qty DESC
;
-- Tìm danh sách vật tư có trong kho nhiều nhất
select vt.*, sum(pnct.soLuongNhap) - sum(pxct.soLuongXuat) as 'ton kho' from MaVatTu vt
join PhieuNhapChiTiet pnct on vt.maVT= pnct.maVT
join PhieuXuatChiTiet pxct on vt.maVT= pxct.maVT
group by vt.maVT;

-- Tìm ra danh sách nhà cung cấp có đơn hàng từ ngày 12/2/2024 đến 22/2/2024
SELECT tenNCC, diaChi, soDienThoai
FROM NhaCungCap
JOIN DonDatHang ON NhaCungCap.maNCC = DonDatHang.maNCC
WHERE DonDatHang.ngayDH BETWEEN '2024-02-12' AND '2024-02-22';
-- Tìm ra danh sách vật tư đươc mua ở nhà cung cấp từ ngày 11/1/2024 đến 22/2/2024
SELECT ChiTietDonHang.maVT, tenVT
FROM ChiTietDonHang 
JOIN DonDatHang  ON ChiTietDonHang.soDH = DonDatHang.soDH
JOIN MaVatTu ON ChiTietDonHang.maVT = MaVatTu.maVT
WHERE DonDatHang.ngayDH BETWEEN '2024-01-11' AND '2024-02-22';
