---- PRACTICE 1 ----

SELECT *
FROM COUNTRIES;

--4. List all the different region_ids in countries table

SELECT DISTINCT REGION_ID
FROM COUNTRIES;


--5. Display the salary of the employee Grant Douglas (lastName: Grant, firstName: Douglas)
SELECT SALARY
FROM EMPLOYEES
WHERE LAST_NAME = 'Grant'
  AND FIRST_NAME = 'Douglas';

--6. Display all department information from departments table
-- if the department name values are as below
-- IT , Public Relations , Sales , Executive

SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME IN ('IT', 'Public Relations', 'Sales', 'Executive');


-- 16 . Display all unique job_id that end with CLERK in employee table

SELECT JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE '%CLERK';

-- 20-4 How many employees are there in each group that have minimum
-- salary of 5000 ?

SELECT *
FROM EMPLOYEES
WHERE SALARY >= 5000;

SELECT JOB_ID, COUNT(*)
FROM (SELECT *
      FROM EMPLOYEES
      WHERE SALARY >= 5000)
GROUP BY JOB_ID
ORDER BY JOB_ID;


SELECT DEPARTMENT_ID, COUNT(*)
FROM (SELECT *
      FROM EMPLOYEES
      WHERE SALARY >= 5000)
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;


-- 21. display all job_id and average salary who work as any of these jobs
-- IT_PROG,SA_REP, FI_ACCOUNT, AD_VP

SELECT JOB_ID, AVG(SALARY)
FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'SA_REP', 'FI_ACCOUNT', 'AD_VP')
GROUP BY JOB_ID;

SELECT JOB_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING JOB_ID IN ('IT_PROG', 'SA_REP', 'FI_ACCOUNT', 'AD_VP');

-- 23. Display total salary for each department except department_id 50, and where

SELECT DEPARTMENT_ID, SUM(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID != 50
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING DEPARTMENT_ID != 50
ORDER BY DEPARTMENT_ID;


---- PRACTICE 2 ----
--8.  Find the 3rd MAXimum salary from the employees table (do not include duplicates)

--Step #1 --> All unique salaries are sorted by desc [most to least]
SELECT DISTINCT SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC;
--WHERE ROWNUM <4; --> That's an illegal syntax. So we use sub-query instead

--Step #2 --> with rownum we get only first three row which means three maximum salary

SELECT SALARY
FROM (SELECT DISTINCT SALARY
      FROM EMPLOYEES
      ORDER BY SALARY DESC)
WHERE ROWNUM < 4;

--Step #3 --> min of there maximum salary means 3rd maximum salary
SELECT MIN(SALARY)
FROM (SELECT SALARY
      FROM (SELECT DISTINCT SALARY
            FROM EMPLOYEES
            ORDER BY SALARY DESC)
      WHERE ROWNUM < 4);

--Step #4 [extra] --> Who gets the 3rd max salary ?
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY)
                FROM (SELECT SALARY
                      FROM (SELECT DISTINCT SALARY
                            FROM EMPLOYEES
                            ORDER BY SALARY DESC)
                      WHERE ROWNUM
                                < 4));


--12. Find the 3rd minimum salary from the employees table (do not include duplicates)

--Step #1 --> All unique salaries are sorted by asc [least to most]
SELECT DISTINCT SALARY
FROM EMPLOYEES
ORDER BY SALARY ASC;

--Step #2 --> with rownum we get only first three row which means three min salary
SELECT SALARY
FROM (SELECT DISTINCT SALARY
      FROM EMPLOYEES
      ORDER BY SALARY ASC)
WHERE ROWNUM < 4;

--Step #3 --> max of there minimum salary means 3rd minimum salary
SELECT MAX(SALARY)
FROM (SELECT SALARY
      FROM (SELECT DISTINCT SALARY
            FROM EMPLOYEES
            ORDER BY SALARY ASC)
      WHERE ROWNUM < 4);

--Step #4 [extra] --> Who gets the 3rd min salary ?
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
                FROM (SELECT SALARY
                      FROM (SELECT DISTINCT SALARY
                            FROM EMPLOYEES
                            ORDER BY SALARY ASC)
                      WHERE ROWNUM < 4));

---- PRACTICE 3 ----
-- 1. FIND OUT COUNTRY NAME AND REGION NAME FROM COUNTRIES AND  REGION TABLE
SELECT *
FROM COUNTRIES;
SELECT *
FROM REGIONS;
--REGION_ID is common for two table !!


SELECT COUNTRY_NAME, REGION_NAME
FROM COUNTRIES C
         JOIN REGIONS R on C.REGION_ID = R.REGION_ID;


-- 3.  FIND OUT DEPARTMENT_NAME AND CITY
SELECT *
FROM DEPARTMENTS;
SELECT *
FROM LOCATIONS;
--LOCATION_ID is common for two tables !!

SELECT DEPARTMENT_NAME, CITY
FROM DEPARTMENTS D
         JOIN LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID;

-- 5.  FIND OUT FIRST_NAME, LAST NAME, DEPARTMENT ID , DEPARTMENT NAME FOR DEPARTMENT ID 80 OR 40
SELECT *
FROM EMPLOYEES;
SELECT *
FROM DEPARTMENTS;
--DEPARTMENT_ID is common for two tables !!

SELECT FIRST_NAME, LAST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES E
         JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID IN (40, 80);


-- 7. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME ,  CITY

SELECT FIRST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY
FROM EMPLOYEES E
         JOIN DEPARTMENTS D on D.DEPARTMENT_ID = E.DEPARTMENT_ID
         JOIN JOBS J on J.JOB_ID = E.JOB_ID
         JOIN LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID;


-- 8. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME ,CITY , COUNTRY_NAME , REGION_NAME
SELECT FIRST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY, COUNTRY_NAME, REGION_NAME
FROM EMPLOYEES E
         JOIN JOBS J on E.JOB_ID = J.JOB_ID
         JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
         JOIN LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID
         JOIN COUNTRIES C on C.COUNTRY_ID = L.COUNTRY_ID
         JOIN REGIONS R on C.REGION_ID = R.REGION_ID;

-- 11 .FIND OUT DEPARTMENT_NAME , LOCATION_ID , AND COUNTRY_NAME
-- INCLUDING THOSE COUNTRIES WITH NO DEPARTMENT

SELECT *
FROM REGIONS;

SELECT DEPARTMENT_NAME, L.LOCATION_ID, COUNTRY_NAME
FROM COUNTRIES C
         JOIN LOCATIONS L on C.COUNTRY_ID = L.COUNTRY_ID
         LEFT JOIN DEPARTMENTS D on L.LOCATION_ID = D.LOCATION_ID;