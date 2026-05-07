-- Create Database
CREATE DATABASE Sales_Analytics;
USE Sales_Analytics;

-----------------------------------------------------
-- 1. CUSTOMERS TABLE (30 CUSTOMERS)
-----------------------------------------------------
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    Gender VARCHAR(10),
    City VARCHAR(50),
    Email VARCHAR(100)
);

INSERT INTO Customers (CustomerName, Gender, City, Email) VALUES
('Arjun Kumar', 'Male', 'Chennai', 'arjun@gmail.com'),
('Priya Sharma', 'Female', 'Bangalore', 'priya@gmail.com'),
('John Mathew', 'Male', 'Mumbai', 'john@gmail.com'),
('Sneha Reddy', 'Female', 'Hyderabad', 'sneha@gmail.com'),
('Vikram Iyer', 'Male', 'Chennai', 'vikram@gmail.com'),
('Lakshmi Devi', 'Female', 'Coimbatore', 'lakshmi@gmail.com'),
('Rahul Verma', 'Male', 'Delhi', 'rahul@gmail.com'),
('Nisha Patel', 'Female', 'Ahmedabad', 'nisha@gmail.com'),
('Krishna Rao', 'Male', 'Hyderabad', 'krishna@gmail.com'),
('Ananya Gupta', 'Female', 'Pune', 'ananya@gmail.com'),
('Suresh Kumar', 'Male', 'Chennai', 'suresh@gmail.com'),
('Swati Singh', 'Female', 'Lucknow', 'swati@gmail.com'),
('Karan Malhotra', 'Male', 'Noida', 'karan@gmail.com'),
('Divya Menon', 'Female', 'Kochi', 'divya@gmail.com'),
('Amit Shah', 'Male', 'Surat', 'amit@gmail.com'),
('Pooja Mehta', 'Female', 'Mumbai', 'pooja@gmail.com'),
('Rajesh Nair', 'Male', 'Kerala', 'rajesh@gmail.com'),
('Harini Mohan', 'Female', 'Chennai', 'harini@gmail.com'),
('Rohit Singh', 'Male', 'Kanpur', 'rohit@gmail.com'),
('Meena Kumari', 'Female', 'Patna', 'meena@gmail.com'),
('Aditya Rao', 'Male', 'Hyderabad', 'aditya@gmail.com'),
('Neha Gupta', 'Female', 'Indore', 'neha@gmail.com'),
('Sameer Khan', 'Male', 'Bangalore', 'sameer@gmail.com'),
('Bhavana R', 'Female', 'Mysore', 'bhavana@gmail.com'),
('Raj Kumar', 'Male', 'Chennai', 'raj@gmail.com'),
('Sangeetha', 'Female', 'Bangalore', 'sangeetha@gmail.com'),
('Aravind', 'Male', 'Hyderabad', 'aravind@gmail.com'),
('Snehal', 'Female', 'Pune', 'snehal@gmail.com'),
('Joseph', 'Male', 'Kochi', 'joseph@gmail.com'),
('Maya', 'Female', 'Delhi', 'maya@gmail.com');

-----------------------------------------------------
-- 2. PRODUCTS TABLE
-----------------------------------------------------
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products (ProductName, Category, Price) VALUES
('Laptop', 'Electronics', 55000),
('Headphones', 'Electronics', 2500),
('Office Chair', 'Furniture', 9000),
('Keyboard', 'Electronics', 1500),
('Mouse', 'Electronics', 800),
('Monitor', 'Electronics', 12000);
INSERT INTO Products (ProductName, Category, Price) VALUES
('Webcam', 'Electronics', 3000),
('Tablet', 'Electronics', 20000),
('Desk Lamp', 'Furniture', 1500),
('Standing Desk', 'Furniture', 18000),
('Bluetooth Speaker', 'Electronics', 3500),
('USB Hub', 'Electronics', 700),
('Printer', 'Electronics', 8500),
('Pen Drive 64GB', 'Electronics', 600),
('Router', 'Electronics', 2500);

-----------------------------------------------------
-- 3. SALESPERSON TABLE
-----------------------------------------------------
CREATE TABLE Salespersons (
    SalespersonID INT PRIMARY KEY AUTO_INCREMENT,
    SalespersonName VARCHAR(100),
    Region VARCHAR(50),
    TargetAmount DECIMAL(10,2)
);

INSERT INTO Salespersons (SalespersonName, Region, TargetAmount) VALUES
('Meera', 'South', 300000),
('Rahul', 'North', 250000),
('Karthik', 'West', 200000),
('Neha', 'East', 180000);

-----------------------------------------------------
-- 4.ORDERS TABLE 
-----------------------------------------------------
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    SalespersonID INT,
    ProductID INT,
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (SalespersonID) REFERENCES Salespersons(SalespersonID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Sample Order Data
INSERT INTO Orders (CustomerID, SalespersonID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 1, 1, '2025-01-10'),   -- laptop
(2, 2, 3, 1, '2025-01-11'),   -- chair
(3, 1, 4, 3, '2025-01-12'),   -- keyboard
(4, 3, 1, 1, '2025-01-14'),   -- laptop
(5, 4, 2, 2, '2025-01-15'),   -- headphones
(6, 2, 6, 1, '2025-01-16'),   -- monitor
(1, 1, 2, 1, '2025-01-17'),   -- headphones
(3, 4, 5, 2, '2025-01-18'),   -- mouse
(2, 3, 1, 1, '2025-01-19'),   -- laptop
(4, 2, 3, 4, '2025-01-20'),   -- chairs
(5, 1, 6, 2, '2025-01-21'),   -- monitors
(6, 3, 4, 1, '2025-01-22'),   -- keyboard
(1, 4, 5, 3, '2025-01-23'),   -- mouse
(2, 1, 2, 2, '2025-01-24'),   -- headphones
(3, 3, 6, 1, '2025-01-25'),   -- monitor
(4, 4, 4, 2, '2025-01-26'),   -- keyboard
(5, 2, 1, 1, '2025-01-27'),   -- laptop
(6, 1, 3, 3, '2025-01-28'),   -- chair
(1, 3, 6, 1, '2025-01-29'),   -- monitor
(2, 4, 5, 2, '2025-01-30');   -- mouse


-- select +distinct
select distinct city from customers;
select distinct Category from products;
-- select + alias
select  CustomerName as Customer_Name, Email as Email_ID from customers;
select productname, price*2 as Double_price from products;
select productname, price*0.1 as Tax from products;
-- where clause with operators
select CustomerName from customers where city = 'Hyderabad';
select Price from products where Price >10000;
select* from orders where OrderDate >'2025-01-12';
select ProductName, price from products where Price !=1500;
select CustomerName from customers where Email is null;
select* from orders where quantity is not null;
select CustomerName from customers where gender = 'Female' and City = 'Chennai';
select CustomerName, City from customers where City in ('Chennai', 'Bangalore', 'Hyderabad');
select ProductName, Category from products where Category not in ('Electronics','Furniture');

-- order by and Limit
Select CustomerName from customers order by CustomerName asc;
select productName, price from products order by price desc limit 3; 
select productName, price from products where price> 5000 order by price desc limit 3;
select count(CustomerID) as No_of_Cust, City from customers group by City;
select CustomerName , City from customers where city in ('Chennai','Pune','Hyderabad') order by City asc;
select concat(City , '-', CustomerName) as Cust_Name_City from customers order by Cust_Name_City asc;
select  CustomerName, CustomerID from customers  where CustomerName like 'A%' order by CustomerID asc;
-- Group By and Having
select count(CustomerID) as Total_Customers from customers;
select City , count(CustomerID) as Total_Customers from customers group by City ;
select Gender , count(CustomerID) as Total_Customers from customers group by Gender ;
select City , Count(CustomerID) as Total_Customers from customers group by City;
select City , Count(CustomerID)  as Total_Customers from customers  group by City  having Total_Customers > 2 ;
select  Count(OrderID)  as Total_Orders from orders  group by CustomerID  having Total_Orders > 3 ;
select* from orders;
select  ProductID from orders  group by Quantity  having Quantity between 3 and 5;
select Category, avg(Price) as Avg_Price from products group by Category having Avg_Price > 5000;


-- Joins
USE Sales_Analytics;
select o.orderID, c.CustomerName from orders o
inner join customers c on o.OrderID = c.CustomerID;

select c.CustomerName , o.OrderDate from Customers c
Left join orders o on c.CustomerID = o.OrderID;

select  o.OrderDate, s.SalespersonName from Salespersons s
Right join Orders o on s.SalespersonID = o.SalespersonID;

select* from Salespersons;

select o.OrderID, o.OrderDate, o.Quantity, c.CustomerName, p.ProductName from orders o
join customers c on o.CustomerID = c.CustomerID
join products p on o. CustomerID = p.ProductID order by OrderID;

select o.OrderID, o.OrderDate , c.City , p.ProductName from orders o 
join customers c on o.CustomerID = c.CustomerID
join products p on o. CustomerID = p.ProductID where City = "Chennai";

select o.OrderDate , c.CustomerName,  p.ProductName, p.Category from orders o 
join customers c on o.CustomerID = c.CustomerID
join products p on o.CustomerID = p.ProductID where p.ProductName  = "Laptop";

Select * from products;

-- Built in function
USE Sales_Analytics;
select o.Quantity*p.Price  as total_Price from orders o
	join products p on o.productID = p.productID;
    
select distinct o.Quantity*p.Price as Total_Price , c.CustomerName from orders o
	join products p on o.productID = p.productID
    join customers c on o.CustomerID = c.CustomerID order by Total_price desc limit 5;
    
select * from salespersons;

select o.Quantity*p.Price as Total_Sale_Price, Region ,TargetAmount from orders o 
	join products p on o.productID = p.productID
	join salespersons s on o.SalespersonID = s.SalespersonID;
    
select o.Quantity*p.Price as Total_Price , p.productName from orders o
	join products p on o.productID = p.productID order by Total_price desc;
    
select min(OrderDate) earliest_order from orders;
select max(OrderDate) earliest_order from orders;

select * from orders;

-- Date and Time function
select * from orders where OrderDate between "2025-01-01 "and "2025-01-31";

-- window function
select orderid, customerID,OrderDate,Count(orderID) over (partition by CustomerID) as Total_Orders_by_Customer
from orders;

select productName , price , Avg(price) over () as Avg_Price from products;

select ProductName, Price,
	Rank() over (order by price desc) as ranks
from products ;

select SalespersonID ,Quantity as Total_Quantity , Count(SalespersonID) over (partition by SalespersonID) as Total_Orders_by_Salesperson 
from orders;

USE Sales_Analytics;

select s. SalespersonName,sum(o.Quantity*p.Price) as Total_Sales,
	Rank() over (order by sum(o.Quantity * p.price) desc) as Sales_rank from orders o
    	join products p on o.productID = p.productID
		join salespersons s on o.SalespersonID = s.SalespersonID group by SalespersonName;
        
select productName , price ,Category ,
	dense_Rank() over (partition by Category  order by price asc)  as Product_Rank from products order by category,price;
    
    select * from products;
    
select CustomerID, OrderDate ,
	Lag(OrderDate) over () as Previous_OrderDate from orders;
    
select CustomerID, OrderDate ,
	Lead(OrderDate) over () as Previous_OrderDate from orders;
    
select o.OrderDate, o.Quantity* p.price as Daily_Sales,
	sum(o.Quantity*p.price) over (partition by s.SalespersonName order by o.OrderDate)as Running_Total from orders o 
	join products p on o.productID = p.productID
	join salespersons s on o.SalespersonID = s.SalespersonID;
    
select distinct ProductName, price , dense_rank() over( order by Price desc) as Top_3_Products from products limit 3;
	USE Sales_Analytics;
