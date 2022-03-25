create database quanlybanhang;
use quanlybanhang;
create table customer(
cid int primary key not null,
cname varchar(20) not null,
cage int not null
);
create table `order`(
oid int primary key not null,
cid int not null,
odate datetime not null,
ototalprice double not null,
foreign key (cid) references customer (cid)
);
create table product(
pid int primary key not null,
pname varchar(20),
pprice double not null
);
create table oderdetail(
oid int not null,
pid int not null,
odQTY int not null,
foreign key (oid) references `order` (oid),
foreign key (pid) references product (pid)
);
select * from product;

