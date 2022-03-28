create database 04_bt_SQLfunctionpractice;
use quanlysinhvien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT MAX(credit)
FROM `subject`;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT sub.subid, sub.subname, m.mark, max(mark)
FROM `subject` sub
join mark m
on sub.subid = m.subid;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.studentid, s.studentname, avg(m.mark)
from student s
join mark m
on s.studentid = m.studentid
group by s.studentid, s.studentname
order by mark desc;