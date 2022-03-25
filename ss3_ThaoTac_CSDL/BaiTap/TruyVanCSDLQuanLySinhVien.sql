create database 03_bt_truyvanCSDLquanlysinhvien;
drop database 03_bt_truyvancsdlquanlysinhvien;
use quanlysinhvien;
--  tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT *
FROM student 
WHERE studentname LIKE  "h%";
--  lớp học có thời gian bắt đầu vào tháng 12.
SELECT *
FROM class
WHERE month (startdate) = 12;
-- thông tin môn học có credit trong khoảng từ 3-5.
select *
from `subject`
where credit between 3 and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.

update student
set studentid = 4
where studentname = 'hung';
select*from student;
