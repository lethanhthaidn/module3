create database 04_bt_SQLfunctionpractice;
use quanlysinhvien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT MAX(credit)
FROM `subject`;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT `subject`.subid, `subject`.subname, mark.mark, max(mark)
FROM `subject`
join mark
on `subject`.subid = mark.subid;