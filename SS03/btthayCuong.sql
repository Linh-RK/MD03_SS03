use baitapthayCuong;
alter table building add constraint c1 FOREIGN KEY (host_id) REFERENCES host(id);
alter table building add constraint c2 FOREIGN KEY (contractor_id) REFERENCES contractor(id);

alter table design add constraint c3 FOREIGN KEY (building_id) REFERENCES building(id);
alter table design add constraint c4 FOREIGN KEY (architect_id) REFERENCES architect(id);


alter table work add constraint c5 FOREIGN KEY (building_id) REFERENCES building(id);
alter table work add constraint c6 FOREIGN KEY (worker_id) REFERENCES worker(id);

-- Hiển thị toàn bộ nội dung của bảng Architect
select * from architect;
-- Hiển thị những năm sinh có thể có của các kiến trúc sư
select DISTINCT birthday from architect
where birthday is not null;
-- Hiển thị danh sách các kiến trúc sư (họ tên và năm sinh) (giá trị năm sinh tăng dần)
select name, birthday from architect
order by birthday;
-- Hiển thị danh sách các kiến trúc sư (họ tên và năm sinh) (giá trị năm sinh giảm dần)
select name, birthday from architect
order by birthday desc;
-- Hiển thị danh sách các công trình có chi phí từ thấp đến cao. Nếu 2 công trình có chi phí bằng nhau sắp xếp tên thành phố theo bảng chữ cái building
select * from building
order by cost, city;

-- Hiển thị tất cả thông tin của kiến trúc sư "le thanh tung"
select * from architect
where name = "le thanh tung";
-- Hiển thị tên, năm sinh các công nhân có chuyên môn hàn hoặc điện
select * from worker;
select * from worker
where skill in ("han","dien");
-- Hiển thị tên các công nhân có chuyên môn hàn hoặc điện và năm sinh lớn hơn 1948
select * from worker
where skill in ("han","dien") and birthday > 1948;
-- Hiển thị những công nhân bắt đầu vào nghề khi dưới 20 (birthday + 20 > year)
select * from worker
where year-birthday>20;
-- Hiển thị những công nhân có năm sinh 1945, 1940, 1948 (Bằng 2 cách)
select * from worker
where birthday in ("1945","1940","1948");
select * from worker
where birthday = "1945" or birthday = "1940" or birthday = "1948";

-- Tìm những công trình có chi phí đầu tư từ 200 đến 500 triệu đồng (Bằng 2 cách)
select * from building;
select * from building
where cost >= 200 and cost <= 500;

select * from building
where cost between 200 and 500;

-- Tìm kiếm những kiến trúc sư có họ là nguyen: % chuỗi
select * from architect
where name like "nguyen %";
-- Tìm kiếm những kiến trúc sư có tên đệm là anh
select * from architect
where name like "% anh %";
-- Tìm kiếm những kiến trúc sư có tên bắt đầu th và có 3 ký tự
select * from architect
where name like "%th_";
-- Tìm chủ thầu không có phone
select * from contractor;
select * from contractor
where phone is null;
