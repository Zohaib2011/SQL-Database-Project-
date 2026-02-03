CREATE DATABASE Employee_Management_System;
USE Employee_Management_System;

CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY,
    First_Name VARCHAR(25),
    Last_Name VARCHAR(25),
    Age INT,
    CNIC VARCHAR(15),
    Job_Title VARCHAR(50)
);

CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Head VARCHAR(50),
     Employee_ID int,
     FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE Salaries (
    Salary_ID INT PRIMARY KEY,
    Employee_ID INT,
    Monthly_Salary DECIMAL(10,2),
    Deduction DECIMAL(10,2),
    Bonus DECIMAL(10,2),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE Leave_Table (
    Leave_ID INT PRIMARY KEY,
    Employee_ID INT,
    Status_Type VARCHAR(20),
    Leave_Date DATE,
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

INSERT INTO Employee VALUES
(1,'Zohaib','Khan',22,'16101-1234567-1','Software Engineer'),
(2,'Ali','Ahmed',25,'35202-2345678-2','Database Admin'),
(3,'Usman','Raza',28,'37405-3456789-3','HR Manager'),
(4,'Ayesha','Malik',26,'61101-4567890-4','Accountant'),
(5,'Fatima','Sheikh',24,'42101-5678901-5','Office Assistant');

INSERT INTO Department VALUES
(101,'Computer Science','Dr Ali'),
(102,'HR','Mr Usman'),
(103,'Accounts','Ms Ayesha'),
(104,'IT Support','Mr Zohaib'),
(105,'Administration','Ms Fatima');

INSERT INTO Salaries VALUES
(201,1,60000,2000,5000),
(202,2,55000,1500,4000),
(203,3,70000,3000,6000),
(204,4,45000,1000,3000),
(205,5,35000,500,2000);

INSERT INTO Leave_Table VALUES
(301,1,'Approved','2026-01-10'),
(302,2,'Pending','2026-01-12'),
(303,3,'Rejected','2026-01-15'),
(304,4,'Approved','2026-01-18'),
(305,5,'Pending','2026-01-20');

-- first view
CREATE VIEW Employee_Salary_View AS
SELECT Employee_ID, Monthly_Salary, Bonus, Deduction
FROM Salaries;

-- second view
CREATE VIEW Employee_Leave_View AS
SELECT Employee_ID, Status_Type, Leave_Date
FROM Leave_Table;

-- third view 
create view Employee_Dpartment_Information As
select Employee.Employee_ID,Employee.First_Name,Employee.Last_Name,Salaries.Salary_ID
from Employee
join Salaries ON
Employee.Employee_ID=Salaries.Employee_ID;


SELECT * FROM Employee_Salary_View;
SELECT * FROM Employee_Leave_View;
select * FROM Employee_Dpartment_Information;


-- practice question

select 
Employee.First_Name,
Department.Name,
Salaries.Monthly_salary,
Leave_Table.Status_type
from  Employee
cross join Department
cross join Salaries
cross join Leave_table;
