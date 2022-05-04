create database demo;
use demo;
create table users(
id int(3) not null auto_increment,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

