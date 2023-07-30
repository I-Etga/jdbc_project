SELECT *
FROM EMPLOYEES;

/*
 AGGREGATE FUNCTIONS - MULTI ROWS - GROUP FUNCTIONS
 - count --> it returns number of rows
 - max--> it returns max value
 - min--> it returns min value
 - sum--> it returns total value
 - avg--> it returns average value

 Average function takes multi row and return one result
 All of them ignore NULL values

 */

-- how many departments we have ?
SELECT *
FROM DEPARTMENTS;
SELECT COUNT(*)
FROM DEPARTMENTS;

--how many locations we have ?

SELECT *
FROM LOCATIONS;
SELECT COUNT(*)
FROM LOCATIONS;

SELECT *
FROM EMPLOYEES; -- returns 107 employees

SELECT COUNT(DEPARTMENT_ID)
FROM EMPLOYEES;
--returns 106 because one of the department_id of employee is null and COUNT ignores NULL values


--TASK
-- How many different firstname we have ?
SELECT COUNT(DISTINCT FIRST_NAME)
FROM EMPLOYEES;

--How many employees are working as IT_PROG or SA_REP
SELECT COUNT(*)
FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'SA_REP');

--MAX()
SELECT MAX(SALARY)
FROM EMPLOYEES;

--MIN()
SELECT MIN(SALARY)
FROM EMPLOYEES;

--AVG()
SELECT AVG(SALARY)
FROM EMPLOYEES;

--ROUND ()
SELECT ROUND(AVG(SALARY))
FROM EMPLOYEES;--6462
SELECT ROUND(AVG(SALARY), 1)
FROM EMPLOYEES;--6461.8
SELECT ROUND(AVG(SALARY), 2)
FROM EMPLOYEES;--6461.83
SELECT ROUND(AVG(SALARY), 3)
FROM EMPLOYEES;
--6461.832

--SUM()
SELECT SUM(SALARY)
FROM EMPLOYEES;




