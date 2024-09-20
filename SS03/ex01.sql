CREATE DATABASE product_management;
USE product_management;
CREATE TABLE products(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
created DATE DEFAULT (NOW())
);
CREATE TABLE color(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
status BIT(1) DEFAULT 1
);
CREATE TABLE size(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
status BIT(1) DEFAULT 1
);
CREATE TABLE product_detail(
id INT AUTO_INCREMENT PRIMARY KEY,
product_id INT REFERENCES products(id),
color_id INT REFERENCES color(id),
size_id INT REFERENCES size(id),
price DOUBLE,
stock int,
status BIT(1) 
); 
INSERT INTO product_management.color(name) 
VALUES 
('RED'),
('BLUE'),
('GREEN');
INSERT INTO product_management.size(name) 
VALUES 
('S'),
('M'),
('L'),
('XL'),
('XXL');
INSERT INTO product_management.products(name, created) 
VALUES 
('Quần dài','1990-05-12'),
('Áo dài','2005-10-05'),
('Mũ phớt','1995-07-07');
INSERT INTO product_management.product_detail(product_id, color_id,size_id,price,stock,status) 
VALUES 
(1,1,1,1200,5,1),
(2,1,1,1500,2,1),
(1,2,3,500,3,1),
(1,2,3,1600,3,0),
(3,1,4,1200,5,1),
(3,3,5,1200,6,1),
(2,3,5,2000,10,0);

INSERT INTO product_management.product_detail(product_id, color_id,size_id,price,stock,status) 
VALUES 
(2,3,5,2000,10,0);
 SELECT * FROM product_detail
 WHERE price >1200;
 SELECT * FROM color;
 SELECT * FROM SIZE;
SELECT * FROM product_detail
 WHERE product_id=1;
 