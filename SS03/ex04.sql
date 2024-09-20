create database ex04;
use ex04;
create table class(
classId int AUTO_INCREMENT primary key,
className varchar(100),
startDate varchar(255),
status BIT(1) DEFAULT 1
);
insert into class(className,startDate) values
('HN-JV231103','2023-11-03'),
('HN-JV231229','2023-12-29'),
('HN-JV230615','2023-06-15');
create table student(
studentId int AUTO_INCREMENT primary key,
studentName varchar(100),
address varchar(255),
phone varchar(11),
class_id int REFERENCES class(classId),
status BIT(1) DEFAULT 1
);
insert into student(studentName,address,phone,class_id) values
('Hồ Da Hùng', 'Hà Nội', '0987654321',1),
('Phan Văn Giang', 'Đà Nẵng', '0967811255',1),
('Dương Mỹ Huyền', 'Hà Nội', '0385546611',2),
('Hoàng Minh Hiếu', 'Nghệ An', '0964425633',2),
('Nguyễn Vịnh', 'Hà Nội', '0975123552',3),
('Nam Cao', 'Hà Tĩnh', '0919191919',1),
('Nguyễn Du', 'Nghệ An', '0353535353',3);

create table subject(
subjectId int AUTO_INCREMENT primary key,
subjectName varchar(100),
credit int,
status BIT(1) DEFAULT 1
);
insert into subject(subjectName,credit) values
('Toán',3),
('Văn',3),
('Anh',2);
create table mark(
markId int AUTO_INCREMENT primary key,
student_id int REFERENCES student(studentId),
subject_id int REFERENCES subject(subjectId),
mark double,
examTime datetime
);
insert into mark(student_id,subject_id,mark,examTime) values
(1,1,7,'2024-05-12'),
(1,1,7,'2024-03-15'),
(2,2,8,'2024-05-15'),
(2,3,9,'2024-03-08'),
(3,3,10,'2024-02-11');

-- Hiển thị tất cả lớp học được sắp xếp theo tên giảm dần
select * from class
ORDER BY className;
-- Hiển thị tất cả học sinh có address ở “Hà Nội”
select * from student
where address = "Hà Nội";
-- Hiển thị tất cả học sinh thuộc lớp HN-JV231103
select * from student
join class on student.class_id =class.classId
where className = "HN-JV231103";
-- Hiển thị tát cả các môn học có credit trên 2
select * from subject
where credit >2;
-- Hiển thị tất cả học sinh có phone bắt đầu bằng số 09
select * from student
where phone like '09%';