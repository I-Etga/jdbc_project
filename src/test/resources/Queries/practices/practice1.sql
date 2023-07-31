/*
 Part 1
Select - Distinct - Where - Order By - Like -
Group By - Having

 */

--1. List all the employees first and last name with their salary in employees table
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES;

--2. How many employees have salary less than 5000?
--extra --> who is making less than 5000
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < 5000;

SELECT COUNT(*)
FROM EMPLOYEES
WHERE SALARY < 5000;

--3. How many employees have salary between 6000 and 7000?

--extra --> who is making between 6000 and 7000
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 6000 AND 7000;

SELECT COUNT(*)
FROM EMPLOYEES
WHERE SALARY BETWEEN 6000 AND 7000;

--4. List all the different region_ids in countries table
SELECT COUNTRY_NAME, REGION_ID
FROM COUNTRIES;

--all region ids
SELECT REGION_ID
FROM COUNTRIES;

--all different region ids [no duplicates]
SELECT DISTINCT REGION_ID
FROM COUNTRIES;

--5. Display the salary of the employee Grant Douglas (lastName: Grant, firstName: Douglas)
--see who makes how much in order to make sure
SELECT SALARY, FIRST_NAME, LAST_NAME
FROM EMPLOYEES
ORDER BY FIRST_NAME;

SELECT SALARY
FROM EMPLOYEES
WHERE LAST_NAME = 'Grant'
  AND FIRST_NAME = 'Douglas';


--6. Display all department information from departments table

--all departments
SELECT *
FROM DEPARTMENTS;

-- if the department name values are as below
-- IT , Public Relations , Sales , Executive
SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME IN ('IT', 'Public Relations', 'Sales', 'Executive');

--7. Display the maximum salary in employees table
--to see who makes how much in oder to make sure !! [practicing purpose]
SELECT SALARY, FIRST_NAME, LAST_NAME
FROM EMPLOYEES
ORDER BY SALARY DESC;

SELECT MAX(SALARY)
FROM EMPLOYEES;

--8. Display the the minimum salary in employees table
--to see who makes how much in oder to make sure !! [practicing purpose]
SELECT SALARY, FIRST_NAME, LAST_NAME
FROM EMPLOYEES
ORDER BY SALARY;

SELECT MIN(SALARY)
FROM EMPLOYEES;

--9. Display the average salary of the employees;

SELECT ROUND(AVG(SALARY), 2)
FROM EMPLOYEES;

--10. Count the total numbers of the departments in departs table
--Names of departments
SELECT DEPARTMENT_NAME
FROM DEPARTMENTS;
--Numbers of departments
SELECT COUNT(*)
FROM DEPARTMENTS;

--11. Sort the start_date in ascending order in job_history's table
SELECT START_DATE
FROM JOB_HISTORY
ORDER BY START_DATE;

--12. Sort the start_date in descending order in job_history's table
SELECT START_DATE
FROM JOB_HISTORY
ORDER BY START_DATE DESC;

--13. Display all records whose last name contains 2 lowercase 'a's
SELECT *
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%a%a%';

--14. Display all the employees whose first name starts with ‘A'
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'A%';

--15. Display all the employees whose job_ID contains ‘IT'
SELECT *
FROM EMPLOYEES
WHERE JOB_ID LIKE '%IT%';

--16. Display all unique job_id that end with CLERK in employee table
SELECT DISTINCT JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE '%CLERK';

--17.Display all employees first name starts with A and have exactly 4 characters
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'A___';

--18. Display all the employees whose department id in 50, 80, 100
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (50, 80, 100)
ORDER BY DEPARTMENT_ID;


--19. Display all employees who does not work in any one of these department id — > 90, 60, 100, 130, 120
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (90, 60, 100, 130, 120)
ORDER BY DEPARTMENT_ID DESC;

--20. divide employees into groups by using their job id
SELECT JOB_ID
FROM EMPLOYEES
GROUP BY JOB_ID;

-- 1 display the maximum salaries in each groups
SELECT JOB_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID;

-- 2 display the minimum salaries in each groups
SELECT JOB_ID, MIN(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID;

-- 3 display the average salary of each group
SELECT JOB_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID;

-- 4 how many employees are there in each group that have minimum salary of 5000 ?

SELECT JOB_ID, COUNT(*)
FROM EMPLOYEES
WHERE SALARY >= 5000
GROUP BY JOB_ID
ORDER BY COUNT(*);

-- 5 display the total budgets of each groups
SELECT JOB_ID, SUM(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
ORDER BY SUM(SALARY) DESC;

--21. display all job_id and average salary who work as any of these jobs IT_PROG,SA_REP, FI_ACCOUNT, AD_VP

--WHERE
SELECT JOB_ID, AVG(SALARY)
FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'SA_REP', 'FI_ACCOUNT', 'AD_VP')
GROUP BY JOB_ID
ORDER BY AVG(SALARY) DESC;

--HAVING
SELECT JOB_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING JOB_ID IN ('IT_PROG', 'SA_REP', 'FI_ACCOUNT', 'AD_VP')
ORDER BY AVG(SALARY) DESC;


--22.Display max salary for each department
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY MAX(SALARY) DESC;

--23. Display total salary for each department except department_id 50, and where more than 30k
SELECT DEPARTMENT_ID, SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING DEPARTMENT_ID != 50
   AND SUM(SALARY) > 30000;
