-- Buoc 1
create database 05_bt_View_Index_StoreProcedure;
use 05_bt_View_Index_StoreProcedure;
-- Buoc 2
create table if not exists Products(
Id int primary key not null auto_increment,
productCode varchar(20) not null unique,
productName varchar(20) not null,
productPrice int not null,
productAmount int not null,
productDescription varchar(100) not null,
productStatus varchar(20) not null
);
INSERT INTO products (productCode, productName, productPrice, productAmount, productDescription,productStatus)
VALUES ('06','samsung', 5000, 165, 1, 1),
('02','iphone', 10000, 646, 1, 1),
('03','xiaomi', 6000, 894, 1, 1),
('04','nokia', 7000, 262, 1, 1),
('05','oppo', 4000, 589, 1, 1);
select * from products;
drop table products;

-- Buoc 3

-- Buoc 4
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_views as
select productcode, productname, productprice, productstatus
from products;
select * from product_views;
-- sửa đổi view
create or replace view product_views as
select productcode, productname, productprice, productstatus
from products
where productprice>5000;
-- xoá view
drop view product_views;

-- Buoc 5
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE findAllProduct()

BEGIN

  SELECT * FROM products;

END //

DELIMITER ;
call findAllProduct();
-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE insertProduct(
in productId int,
in productCode varchar(20),
in productName varchar(20),
in productPrice int,
in productAmount int,
in productDescription varchar(100),
in productStatus varchar(20)
)
BEGIN

INSERT INTO products (productCode, productName, productPrice, productAmount, productDescription,productStatus)
VALUES (productCode, productName, productPrice, productAmount, productDescription,productStatus);

END //
DELIMITER ;
call insertProduct('07','sony', 8000, 200, 1, 1);

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE editProduct(
in productId int,
in productCode varchar(20),
in productName varchar(20),
in productPrice int,
in productAmount int,
in productDescription varchar(100),
in productStatus varchar(20)
)

BEGIN

update products

set productCode =productCode,
 productName = productName,
 productPrice =productPrice,
 productAmount =productAmount,
 productDescription= productDescription, 
 productStatus =productStatus
 where Id = productId;
END //
DELIMITER ;
call editProduct(3,'09','sony', 8000, 200, 1, 2);
drop procedure IF EXISTS editProduct;
select * from products;

-- Tạo store procedure xoá sản phẩm theo id

DELIMITER //
CREATE PROCEDURE deleteProduct(
in productId int
)

BEGIN

delete from products
where Id = productId;

END //
DELIMITER ;
call deleteProduct(6);
drop procedure IF EXISTS deleteProduct;
select * from products;