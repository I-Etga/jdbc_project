--Your manager is asking all jobs and their average salary.

SELECT *
FROM EMPLOYEES;

SELECT DISTINCT JOB_ID
FROM EMPLOYEES;

--get me average salary for IT_PROG
SELECT AVG(SALARY)
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--get me average salary for AC_ACCOUNT
SELECT AVG(SALARY)
FROM EMPLOYEES
WHERE JOB_ID = 'AC_ACCOUNT';

--

SELECT JOB_ID, AVG(SALARY), COUNT(*), SUM(SALARY), MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID;

--We can only use AGGREGATE FUNCTIONS !!Because each group has only one column

SELECT JOB_ID, AVG(SALARY), COUNT(*), SUM(SALARY), MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'AC_ACCOUNT', 'ST_MAN') -- We can also use filter
GROUP BY JOB_ID;

--

--Display how many departments we have in each location
SELECT *
FROM DEPARTMENTS;

SELECT LOCATION_ID, COUNT(*)
FROM DEPARTMENTS
GROUP BY LOCATION_ID;

--order result based on number of departments in desc
SELECT LOCATION_ID, COUNT(*)
FROM DEPARTMENTS
GROUP BY LOCATION_ID
ORDER BY COUNT(*) ASC;--ASC default option so we don't we to use it !!

SELECT LOCATION_ID, COUNT(*)
FROM DEPARTMENTS
GROUP BY LOCATION_ID
ORDER BY COUNT(*) DESC;

SELECT LOCATION_ID, COUNT(*)
FROM DEPARTMENTS
GROUP BY LOCATION_ID
ORDER BY 2 ASC;
--SELECT 1,2 --> WE CAN ORDER COLUMN 1 AND 2 SEPARATELY

--Display how many countries we have in each regions
SELECT *
FROM COUNTRIES;

SELECT REGION_ID, COUNT(*)
FROM COUNTRIES
group by REGION_ID;

--order them based on number of countries in desc
SELECT REGION_ID, COUNT(*)
FROM COUNTRIES
group by REGION_ID
ORDER BY 2 DESC;
SELECT REGION_ID, COUNT(*)
FROM COUNTRIES
group by REGION_ID
ORDER BY COUNT(*) ASC;

---------------------

--get me total salary for each department from employees table.
SELECT DEPARTMENT_ID, SUM(SALARY), COUNT(*)
FROM EMPLOYEES
group by DEPARTMENT_ID;

SELECT DEPARTMENT_ID, SUM(SALARY), COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL -- removes null department id from the result
group by DEPARTMENT_ID;
--WHERE MUST BE BEFORE GROUP BY

--display job ids where their average more than 5k

SELECT JOB_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) > 5000;
--instead of WHERE, because WHERE comes before GROUP BY

--display departments where their average salary is more than 6k
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY))
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) > 6000
ORDER BY 2 ASC;

--IQ --> display duplicate(more than one) firstnames from employee table.
SELECT FIRST_NAME, COUNT(*)
FROM EMPLOYEES
GROUP BY FIRST_NAME
HAVING COUNT(*) >= 2;

--display department id where employees count is bigger than 5
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
group by DEPARTMENT_ID
HAVING COUNT(*) > 5
ORDER BY 2 DESC;



