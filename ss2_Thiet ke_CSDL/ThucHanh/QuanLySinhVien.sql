create database quanlysinhvien;
use quanlysinhvien;
create  table if not exists class(
classid int primary key not null auto_increment,
classname varchar(60) not null,
startdate datetime not null,
`status` Bit
);

create table if not exists student(
studentid int primary key not null auto_increment,
studentname varchar(30) not null,
adress varchar(50),
phone varchar(20),
`status` bit,
classid int not null,
foreign key (classid) references class (classid)
);
create table if not exists `subject`(
subid int not null primary key auto_increment,
subname varchar(30) not null,
credit tinyint not null default 1,
check (credit>=1),
`status` bit
);
create table if not exists mark(
markid int not null primary key auto_increment,
subid int not null unique,
studentid int not null unique,
mark float default 0,
check (mark between 0 and 100),
examtime tinyint default 1,
foreign key(subid) references `subject` (subid),
foreign key(studentid) references student (studentid)
);

select * from class;       
select * from `subject`;
select * from student;
select * from mark;
