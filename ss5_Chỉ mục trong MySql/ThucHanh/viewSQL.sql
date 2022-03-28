-- Tạo View có tên customer_views truy vấn dữ liệu từ bảng customers để lấy các dữ liệu: customerNumber, customerName, phone bằng câu lệnh SELECT:
CREATE VIEW customer_views AS

SELECT customerNumber, customerName, phone

FROM  customers;
-- Ta đã có 1 bảng ảo customer_views, và sau đó chúng ta hoàn toàn có thể lấy dữ liệu từ bảng ảo này bằng lệnh:
select * from customer_views;

-- Cập nhật view
CREATE OR REPLACE VIEW customer_views AS

SELECT customerNumber, customerName, contactFirstName, contactLastName, phone, city

FROM customers

WHERE city = 'Nantes';

-- Xoá view

DROP VIEW customer_views;