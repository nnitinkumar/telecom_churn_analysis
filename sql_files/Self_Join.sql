--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%BASIC SELF JOIN QUESTION%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

USE TempDb
GO
-- Create a Table
CREATE TABLE Employee(
EmployeeID INT PRIMARY KEY,
Name NVARCHAR(50),
ManagerID INT
)
GO
-- Insert Sample Data
INSERT INTO Employee
SELECT 1, 'Mike', 3
UNION ALL
SELECT 2, 'David', 3
UNION ALL
SELECT 3, 'Roger', NULL
UNION ALL
SELECT 4, 'Marry',2
UNION ALL
SELECT 5, 'Joseph',2
UNION ALL
SELECT 7, 'Ben',2
GO
-- Check the data
SELECT *
FROM Employee
GO

-------------------------------------------------------------------

select * from Employee ;


--select * from employee E1
--inner join employee E2
--on E1.EmployeeId = E2.EmployeeId;

select 
E1.EmployeeID, 
E1.Name as EmpName, 
E1.ManagerID, 
E2.Name as ManagerName 
from employee E1
inner join employee E2
on E1.ManagerID = E2.EmployeeID
order by E1.Name;


-- Inner Join
SELECT e1.Name EmployeeName, e2.name AS ManagerName
FROM Employee e1
INNER JOIN Employee e2
ON e1.ManagerID = e2.EmployeeID
GO

--Outer join
select 
	E1.Name as EmployeeName,
	E2.Name as ManagerNameWithoutNullHandling,
	ISNULL(E2.Name, 'Top Manager') as ManagerName
from Employee E1
left join Employee E2
on E1.ManagerID = E2.EmployeeID
;



--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%HACKERRANK PLACEMENT SELF JOIN QUESTION%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55--
USE TempDb
GO
-- Create a Table
CREATE TABLE Students(
ID INT PRIMARY KEY,
Name NVARCHAR(50),
)
GO

-- Create a Table
CREATE TABLE Friends(
ID INT PRIMARY KEY,
FRIEND_ID INT,
)
GO
--Drop table Friends

-- Create a Table
CREATE TABLE Packages(
ID INT PRIMARY KEY,
Salary INT,
)
GO

-- Insert Sample Data
INSERT INTO Students
SELECT 1, 'Asley'
UNION ALL
SELECT 2, 'Samantha'
UNION ALL
SELECT 3, 'Julia'
UNION ALL
SELECT 4, 'Scarlet'
GO

--Select * from Students ;

INSERT INTO Friends
SELECT 1, 2
UNION ALL
SELECT 2, 3
UNION ALL
SELECT 3, 4
UNION ALL
SELECT 4, 1
GO

Select * from Friends;

INSERT INTO Packages
SELECT 1, 15.20
UNION ALL
SELECT 2, 10.06
UNION ALL
SELECT 3, 11.55
UNION ALL
SELECT 4, 12.12
GO

Select * from Packages;
---------------------------------------------------------------

with J1
as (
select 
S.NAME as NAMEOFTHEPERSON, 
F.FRIEND_ID as HISBESTFRIENDSID,
P.Salary as PERSONSSALARY
from Students S
inner join Friends F
on S.ID = F.ID
inner join Packages P
on P.ID = S.ID
)

select NAMEOFTHEPERSON
--J1.*, P.Salary as FRIENDSSALARY
from J1
inner join 
Packages P
On P.ID = J1.HISBESTFRIENDSID
where P.Salary > PERSONSSALARY
order by P.Salary;