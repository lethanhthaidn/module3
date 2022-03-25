create database 04_th_sudunghamSQL;
use quanlysinhvien;
-- Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi
select adress, count(studentid) as 'so luong hoc vien'
from student
group by adress;

-- Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
select s.studentid, s.studentname, avg(mark) as 'avg(mark) trung binh cac mon'
from student s
join mark m
on s.studentid = m.studentid
group by s.studentid, s.studentname;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select s.studentid, s.studentname, avg(mark) as 'avg(mark) trung binh cac mon'
from student s
join mark m
on s.studentid = m.studentid
group by s.studentid, s.studentname
having avg(mark) >=10;

-- Sử dụng Having và All để tìm học viên có điểm trung bình lớn nhất.
SELECT S.StudentId, S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);
