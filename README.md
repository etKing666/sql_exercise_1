# SQL Assignment

The questions and answers of the SQL assignment (Assignment 1: Part 3) will be discussed below.

## Starting conditions

COMPANY1 database is given for the assignment. The database contains two tables:

- EMP: This table contains all the data pertinent to the employees (e.g., name, salary, job title, department no, etc.).

- DEPT: This table contains the information about the departments of the company. It includes department number, department name and location attributes.

When examined the structure of the aforementioned tables closely, we can easily see that department number attribute in the DEPT table (DEPT.DEPTNO) is the primary key of the table whereas department number in the EMP table (EMP.DEPTNO) is a foreign key. This observation will prove useful later when joining two tables together to make queries.

Finally, as per the instructions, the first two lines of code are:

mysql;
USE COMPANY1;

Obviously, the first command 'mysql' serves to open a sql prompt. Later, with 'USE COMPANY1', we switch to the database given for the assignment.

NOTE: When we run the code, 'mysql' command on the code file returns an error, but for the sake of following the instructions, it was decided to keep it in the code.

## Solutions of the problems

#### 1. List all Employees whose salary is between 1,000 AND 2,000. Show the Employee Name, Department and Salary

The solution of this problem only required a simple query from the EMP table, as it has nothing to do with the DEPT table. As instructed in the problem description, only three attributes (ENAME, DEPTNO and SAL) were selected and those whose salary is between 1000 and 2000 was found by a WHERE clause.

#### 2. Count the number of people in Department 30 who receive a salary and the number of people who receive a commission

This problem includes two separate problems:
1. Counting the total number of employees in Department 30:

Since this problem requires a simple query from the EMP table, it was not necessary to use a JOIN operation. 

The problem requires to use COUNT() function to count the number of employers. Here, we can use any other attribute (e.g., EMPNO, JOB,  MGR or HIREDATE) to count the number of employees in the Department 30, but I chose to use the ENAME attribute (for no special reason). To limit the COUNT() function to count only employers in the Department 30, a WHERE clause was also added.

2. Counting the total number of employees who receive a commission in Department 30:

In a similar approach to the first step of the problem, employers who receive a commission was counted by COUNT(COMM) function and it was limited to the Department 30 by a WHERE clause.

However, here, there is something interesting in the dataset: There is an employer whose COMM field was populated with 0.00 and even though in the real world it means that this person doesn't receive a commission, COUNT() function counts all values but NULL. Hence, if we implement the solution this way, the result also includes this person who receives 0.00 commission. If we would like to leave this person out, we can incorporate an additional constraint into WHERE clause (WHERE COMM != 0.00) and we explicitly leave those employees who receive 0.00 commission out even though their COMM value is not NULL

#### 3. Find the name and salary of employees in Dallas

This problem can be solved in two different ways:
1. If we know that Dallas is the Department 20: 
In this case, we can simply query the employers' name (ENAME) and employers' salary (SAL) from EMP table and we can limit the results to Department 30 with a WHERE clause, as implemented in the code.

2. If we don't know the department number of Dallas department:
In this case, it is necessary to JOIN EMP and DEPT tables because EMP doesn't include any information about department names. In order to come up with the right solution, we should select the employers' name (ENAME) and employers' salary (SAL) from EMP table, we should JOIN the DEPT table and limit the results by a WHERE clause for the location (DEPT.LOC).

#### 4. List all departments that do not have any employees

To find the departments that do not have any employees, we need to join the DEPT and EMP tables, because EMP table doesn't include the department names and DEPT table does not include the employee information. 

However, here, it is important to note that we need to use LEFT OUTER JOIN because Department 40 (Operations) on DEPT table doesn't have any employees on EMP table. Hence, if we use JOIN, it omits the Department 40 which doesn't correspond to any employee in the EMP table.  If we use LEFT OUTER JOIN, the table DEPT (i.e., "left" table) is taken as a whole, regardless of the departments which doesn't have any employees.

Finally, since we want to result to be displayed department by department, GROUP BY clause is used along with HAVING to filter the departments that do not have any employee (COUNT(EMP.EMPNO) = 0).

In order to make the result more readable, DEPT.DNAME query is aliased as "Departments_with_no_employees".

#### 5. List the department number and average salary of each department

As we have demonstrated in the problem number 4, the Department 40 doesn't have any employees. Hence, its average salary is 0.00. This problem can be solved in two different ways depending on our preference to show the Department 40 or not:
1. If we want to omit the Department 40:

In this case, we can simply JOIN EMP and DEPT tables and use the AVG() function to find out the average salary of the employers. In order to display the result grouped by departments, we can use the GROUP BY clause.

2. If we want to include all departments (including the Department 40 which doesn't have any employee), following the same logic as in the Problem #4, we can use LEFT OUTER JOIN to include all columns from the "left" table DEPT. The remainder of the code remains the same.

In order to increase the readability of the result, AVG() function is aliased as "average_salary".

## Final notes

The code also includes comments in which the methodology followed when solving the problems. 
