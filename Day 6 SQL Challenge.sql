-- ==========================================
-- DATABASE CREATION
-- Tables:
-- Departments, Employees, Customers,
-- Products, Orders, Sales, MonthlySales, SalesTeam
-- ==========================================

CREATE DATABASE SQL_COMPANY_DB;
USE SQL_COMPANY_DB;


-- 1. DEPARTMENTS

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO Departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance'),
(4,'Sales'),
(5,'Marketing');


-- 2. EMPLOYEES

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

INSERT INTO Employees VALUES
(101,'Arun',2,55000,'Chennai'),
(102,'Bala',2,60000,'Madurai'),
(103,'Anitha',1,45000,'Trichy'),
(104,'David',3,NULL,'Coimbatore'),
(105,'Asha',4,70000,'Madurai'),
(106,'John',NULL,50000,'Salem'),
(107,'Kavin',4,80000,'Chennai'),
(108,'Meena',5,65000,'Madurai'),
(109,'Priya',2,60000,'Trichy'),
(110,'Ravi',4,80000,'Madurai');


-- 3. CUSTOMERS
-- Includes duplicates

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO Customers VALUES
(1,'Raj','raj@gmail.com','Madurai'),
(2,'Kumar','kumar@gmail.com','Chennai'),
(3,'Divya','divya@gmail.com','Madurai'),
(4,'Raj','raj@gmail.com','Madurai'),
(5,'Sneha','sneha@gmail.com','Trichy'),
(6,'Vijay','vijay@gmail.com','Chennai'),
(7,'Rani','rani@gmail.com','Madurai'),
(8,'Arun','arun@gmail.com','Salem');

-- 4. PRODUCTS

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(201,'Laptop','Electronics',55000),
(202,'Mobile','Electronics',25000),
(203,'Shoes','Fashion',3000),
(204,'Watch','Accessories',5000),
(205,'Tablet','Electronics',35000);

-- 5. ORDERS

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT
);

INSERT INTO Orders VALUES
(1001,1,201,'2025-01-10',1),
(1002,2,202,'2025-01-15',2),
(1003,1,203,'2025-02-05',3),
(1004,3,204,'2025-02-12',1),
(1005,4,202,'2025-03-01',1),
(1006,5,201,'2025-03-10',1),
(1007,1,205,'2025-04-05',1),
(1008,6,202,'2025-04-15',2),
(1009,1,204,'2025-05-01',1),
(1010,7,203,'2025-05-12',2),
(1011,1,202,'2025-06-01',1),
(1012,1,203,'2025-06-15',1);


-- 6. SALES

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    order_date DATE,
    product_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO Sales VALUES
(1,'2025-01-10',201,55000),
(2,'2025-01-15',202,50000),
(3,'2025-02-05',203,9000),
(4,'2025-02-12',204,5000),
(5,'2025-03-01',202,25000),
(6,'2025-03-10',201,55000),
(7,'2025-04-05',205,35000),
(8,'2025-04-15',202,50000),
(9,'2025-05-01',204,5000),
(10,'2025-05-12',203,6000),
(11,'2025-06-01',202,25000),
(12,'2025-06-15',203,3000);


-- 7. MONTHLY SALES

CREATE TABLE MonthlySales (
    month VARCHAR(20),
    sales DECIMAL(10,2)
);

INSERT INTO MonthlySales VALUES
('Jan',105000),
('Feb',14000),
('Mar',80000),
('Apr',85000),
('May',11000),
('Jun',28000);


-- 8. SALES TEAM

CREATE TABLE SalesTeam (
    emp_name VARCHAR(50),
    region VARCHAR(50),
    sales DECIMAL(10,2)
);

INSERT INTO SalesTeam VALUES
('Arun','South',80000),
('Bala','South',90000),
('Divya','North',70000),
('John','North',95000),
('Meena','East',60000),
('Priya','East',75000),
('Ravi','West',85000),
('Kavin','West',92000);

-- Single row SubQuery
select emp_name, salary from employees 
where Salary > (Select Avg(salary) avg_Salary from employees);

select * from employees;

select emp_name, salary from employees 
where Salary > (Select Salary from employees where emp_name = 'Ravi' );

select e.emp_name, e.salary , d.dept_name from employees e
join departments d on e.dept_ID  = d.dept_id
where e.Salary >  (Select Avg(e.salary) as Avg_Salary from employees e where d.dept_name = 'IT'  );

select * from employees;
select * from departments;

-- Multi Row Subquery

select e.emp_name, d.dept_name, e.city  from employees e 
join departments d on e.dept_ID  = d.dept_id
where City in ('Bangalore', 'Chennai');

select e.emp_name, d.dept_name ,e. City from employees e 
join departments d on e.dept_ID  = d.dept_id
where City in ('Puna');


select e.emp_name, e.salary , d.dept_name from employees e
	join departments d on e.dept_ID  = d.dept_id
where e.Salary > (Select avg(salary) from employees e2 
	join departments d2 on e2.dept_id = d2.dept_id where d2.dept_name = 'Marketing');
    
select avg(Salary) from employees where dept_id = 2;

select e.emp_name, e.salary , d.dept_name from employees e
	join departments d on e.dept_ID  = d.dept_id
where e.Salary > (Select avg(salary) from employees e2 
	join departments d2 on e2.dept_id = d2.dept_id where d2.dept_name = 'HR');
    
-- Corellated Subquery
    
select e.emp_name, e.salary , d.dept_name from employees e
join departments d on e.dept_ID  = d.dept_id
where e.Salary >  (Select Avg(e.salary) as Avg_Salary from employees e2 where e2.dept_id = e.dept_id );

select e.emp_name, e.salary , d.dept_name from employees e
	join departments d on e.dept_ID  = d.dept_id
where (e.dept_id , e.salary) in (select dept_id, Max(salary) from employees group by dept_id);

select e.emp_name, e.salary , d.dept_name from employees e
	join departments d on e.dept_ID  = d.dept_id
where e.salary < (select  Max(salary) from employees e2 where e2.dept_id = e.dept_id);
    
select e.emp_name, e.salary , d.dept_name from employees e
	join departments d on e.dept_ID  = d.dept_id
where e.salary = (select  Min(salary) from employees e2 where e2.dept_id = e.dept_id);

select e.emp_name, e.salary , d.dept_name from employees e
	join departments d on e.dept_ID  = d.dept_id where e.Salary > 70000;
    
select e.emp_name, e.salary , d.dept_name from employees e
	join departments d on e.dept_ID  = d.dept_id
where e.salary > (select  Min(salary) from employees e2 where e2.dept_id = e.dept_id);

select e.emp_name,d.dept_name from employees e
	join departments d on e.dept_ID  = d.dept_id
    where e.dept_id in (select dept_id from employees group by dept_id having Count(*) = 1);
    
select * from employees;
select * from departments;

    
alter table employees 
 add performance_Rating decimal(10,2);
 
update employees set performance_Rating = 3.5 where emp_id = 101;
update employees set performance_Rating = 4 where emp_id = 102;
update employees set performance_Rating = 4.5 where emp_id = 103;
update employees set performance_Rating = 2.8 where emp_id = 104;
update employees set performance_Rating = 3 where emp_id = 105;
update employees set performance_Rating = 3.8 where emp_id = 106;
update employees set performance_Rating = 4.5 where emp_id = 107;
update employees set performance_Rating = 2.8 where emp_id = 108;
update employees set performance_Rating = 3 where emp_id = 109;
update employees set performance_Rating = 3.2 where emp_id = 110;
 
 select * from employees;
 
 alter table employees 
 add Joining_Date Date;
 
update employees set Joining_Date = '2025-05-25' where emp_id = 101;
update employees set Joining_Date = '2025-07-10' where emp_id = 102;
update employees set Joining_Date = '2025-03-05' where emp_id = 103;
update employees set Joining_Date = '2025-02-09' where emp_id = 104;
update employees set Joining_Date = '2025-01-21' where emp_id = 105;
update employees set Joining_Date = '2025-08-29' where emp_id = 106;
update employees set Joining_Date = '2025-06-30' where emp_id = 107;
update employees set Joining_Date = '2025-09-03' where emp_id = 108;
update employees set Joining_Date = '2025-10-08' where emp_id = 109;
update employees set Joining_Date = '2025-02-10' where emp_id = 110;
 
 select emp_name, joining_Date from employees where joining_Date > (select joining_Date from employees where emp_name = 'Meena');
 
 select e.emp_name , d.dept_name , e.performance_Rating from employees e 
 join departments d on e.dept_id = d.dept_id
 where e.performance_Rating >= 4;
 
select e.emp_name, e.performance_Rating , d.dept_name from employees e
join departments d on e.dept_ID  = d.dept_id
where e.performance_Rating > (select avg(performance_Rating ) from employees );
 
select e.emp_name, e.Joining_Date, d.dept_name from employees e
join departments d on e.dept_ID  = d.dept_id
where e.Joining_Date > (select avg(Joining_Date ) avg_Date from employees );

select e1.emp_name, e1.salary , e1.Joining_Date from employees e1 
where e1.salary > ( select avg(e2. salary ) from employees e2 where e2.joining_Date > e1.Joining_Date );

