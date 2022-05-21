-- mysql command returns an error in the terminal, but we were instructed to start the code with these two lines
mysql;
USE COMPANY1;

-- 1. List all Employees whose salary is between 1,000 AND 2,000. Show the Employee Name, Department and Salary
SELECT ENAME, DEPTNO, SAL FROM EMP 
WHERE SAL BETWEEN 1000 AND 2000;

-- 2. Count the number of people in department 30 who receive a salary and the number of people who receive a commission

-- This code counts the total number of people in Dept No. 30:
SELECT COUNT(ENAME) FROM EMP 
WHERE DEPTNO = 30;

-- This code counts the number of people who receive a commission in Dept No. 30:
SELECT COUNT(COMM) FROM EMP 
WHERE DEPTNO = 30;

-- However, since we have a 0.00 value in addition to NULL values, we can leave it out like this:
SELECT COUNT(COMM) FROM EMP 
WHERE DEPTNO = 30 AND COMM != 0.00;

-- 3. Find the name and salary of employees in Dallas
SELECT ENAME, SAL FROM EMP
WHERE DEPTNO = 20;

SELECT EMP.ENAME, EMP.SAL FROM EMP 
JOIN DEPT ON DEPT.DEPTNO = EMP.DEPTNO
WHERE DEPT.LOC = "DALLAS";

-- 4. List all departments that do not have any employees
-- "Departments_with_no_employees" is used as an alias for DNAME
SELECT DEPT.DNAME AS Departments_with_no_employees FROM DEPT LEFT OUTER JOIN EMP ON DEPT.DEPTNO = EMP.DEPTNO
GROUP BY DEPT.DNAME HAVING COUNT(EMP.EMPNO) = 0;

-- NOTE: We used LEFT OUTER JOIN here. If we used the JOIN or RIGHT OUTER JOIN, Department 40 from DEPT table is ommited
-- because it doesn't correspond to any row on EMP table via FOREIGN KEY, hence it returns an empty set.
-- When we use LEFT OUTER JOIN, the table DEPT (i.e., "left" table) is taken in its entirety.

-- 5. List the department number and average salary of each department
-- "average_salary" is used as an alias for AVG() function:
SELECT DEPT.DEPTNO, AVG(EMP.SAL) AS average_salary FROM DEPT
JOIN EMP ON DEPT.DEPTNO = EMP.DEPTNO
GROUP BY DEPT.DEPTNO;

-- Since the Department No.40 doesn't have any employees as we shown in the previous task, it is not listed on the resulting table.
-- If we want to have Department 40 on the resulting table anyway, we can use LEFT OUTER JOIN again:
SELECT DEPT.DEPTNO, AVG(EMP.SAL) AS average_salary FROM DEPT
LEFT OUTER JOIN EMP ON DEPT.DEPTNO = EMP.DEPTNO
GROUP BY DEPT.DEPTNO;
