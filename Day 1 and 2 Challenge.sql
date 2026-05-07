Create database Hospital_DB;   -- Create the DB--
use Hospital_DB; -- Access the DB--
Create Table Patients(
	Patient_ID int,
    Patient_name Varchar(20),
    Age int,
    Gender Varchar(10),
    Admission_Date Date
    );			-- Create the Table and assign the columns --
    
    Alter table Patients
	add column Doctor_Assigned VARCHAR(50);   -- Add a new Column--
    
    Alter table Patients
    modify column Doctor_Assigned Varchar(100); -- Modify the Data Type len --

Rename table Patients to Patients_info;

truncate Patients_info;
use Hospital_DB;

Drop Database Hospital_DB;


create database Online_Bookstore_DML;
use Online_Bookstore_DML;

create table Books(
	BookID INT PRIMARY KEY,
	Title VARCHAR(100) NOT NULL,
    Author VARCHAR(50) NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    Price DECIMAL(8,2) CHECK(Price > 0));
    
  Create table Orders (
	OrderID INT PRIMARY KEY,
	BookID INT REFERENCES Books(BookID),
	OrderDate DATE NOT NULL,
	Quantity INTEGER CHECK(Quantity > 0));

Describe Books;
insert into Books(BookID,Title, Author,ISBN,Price)
Values
	(101,'Shakesphere','Theory of life','978-0131582792',1500),
	(102,'Ben Forta','Speed and basics','978-01492057611',2000),
    (103,'Alan Beaulieu','Fundamentals of Space','978-195678943',3500),
    (104,'Anthony Molinaro','Problem-Solving','978-1509302000',1400),
    (105,'walter Shields','Career ready Skills','978-1945051753',950);

update books
set price = 2500 where BookID = 105;

insert into Orders(OrderID,BookID,OrderDate,Quantity)
Values 
	(10,101,'2025-05-10',7),
    (11,102,'2025-06-16',10),
    (12,103,'2025-08-20',20),
    (13,104,'2025-12-15',4),
    (14,105,'2025-07-09',15);
update Orders
set Quantity = 10 where OrderID = 13;

Delete from Orders where OrderID = 10;
select * from Orders;
Select * from Books;

Truncate Orders;
select * from Orders;



