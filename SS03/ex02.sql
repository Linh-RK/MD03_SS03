create database QuanLyBanHang;
use QuanLyBanHang;
create table Customer(
cID int AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255),
cAge tinyint
);
insert into Customer(name,cAge) values
('Minh Quan',10),
('Ngoc Anh',20),
('Hong Ha',50);
create table Orders(
oID int AUTO_INCREMENT PRIMARY KEY,
cID int REFERENCES Customer(cID),
oDate datetime,
oTotalPrice int
);
insert into Orders(cID,oDate,oTotalPrice) values
(1,"2006-03-21",150000),
(2,"2006-03-23",200000),
(1,"2006-03-16",170000);
create table Product(
pID int AUTO_INCREMENT PRIMARY KEY,
pName varchar(100),
pPrice int
);
insert into Product(pName,pPrice) values
('May Giat',300),
('Tu Lanh',500),
('Dieu Hoa',700),
('Quat',100),
('Bep Dien',200),
('May Hut Mui',500);
create table OrderDetail(
oID int REFERENCES Orders(oID),
pID int REFERENCES Product(pID),
odQTY int
);
insert into OrderDetail(oID, pID,odQTY) values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

-- Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oID, oDate, oTotalPrice from Orders;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách hàng đó.

SELECT Customer.name, Product.pName
FROM OrderDetail
INNER JOIN Product ON OrderDetail.pID=Product.pID
INNER JOIN Orders ON OrderDetail.oID=Orders.oID
INNER JOIN Customer ON Orders.oID=Customer.cID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select * from Customer
where cID not in (
SELECT Orders.cID
FROM OrderDetail
INNER JOIN Orders ON OrderDetail.oID=Orders.oID);
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY * pPrice)
SELECT Customer.name, Product.pName
FROM OrderDetail
INNER JOIN Product ON OrderDetail.pID=Product.pID
INNER JOIN Orders ON OrderDetail.oID=Orders.oID
INNER JOIN Customer ON Orders.oID=Customer.cID;