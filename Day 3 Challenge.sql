use school_db;
Create table Student_DB(
	Student_id int auto_increment primary key,
    Rollno int unique not null,
    Name Varchar(50) not null,
    Age int check (Age >=18),
    Gender varchar(20) check (Gender IN ('Male','Female')),
    Email Varchar(50) unique,
    Admission_Date date default(curdate())
);

describe table Student_DB;
insert into Student_DB(Student_id,Rollno,Name,Age,Gender,Email,Admission_Date)
Values
	(1,101,'ashwin',25,'Male','ashwin@mail.com','2026-03-02');
    
insert into Student_DB(Rollno,Name,Age,Gender,Email,Admission_Date)
Values
(102,'Gayathri',26,'Female','Gayu@mail.com','2026-04-01'),
(103,'Vinitha',23,'Female','Vinitha@mail.com','2026-01-10'),
(104,'Arjun',25,'Male','Arjun@mail.com','2026-01-20'),
(105,'Lakshmi',21,'Female','Lakshmi@mail.com','2026-03-25'),
(106,'Aarthi',27,'Female','Aarthi@mail.com','2026-05-23'),
(107,'Suriya',21,'Male','Suriya@mail.com','2026-01-06'),
(108,'Viji',24,'Female','Viji@mail.com','2026-02-20'),
(109,'Gowtham',25,'Male','Gowtham@mail.com','2026-02-28'),
(110,'Vijay',28,'Female','Vijay@mail.com','2026-01-02');

select * from Student_DB;

update Student_DB
set Age = 29
where Student_id = 5;

select * from Student_DB;

insert into Student_DB(Rollno,Name,Age,Gender,Email)
Values
	(111,'Bob',28,'Male','bob@mail.com');
select * from Student_DB;
delete from Student_DB where Student_id = 11;

select * from Student_DB;
use school_db;
select * from Student_DB;


-- 1️.Create Database
CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- 2️.Create Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0)
);

-- 3️.Create Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    sale_amount DECIMAL(10,2) CHECK (sale_amount > 0),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- 4️.Insert Sample Data into Product Table
INSERT INTO Product (product_id, product_name, price) VALUES
(1, 'Laptop', 85000.00),
(2, 'Smartphone', 45000.00),
(3, 'Headphones', 5000.00),
(4, 'Keyboard', 1200.00),
(5, 'Mouse', 800.00),
(6, 'Monitor', 15000.00),
(7, 'Webcam', 3500.00);

-- 5️.Insert Sample Data into Sales Table
INSERT INTO Sales (sale_id, product_id, quantity, sale_amount) VALUES
(1, 1, 2, 170000.00),
(2, 2, 3, 135000.00),
(3, 3, 5, 25000.00),
(4, 4, 10, 12000.00),
(5, 5, 15, 12000.00),
(6, 6, 2, 30000.00),
(7, 7, 4, 14000.00);
-- Distinct Command 
select distinct product_name from product as Product_Name;
select distinct product_id from Sales;
select distinct price from Product as Product_Price;
-- Where Clause
Select price from Product where price > 10000;
Select price from Product where price < 5000;
Select sale_amount from Sales where quantity = 2;
-- Comparison Operators
Select product_name from Product where price >= 15000;
Select quantity from Sales where quantity != 5;
-- Arithmatic Operators
select product_name , price*0.1 as Total_Price from Product;
Select sale_amount , sale_amount +500 as Total_Sale_amount from Sales;
-- Logical Operators
Select product_name from Product where price > 5000 and price < 50000;
Select * from Sales where quantity = 2 or quantity = 4;
-- is null/ is not null
select * from Sales where product_id is null;
select product_name from product where price is not null;
-- in and Not in
select product_name from Product where product_id in (1,3,5);
select product_name from Product where product_id not in (2,4,6);
-- between and not between
select product_name from Product where price between 1000 and 20000;
select product_name from Product where price not between 5000 and 50000;
-- like and not like
select product_name from Product where product_name like 'M%';
select product_name from Product where product_name like '%e';
select product_name from Product where product_name like '%phone%';
select product_name from Product where product_name not like 'S%';
-- Mixed Questions
select product_name from Product where price between 1000 and 20000 and product_name like 'M%';
Select * from Sales where quantity between 2 and 10;
select product_name from Product where product_id in (1,2,3) and price > 5000;
select distinct quantity from Sales;

USE ECommerceDB;
-- order by and limit
select product_id, product_name,price from product order by price desc limit 3;
-- aggregate function
select sum(sale_amount) from sales;
select count(sale_id) from sales;
select avg(sale_amount) from sales;
select max(sale_amount) from sales;
select min(sale_amount) from sales;
-- group by and having

select product_name, sum(price) as Total_price from product group by product_name ;
select product_name, sum(price) as Total_price from product group by product_name having Total_price > 10000;

-- window functions

select product_id, product_name, price,
	Rank() over (order by price desc) as ranks
from product ;


select product_id, product_name, price,
	dense_Rank() over (order by price desc) as Dense_ranks
from product ;
