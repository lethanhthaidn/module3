create database 03_th_themdulieuquanlysinhvien;
use quanlysinhvien;
insert into class
value(1,'A1','2008-12-20',1);
insert into class
value(2, 'A2', '2008-12-22', 1);
insert into class
value(3, 'B3', current_date, 0);

INSERT INTO Student (StudentName, Adress, Phone, `Status`, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Adress, `Status`, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Adress, Phone, `Status`, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO `Subject`
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO Mark (SubId, StudentId, Mark, ExamTime)
VALUES (1, 3, 8, 1),
       (3, 2, 10, 2),
       (2, 1, 12, 1);
select * from class;       
select * from `subject`;
select * from student;
select * from mark;