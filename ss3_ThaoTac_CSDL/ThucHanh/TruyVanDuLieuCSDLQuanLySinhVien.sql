create database 03_th_truyvandulieuquanlysinhvien;
use quanlysinhvien;

SELECT *
FROM Student
WHERE `Status` = true;

SELECT *
FROM `Subject`
WHERE Credit < 10;

-- Join 2 bảng Student và Class
SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID;
-- Sử dụng câu lệnh Where C.ClassName ='A1' để hiển thị danh sách học viên lớp A1
SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

-- Hiển thị tất cả các điểm đang có của học viên
select s.studentid, s.studentname, sub.subname, m.mark
from student s join mark m  on s.studentid = m.studentid join `subject` sub on m.subid = sub.subid;

-- Sử dụng câu lệnh Where để hiển thị điểm môn CF cua các học viên
select s.studentid, s.studentname, sub.subname, m.mark
FROM Student S join Mark M on S.StudentId = M.StudentId join `Subject` Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';