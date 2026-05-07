use employee_db;
-- create simple view
create or replace view EmployeeBasicView as 
select Employee_Name, Department_id, Salary from employees 
order by department_id;

select * from EmployeeBasicView;
-- complex view

create or replace view EmployeeDepartmentView as
select e.Employee_Name, d.Department_Name, l.Location_Name , e.Salary from employees e
join Department d on e.Department_id = d.Department_id
join Location l on e.Location_id = l.Location_id
order by Employee_Name;

select * from EmployeeDepartmentView;

-- complex view with aggregation
drop view DeptSalaryStats;
create or replace view DeptSalaryStats as 
select avg(Salary) as avg_Salary, Count(Emp_id)as Total_Emp , d.Department_Name from employees e 
join Department d on e.Department_id = d.Department_id
group by Department_Name;

-- Update the View
select * from DeptSalaryStats;
set sql_safe_updates = 0 ;
update EmployeeBasicView set Salary = Salary+5000;

select Employee_Name , Salary as Updated_Salary from EmployeeBasicView ;
-- Drop  the Table

drop View DeptSalaryStats;
use employee_db;

-- before trigger

delimiter // 
create trigger check_min_salary 
before insert on employees 
for each row
begin
	if new.Salary < 30000 then 
		signal sqlstate '45000'
        set message_Text = "Salary must be at least 30000";
	end if ;
end //
delimiter ;

insert into employees(Emp_id , Employee_Name , Gender ,Age ,Hire_Date ,Designation , 
Salary,Department_id, Location_id) Values ( 5031,'Anitha Vikram','F','25','2019-12-23','Data Analyst',20000, 3, 4);

insert into employees(Emp_id , Employee_Name , Gender ,Age ,Hire_Date ,Designation , 
Salary,Department_id, Location_id) Values ( 5031,'Anitha Vikram','F','25','2019-12-23','Data Analyst',45000, 3, 4);

select * from employees;

-- After Insert

create table EmployeeAudit (Audit_ID int Auto_increment Primary Key, 
	EmpID int, EmpName varchar(100) , Action Varchar(100), ActionDate DateTime);

delimiter // 
create trigger EmployeeAuditTrigger
after insert on employees 
for each row
begin
	insert into EmployeeAudit(EmpID, EmpName, Action, ActionDate)
    values ( new.Emp_id,new.Employee_Name,'Inserted',now());
end //
delimiter ;

insert into employees(Emp_id , Employee_Name , Gender ,Age ,Hire_Date ,Designation , 
Salary,Department_id, Location_id) Values ( 5032,'Arjun Mehta','M','35','2019-03-20','Data Analyst',45000, 3, 4);

select * from EmployeeAudit;

-- trigger After Update 
Create table SalaryLog( EmpID int, OldSalary decimal(10,2), NewSalary decimal (10,2), ChangeDate DateTime);

delimiter // 
create trigger SalaryLogTrigger
after update on employees 
for each row
begin
	insert into SalaryLog ( EmpID, OldSalary, NewSalary,ChangeDate)
    values ( new.Emp_id,old.Salary,new.Salary,now());
end //
delimiter ;

update employees set Salary = 50000 where Emp_id = 5032;
select * from SalaryLog;

use employee_db;
drop trigger prevent_it_delete;
-- before trigger 
delimiter //
CREATE trigger prevent_it_delete
BEFORE DELETE ON employees
FOR EACH ROW

BEGIN
    -- Assuming DeptID 10 is IT, or looking up the department name
    -- For this logic, we check if the record being deleted belongs to IT
    IF OLD.Department_id = (SELECT Department_id FROM Department WHERE Department_Name = 'IT') THEN
    signal sqlstate '45000'
    set message_Text = 'Cannot delete employees from IT department';
	END IF;
END//
delimiter ;


DELETE FROM employees WHERE Emp_id = 5002 AND Department_id = 12;

select * from Department;
select * from employees;
use employee_db;

CREATE TABLE EmployeeArchive (
    EmpID INT,
    EmpName VARCHAR(20),
    DeptID INT,
    Salary DECIMAL(10,2),
    ExitDate TIMESTAMP
);

CREATE TRIGGER archive_deleted_employee
AFTER DELETE ON employees
FOR EACH ROW
INSERT INTO EmployeeArchive (EmpID, EmpName, DeptID, Salary, ExitDate)
VALUES (OLD.Emp_id, OLD.Employee_Name, OLD.Department_id, OLD.Salary, NOW());


delete from employees where Emp_id = '5032';

describe employees;
describe employeearchive;