--Always open a session before starting in order to access to DB
SELECT *
FROM DEPARTMENTS;

--TASK 1 - display department names  from departments table
SELECT DEPARTMENT_NAME
FROM DEPARTMENTS;


--TASK 2 - display first_name, last_name, department_id, salary from employees
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES;

--TASK 3 - display first_name, last_name, department_id, salary from employees whose salary is higher than 9000
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 9000;

--TASK 4 - display first_name, last_name, department_id, salary from employees
--         whose salary equals or more than 9000 and salary equals or less than 15000
--         sort result based on salary asc
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 9000 AND 15000
ORDER BY SALARY ASC;

--TASK 5 -  display first_name, last_name, department_id, salary from employees
--          whose firstname is Peter and salary is bigger than 5000
--          sort result based on salary desc
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'Peter'
  AND SALARY > 5000
ORDER BY SALARY DESC;
--'Peter' needs to be case sensitive !!

--TASK 6 - display country_id, country_name from countries table for region id 2 or 4
--         sort result based on region_id desc and country_name asc
--OPT1--
SELECT COUNTRY_ID, COUNTRY_NAME, REGION_ID
FROM COUNTRIES
WHERE REGION_ID = 2
   OR REGION_ID = 4
ORDER BY REGION_ID DESC, COUNTRY_NAME ASC;
--> first order by region id and then order each region id group by country name !!

--OPT2--
SELECT COUNTRY_ID, COUNTRY_NAME, REGION_ID
FROM COUNTRIES
WHERE REGION_ID IN (2, 4)
ORDER BY REGION_ID DESC, COUNTRY_NAME ASC;

--TASK 7 -  display employee firstname and lastname as fullname , salary as annual salary  , job_id
--          whose job ID starts with S
SELECT FIRST_NAME || ' ' || LAST_NAME as fullname, SALARY * 12 as annual_salary, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE 'S%';

-- whose job ID starts with S AND TOTAL 6 LETTER

SELECT FIRST_NAME || ' ' || LAST_NAME as fullname, SALARY * 12 as annual_salary, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE 'S_____';

SELECT FIRST_NAME || ' ' || LAST_NAME as fullname, SALARY * 12 as annual_salary, JOB_ID
FROM EMPLOYEES
WHERE LENGTH(JOB_ID) = 6;

-- TASK 8 - display country id and country name where country name ends with a
SELECT COUNTRY_ID, COUNTRY_NAME
FROM COUNTRIES
WHERE COUNTRY_NAME LIKE '%a';

--GET ME EMPLOYEES WHERE EMPLOYEE IDs are EVEN NUMBER
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE MOD(EMPLOYEE_ID, 2) = 0;
--We've used MOD() method.It makes exactly what % operator does in java

-- TASK 9 -  display country id and country name where country name ends with a and third letter is i
SELECT COUNTRY_ID, COUNTRY_NAME
FROM COUNTRIES
WHERE COUNTRY_NAME LIKE '__i%a';

------ INTERVIEW QUESTION  -->
/*
    Write a query to print first_name and salary for all employees in the Employee table
    who earn a salary larger than 3000
    Sort your results in ascending order of the last 3 characters in the employees first_name
    if two or more employees have first_names ending with same 3 characters, then sort them by highest salary
*/

SELECT FIRST_NAME, SALARY, LOWER(SUBSTR(FIRST_NAME, -3))
FROM EMPLOYEES
WHERE SALARY > 3000
ORDER BY SUBSTR(FIRST_NAME, -3) ASC, SALARY DESC;

SELECT FIRST_NAME, SALARY, SUBSTR(FIRST_NAME, -3)
FROM EMPLOYEES
WHERE SALARY > 3000
ORDER BY LOWER(SUBSTR(FIRST_NAME, -3)) ASC, SALARY DESC;

--------------- GROUP BY, HAVING  -------------------

-- TASK 10- 1 -  how many city we have in each country from locations table

SELECT COUNTRY_ID, COUNT(*)
FROM LOCATIONS
GROUP BY COUNTRY_ID;


-- TASK 10- 2  - order them based on city count in desc
SELECT COUNTRY_ID, COUNT(*) AS CITY_COUNT
FROM LOCATIONS
GROUP BY COUNTRY_ID
ORDER BY COUNT(*) DESC;

-- TASK 10- 3 -  filter result where country id starts with C

SELECT COUNTRY_ID, CITY
FROM LOCATIONS;

-- WHERE
SELECT COUNTRY_ID, COUNT(*) AS CITY_COUNT
FROM LOCATIONS
WHERE COUNTRY_ID LIKE 'C%'
GROUP BY COUNTRY_ID
ORDER BY CITY_COUNT DESC;

-- HAVING - BAD PRACTICE
SELECT COUNTRY_ID, COUNT(*) AS CITY_COUNT
FROM LOCATIONS
GROUP BY COUNTRY_ID
HAVING COUNTRY_ID LIKE 'C%'
ORDER BY CITY_COUNT DESC;

-- COUNT(*)  vs COUNT(Column)
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES;

SELECT COUNT(DEPARTMENT_ID)
FROM EMPLOYEES;
--ignores null !! so it returns 106

--counts rows  --> so it returns 107
SELECT COUNT(*)
FROM EMPLOYEES;


-- TASK 10- 4 -  display country id if city count is bigger than 1

SELECT COUNTRY_ID, COUNT(*) AS CITY_COUNT
FROM LOCATIONS
GROUP BY COUNTRY_ID
HAVING COUNT(*) > 1
ORDER BY CITY_COUNT DESC;

-- TASK 11 -1  How many employees is working for each department

SELECT DEPARTMENT_ID, COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- TASK 11 -2  ignore null departments
SELECT DEPARTMENT_ID, COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID;

-- TASK 11 -3  display department id where employees count is less than 5
SELECT DEPARTMENT_ID, COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) < 5;

------- SUBQUERY -------

-- TASK 12 - Display those employees firstname,lastname and salary
--           who get higher salary than the employee whose employee_id is 104

--STEP #1
SELECT SALARY
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 104;
--makes 6k

--STEP #2 --> Find me who is getting more than 6k
SELECT *
FROM EMPLOYEES
WHERE SALARY > 6000;

--STEP #3 -->Make it dynamic
SELECT *
FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY
                FROM EMPLOYEES
                WHERE EMPLOYEE_ID = 104)


-- TASK 13 -  Display Manager firstname,lastname of Peter,Vargas from employees table

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID
FROM EMPLOYEES;

--STEP #1
SELECT MANAGER_ID
FROM EMPLOYEES
WHERE FIRST_NAME = 'Peter'
  AND LAST_NAME = 'Vargas';

--STEP #2  --> What's the name of manager
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 124;

--STEP #3  --> Make it dynamic
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = (SELECT MANAGER_ID
                     FROM EMPLOYEES
                     WHERE FIRST_NAME = 'Peter'
                       AND LAST_NAME = 'Vargas');


-- TASK 14 -  display all information who is getting 11th highest salary

--Step #1
SELECT DISTINCT SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC
;

--Step #2--Find the highest 11 salaries
SELECT DISTINCT SALARY
FROM (SELECT DISTINCT SALARY
      FROM EMPLOYEES
      ORDER BY SALARY DESC)
WHERE ROWNUM < 12;

--Step #3--Min salary of 11 highest salaries is the 11th highest salary

SELECT MIN(SALARY)
FROM (SELECT DISTINCT SALARY
      FROM (SELECT DISTINCT SALARY
            FROM EMPLOYEES
            ORDER BY SALARY DESC)
      WHERE ROWNUM < 12);

--Step #4
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY)
                FROM (SELECT DISTINCT SALARY
                      FROM (SELECT DISTINCT SALARY
                            FROM EMPLOYEES
                            ORDER BY SALARY DESC)
                      WHERE ROWNUM < 12));

-- TASK 15 - Display employees first_name,last_name who is working in Marketing department


--- DDL / DML ---

-- DQL --> DATA QUERY LANGUAGE  --> SELECT
-- DML --> DATA MANIPULATION LANGUAGE
-- DDL --> DATA DEFINITION LANGUAGE


----- JOINS ----

-- INNER
-- OUTER ---> LEFT / RIGHT / FULL
-- SELF JOIN

-- INNER JOIN RETURN ONLY THE DATA THAT MATCH FROM BOTH TABLE ACCORDING TO CONDITION
-- Display all first_name and  related department_name

SELECT *
FROM EMPLOYEES;
SELECT *
FROM DEPARTMENTS;

-- Steven Executive
-- David IT
-- .......
-- ....

SELECT FIRST_NAME, DEPARTMENT_NAME
FROM EMPLOYEES
         INNER JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

-- MISSING KIMBERLY SINCE SHE DONT HAVE ANY DEPARTMENT ID

-- TABLE ALIASES
SELECT FIRST_NAME, DEPARTMENT_NAME
FROM EMPLOYEES E
         INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- TABLE ALIASES
SELECT FIRST_NAME, DEPARTMENT_NAME, D.DEPARTMENT_ID
FROM EMPLOYEES E
         JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- Is inner join same as join?
-- INNER JOINS --> JOIN


-- LEFT OUTER JOIN RETURN EVERYTHING THAT MATCH + UNIQUE FOR LEFT
-- Display all first_name and department_name including the  employee without department
SELECT FIRST_NAME, DEPARTMENT_NAME, D.DEPARTMENT_ID
FROM EMPLOYEES E
         LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- DISPLAY EMPLOYEES WHO IS WORKING FOR DEPARTMENT THAT STARTSWITH S
SELECT FIRST_NAME, DEPARTMENT_NAME, D.DEPARTMENT_ID
FROM EMPLOYEES E
         LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME LIKE 'S%';

-- Display all first_name and department_name including the department without employee
SELECT FIRST_NAME, DEPARTMENT_NAME, D.DEPARTMENT_ID
FROM DEPARTMENTS D
         LEFT JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;



-- RIGHT OUTER JOIN RETURN EVERYTHING THAT MATCH + UNIQUE FOR RIGHT
-- Display all first_name and department_name including the department without employee

SELECT *
FROM EMPLOYEES;
SELECT *
FROM DEPARTMENTS;

SELECT FIRST_NAME, DEPARTMENT_NAME, D.DEPARTMENT_ID
FROM EMPLOYEES E
         RIGHT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


--Display all first_name and department_name including the  employee without department
SELECT FIRST_NAME, DEPARTMENT_NAME, D.DEPARTMENT_ID
FROM DEPARTMENTS D
         RIGHT JOIN EMPLOYEES E ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- FULL OUTER JOIN RETURNS EVERYTHING
-- Display all firstname and department name including the department without employees
-- and also employees without the department
SELECT FIRST_NAME, DEPARTMENT_NAME, D.DEPARTMENT_ID
FROM DEPARTMENTS D
         FULL JOIN EMPLOYEES E ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

----- SELF JOIN ---
-- Display all managers and their managers information

-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers.