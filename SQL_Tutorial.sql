--CREATING TABLE FOR THE REVISION 
-- BASICS


--CREATE TABLE EmployeeDemographs
--(EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)

--CREATE TABLE EmployeeSalary
--(EmployeeID int,
--JobTitle varchar(50),
--Salary int
--)

--INSERT INTO EmployeeDemographs VALUEs
--(1001, 'Jim', 'Harpert', 30, 'Male'),
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male'
--)

--Insert Into EmployeeSalary VALUES
--(1001, 'Salesman', 45000),
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)

/*
Select Statement
*,Top, Distinct, Count, As, Max, Min, Avg
The select statement makes it possible for us to query our database, the * statement calls out all the data in the table, this is usully not advisable in databases
that are very large. Select TOP 5*, calls out the top 5 data in the database. The distinct stateent calls out unique vales in the database.
 */

--SELECT DISTINCT(EmployeeID)
--FROM EmployeeDemographs

--SELECT TOP 5 *
--FROM EmployeeDemographs

--SELECT DISTINCT (Gender)
--FROM EmployeeDemographs

--SELECT COUNT (FirstName)
--FROM EmployeeDemographs

--SELECT COUNT (FirstName) AS Countname
--FROM EmployeeDemographs

/*
The min, max and avg statements are used on columns with the integer variabe datatype etc
*/

--SELECT MAX (Salary)
--FROM EmployeeSalary

--SELECT MIN (Salary)
--FROM EmployeeSalary

/*
WHERE Statement
=,<>,<,>,And,Or,Like,Null,Not Null,In
These statements allows the user to be specific with the data they are calling out, it gives limitation when working with a large database.
*/

--SELECT *
--FROM EmployeeDemographs
--WHERE FirstName = 'Jim'

--SELECT *
--FROM EmployeeDemographs
--WHERE FirstName <> 'Jim'

--SELECT *
--FROM EmployeeDemographs
--WHERE FirstName != 'Jim'

--SELECT *
--FROM EmployeeDemographs
--WHERE Age > 30

--SELECT *
--FROM EmployeeDemographs
--WHERE Age >= 30

--SELECT *
--FROM EmployeeDemographs
--WHERE Age >= 30 AND Gender = 'Male'

--SELECT *
--FROM EmployeeDemographs
--WHERE Age >= 30 OR Gender = 'Male'

/* The AND/OR have to satisfy the criterion to get the right answers ie with the AND, both criterions are satisfied to call out the answer, wheras the OR has meet one
of the two criteria (either meeting the age criterion or the gender criterion).
*/


--SELECT *
--FROM EmployeeDemographs
--WHERE LastName LIKE 'S%'

--SELECT *
--FROM EmployeeDemographs
--WHERE LastName LIKE '%S%'

/* The LIKE criterion is often used to call out texts/numeric at certain positions in the database. In the two scenarios above, S% calls out any name that begins with a S,
the seceond scenario calls out names that has S in them regardless of the position of the letter.
*/

--SELECT *
--FROM EmployeeDemographs
--WHERE FirstName is NULL

--SELECT *
--FROM EmployeeDemographs
--WHERE FirstName is NOT NULL

/* The IN condition works like the = sign in multiple times, makes the work alot easier.
*/
--instead of writing
--SELECT *
--FROM EmployeeDemographs
--WHERE FirstName = 'Jim' AND FirstName = 'Michael' AND FirstName = 'Pam'

--you can use IN to make it easier to read in this manner;

--SELECT *
--FROM EmployeeDemographs
--WHERE FirstName IN ('Jim', 'Michael', 'Pam')

/*
ORDER BY, GROUP BY
The order by condition works with columns and sets the result of the query either in ascending or descending order based on the specified orderby column. In situations where
multiple columns are included in the orderby statement, the query pulls out the sorted results using the first column, moves to the second column in places that the first column
has similar alphabets/values and sorts it by the second column.
*/

--SELECT Gender, Age
--FROM EmployeeDemographs
--ORDER BY Gender

--SELECT Gender, Age
--FROM EmployeeDemographs
--ORDER BY Gender, Age

--SELECT FirstName, Gender, Age
--FROM EmployeeDemographs
--ORDER BY FirstName DESC

--SELECT FirstName, LastName, Gender, Age
--FROM EmployeeDemographs
--ORDER BY FirstName DESC, LastName ASC

/*
The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".
The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.
The groupby shows unigue or distinct values
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);
*/

--SELECT Gender, COUNT(Gender)
--FROM EmployeeDemographs
--GROUP BY Gender

--SELECT Gender, Age, COUNT(Gender)
--FROM EmployeeDemographs
--GROUP BY Gender, Age


--INTERMEDIATE SQL SECTIONS

/* Inner Joins, Full/Left/Right/Outer Joins
Join combines row of two or more tables based on a related table between them.
Joins brings tables in a database together using a column that is present in both tables. The joins can happen at different locations, hence the different type of joins.
Join is also Inner Join, the former is a default of the later.
*/

--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeDemographs

--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeSalary

--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeDemographs
--Inner Join [SQL Tutorial].dbo.EmployeeSalary
--      ON EmployeeDemographs.EmployeeID = EmployeeSalary.EmployeeID

----Inner join works by joining all the variables that are present in one table as well as the secomd. Inner Joins like the mathematical SET THEORY where it calls out the intercept of the circle ie a data found in A and is 
----present in B is called out ie overlaps in each table.

--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeDemographs
--FULL OUTER Join [SQL Tutorial].dbo.EmployeeSalary
--      ON EmployeeDemographs.EmployeeID = EmployeeSalary.EmployeeID

----Full Outer join works like Union in the SET THEORY where it calls out all the variables in the two tables, whether or not there is an intercept, it combines Table A and B as long as there is a relationship/match there.

--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeDemographs
--LEFT OUTER Join [SQL Tutorial].dbo.EmployeeSalary
--      ON EmployeeDemographs.EmployeeID = EmployeeSalary.EmployeeID

----Left Outer Join takes everything that is in the left and joins it to everything in the right table, where there is a match.

--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeDemographs
--RIGHT OUTER Join [SQL Tutorial].dbo.EmployeeSalary
--      ON EmployeeDemographs.EmployeeID = EmployeeSalary.EmployeeID

----Right Outer join takes everything that is in the right and joins it to everything in the left table, where there is a match.


--SELECT EmployeeDemographs.EmployeeID, FirstName, LastName, JobTitle, Salary
--FROM [SQL Tutorial].dbo.EmployeeDemographs
--INNER Join [SQL Tutorial].dbo.EmployeeSalary
--      ON EmployeeDemographs.EmployeeID = EmployeeSalary.EmployeeID

--SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
--FROM [SQL Tutorial].dbo.EmployeeDemographs
--RIGHT OUTER Join [SQL Tutorial].dbo.EmployeeSalary
--      ON EmployeeDemographs.EmployeeID = EmployeeSalary.EmployeeID

--/* USE CASES 1
--Micheal wants to cut down the salaries of workers that earns more and he wants to get the list of names of highly earned workers, how does he go about this?
--*/

--SELECT EmployeeDemographs.EmployeeID, FirstName, LastName, Salary
--FROM [SQL Tutorial].dbo.EmployeeDemographs
--INNER Join [SQL Tutorial].dbo.EmployeeSalary
--      ON EmployeeDemographs.EmployeeID = EmployeeSalary.EmployeeID
--WHERE FirstName <> 'Michael'
--ORDER BY Salary DESC

--/* USE CASES 2
--Calculate the average salary of the Salesman
--*/

--SELECT JobTitle, AVG(Salary)
--FROM [SQL Tutorial].dbo.EmployeeDemographs
--INNER Join [SQL Tutorial].dbo.EmployeeSalary
--      ON EmployeeDemographs.EmployeeID = EmployeeSalary.EmployeeID
--WHERE FirstName = 'Salesman'
--GROUP BY JobTitle

--/*
--Union, Union All
--The Union statement is used to combine data of two or more seperate tables to produce a distinct table, especially when the select table have same data type, order and number of columns, Union All selects everything
--including duplicates.
--Note: The column names in the result-set are usually equal to the column names in the first SELECT statement.
--*/

--SELECT EmployeeID 
--FROM [SQL Tutorial].dbo.EmployeeDemographs
--UNION
--SELECT EmployeeID
--FROM [SQL Tutorial].dbo.EmployeeSalary

--SELECT EmployeeID 
--FROM [SQL Tutorial].dbo.EmployeeDemographs
--UNION
--SELECT EmployeeID
--FROM [SQL Tutorial].dbo.EmployeeSalary

/*
A Case Statement
This allows you to add a condition to your query, also allowing you to special what result you want, when the condition is met. This can be used to categorize things or make calculations.
*/

--SELECT FirstName, LastName, Age,
--CASE --the start of the case statement
--    WHEN Age > 30 THEN 'Old' --the condition
--	ELSE 'Young'
--END
--FROM [SQL Tutorial].dbo.EmployeeDemographs
--WHERE Age IS NOT NULL
--ORDER BY Age

--If the first condition is already met, all other conditions will not be mate as observed below

--SELECT FirstName, LastName, Age,
--CASE --the start of the case statement
--    WHEN Age > 30 THEN 'Old' --the condition
--	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
--	ELSE 'Baby'
--END
--FROM [SQL Tutorial].dbo.EmployeeDemographs
--WHERE Age IS NOT NULL
--ORDER BY Age

--Give different yearly raise to each employee. Calculate how much each will start earning

--SELECT FirstName, LastName, JobTitle, Salary,
--CASE
--    WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .010)
--	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
--	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
--	ELSE Salary + (Salary + .03)
--END AS SalaryAfterRaise
--FROM [SQL Tutorial].dbo.EmployeeDemographs
--JOIN [SQL Tutorial].dbo.EmployeeSalary
--     ON EmployeeDemographs.EmployeeID = EmployeeSalary.EmployeeID

/*
Having Clause
This comes after the group by, it is used to specifically pick out an information needed.
*/

--SELECT JobTitle, AVG(Salary)
--FROM [SQL Tutorial].dbo.EmployeeDemographs
--JOIN [SQL Tutorial].dbo.EmployeeSalary
--     ON EmployeeDemographs.EmployeeID = EmployeeSalary.EmployeeID
--GROUP BY JobTitle
--HAVING AVG(Salary) > 45000
--ORDER BY AVG(Salary)

--SELECT JobTitle, COUNT(JobTitle)
--FROM [SQL Tutorial].dbo.EmployeeDemographs
--JOIN [SQL Tutorial].dbo.EmployeeSalary
--     ON EmployeeDemographs.EmployeeID = EmployeeSalary.EmployeeID
--GROUP BY JobTitle
--HAVING COUNT(JobTitle) > 1

/*
Updating And Deleting Data
Inserting a data into a table is different from updating it, updating in sql means altering an already existing row in a table where insering adds a new row in a table. Deleting a data in a table specifies what row you want
removed from your table. SET is used to specify where the update is taking place.
Be care when deleting any row
*/

--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeDemographs

--A good example of update and delete

/*SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographs
SET EmployeeID = 1012
WHERE FirstName = '' AND LastName = ''

DELETE *
FROM [SQL Tutorial].dbo.EmployeeDemographs
WHERE EmployeeID = 1001

Always be careful to specify where you are deleting from as this query cannot be undone once carried out.
*/

--ALIASING; This means asuuming an aliase when writing queries for readability purposes as this does not affect the result of a query

--SELECT Gender, AVG(Age) AS AvgAge
--FROM [SQL Tutorial].dbo.EmployeeDemographs
--GROUP BY Gender
--In this case, it only changed the name from Age to AvgAge

/*
PARTITION BY
This is used to get the results of a query based on a particular column in the table and it is different from the GROUP BY function
*/

--SELECT FirstName, LastName, Gender, Salary,
--COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
--FROM [SQL Tutorial].dbo.EmployeeDemographs AS Demo
--JOIN [SQL Tutorial].dbo.EmployeeSalary AS Sal
--    ON Demo.EmployeeID = Sal.EmployeeID


--COMMON TABLE EXPRESSION (CTEs) IS VERY IMPORTANT FOR EVERY ANALYST
/* The CTE is an sql query that only exists in the scope of the query, what this means is that it does not have an effect on the entire table, once it is deleted it ceases to exist. The CTE is also known as the WITH statement,
and it must contain a select table, also for it to work in the capacity it was created, no space should be given. The CTE is not stored anywhere. The select statement created after the CTE only works together with the CTE
*/

--WITH CTE_Employee AS
--(SELECT FirstName, LastName, Gender, Salary,
--COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender,
--AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
--FROM [SQL Tutorial].dbo.EmployeeDemographs AS emp
--JOIN [SQL Tutorial].dbo.EmployeeSalary AS sal
--     ON emp.EmployeeID = sal.EmployeeID
--WHERE Salary > '45000'
--)
--SELECT *
--FROM CTE_Employee

----This above shows an aggregate function within the CTE

-- /*
-- TEMP TABLE
-- Temp table creates a temporary new table. The temp table reduces runtime and the need to rewrite a query everytime there is a need to work with it. An example is below. The temp table begins with #
-- */

-- DROP TABLE IF EXISTS #temp_Employee
--CREATE TABLE #temp_Employee
--(EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)

--INSERT INTO #temp_Employee VALUES(
--1020, 'Promise', 'Ikechukwu', 28, 'Male'),
--(1021, 'Augusta', 'Onuodafin', 28, 'Female')

--SELECT*
--FROM #temp_Employee

----Assuming you are working with a particular data from a database and have a query that you will like to work with without altering it, you can put it in a temp table.

--/*

--Today's Topic: String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

--*/

----Drop Table EmployeeErrors;


--CREATE TABLE EmployeeErrors (
--EmployeeID varchar(50)
--,FirstName varchar(50)
--,LastName varchar(50)
--)

--Insert into EmployeeErrors Values 
--('1001  ', 'Jimbo', 'Halbert')
--,('  1002', 'Pamela', 'Beasely')
--,('1005', 'TOby', 'Flenderson - Fired')

--Select *
--From EmployeeErrors

---- Using Trim, LTRIM, RTRIM

--Select EmployeeID, TRIM(employeeID) AS IDTRIM
--FROM EmployeeErrors 

--Select EmployeeID, RTRIM(employeeID) as IDRTRIM
--FROM EmployeeErrors 

--Select EmployeeID, LTRIM(employeeID) as IDLTRIM
--FROM EmployeeErrors 

	/*
Today's Topic: Stored Procedures
*/



---- Using Replace

--Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
--FROM EmployeeErrors


---- Using Substring

--Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
--FROM EmployeeErrors err
--JOIN EmployeeDemographs dem
--	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
--	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)



---- Using UPPER and lower

--Select firstname, LOWER(firstname)
--from EmployeeErrors

--Select Firstname, UPPER(FirstName)
--from EmployeeErrors

/*
Today's Topic: Stored Procedures
*/


--CREATE PROCEDURE Temp_Employee
--AS
--DROP TABLE IF EXISTS #temp_employee
--Create table #temp_employee (
--JobTitle varchar(100),
--EmployeesPerJob int ,
--AvgAge int,
--AvgSalary int
--)


--Insert into #temp_employee
--SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
--FROM SQLTutorial..EmployeeDemographs emp
--JOIN SQLTutorial..EmployeeSalary sal
--	ON emp.EmployeeID = sal.EmployeeID
--group by JobTitle

--Select * 
--From #temp_employee
--GO;




--CREATE PROCEDURE Temp_Employee2 
--@JobTitle nvarchar(100)
--AS
--DROP TABLE IF EXISTS #temp_employee3
--Create table #temp_employee3 (
--JobTitle varchar(100),
--EmployeesPerJob int ,
--AvgAge int,
--AvgSalary int
--)


--Insert into #temp_employee3
--SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
--FROM SQLTutorial..EmployeeDemographs emp
--JOIN SQLTutorial..EmployeeSalary sal
--	ON emp.EmployeeID = sal.EmployeeID
--where JobTitle = @JobTitle --- make sure to change this in this script from original above
--group by JobTitle

--Select * 
--From #temp_employee3
--GO;


--exec Temp_Employee2 @jobtitle = 'Salesman'
--exec Temp_Employee2 @jobtitle = 'Accountant'

/*
Today's Topic: Subqueries (in the Select, From, and Where Statement)
*/

--Select EmployeeID, JobTitle, Salary
--From EmployeeSalary

---- Subquery in Select

--Select EmployeeID, Salary, (Select AVG(Salary) From EmployeeSalary) as AllAvgSalary
--From EmployeeSalary

---- How to do it with Partition By
--Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
--From EmployeeSalary

---- Why Group By doesn't work
--Select EmployeeID, Salary, AVG(Salary) as AllAvgSalary
--From EmployeeSalary
--Group By EmployeeID, Salary
--order by EmployeeID


---- Subquery in From

--Select a.EmployeeID, AllAvgSalary
--From 
--	(Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
--	 From EmployeeSalary) a
--Order by a.EmployeeID


---- Subquery in Where


--Select EmployeeID, JobTitle, Salary
--From EmployeeSalary
--where EmployeeID in (
--	Select EmployeeID 
--	From EmployeeDemographs
--	where Age > 30)