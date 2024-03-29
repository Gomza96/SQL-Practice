USE [master]
GO
/****** Object:  StoredProcedure [dbo].[TempEmployee]    Script Date: 15-02-2024 12:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 ALTER PROCEDURE [dbo].[TempEmployee]
 @JobTitle nvarchar(50)
 AS
  CREATE TABLE #temp_Employee2(
 JobTitle VARCHAR(50),
 Employeesperjob Int,
 AvgAge int,
 AvgSalary int)
  INSERT INTO #temp_Employee2
 SELECT JobTitle,Count(JobTitle),AVG(Age),AVG(Salary)
FROM [SQL tutorial].[dbo].[Employeedemographics]  Demo
JOIN [SQL tutorial].dbo.EmployeeSalary  Sal
ON Demo.EmployeeID=Sal.EmployeeID
WHERE Jobtitle=@JobTitle
GROUP BY JobTitle
 SELECT*
 FROM #temp_Employee2