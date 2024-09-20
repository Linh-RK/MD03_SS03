create database ex05;
use ex05;
create table accounts(
id int AUTO_INCREMENT primary key,
userName varchar(100),
password varchar(255),
address varchar(255),
status BIT(1) default 1
);
insert into accounts(userName,password,address) values
('Hung','123456','Nghe An'),
('Cuong','654321','Ha Noi'),
('Bach','135790','Ha Noi');

create table bill(
id int AUTO_INCREMENT primary key,
bill_type BIT(1) ,
acc_id int REFERENCES accounts(id),
created datetime,
auth_date datetime
);
insert into bill(bill_type,acc_id,created,auth_date) values
(0,1,'2022-02-11','2022-03-12'),
(0,1,'2023-10-05','2023-10-10'),
(1,2,'2024-05-15','2024-05-20'),
(1,3,'2022-02-01','2022-02-10');
create table product(
id int AUTO_INCREMENT primary key,
name varchar(100),
created datetime,
price double,
stock int,
status BIT(1) default 1
);
insert into product(name,created,price,stock) values
('Quan dai','2022-03-12',1200,5),
('Ao dai','2023-03-15',1500,8),
('Mu coi','1999-03-08',1600,10);
create table bill_detail(
id int AUTO_INCREMENT primary key,
bill_id int REFERENCES bill(id),
product_id int REFERENCES product(id),
quantity int,
price double
);
insert into bill_detail(bill_id,product_id,quantity,price) values
(1,1,3,1200),
(1,2,4,1500),
(2,1,1,1500),
(3,2,4,1500),
(4,3,7,1600);

-- Hiển thị tất cả account và sắp xếp theo user_name theo chiều giảm dần
select * from accounts
ORDER BY  userName DESC;
-- Hiển thị tất cả bill từ ngày 11/2/2023 đến 15/5/2023
select * from bill
where created BETWEEN '2023-02-11' and '2023-05-15';
-- Hiển thị tất cả bill_detail theo bill_id
select * from bill;

-- Hiển thị tất cả product theo tên và sắp xếp theo chiều giảm dần
select * from product
order by name desc;
;
-- Hiển thị tất cả product có số lượng lớn hơn 10
select * from product
where stock>10;
;
-- Hiển thị tất cả product còn hoạt động (dựa vào product_status)
select * from product
where status = true;
;