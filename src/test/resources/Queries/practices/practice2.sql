SELECT *
FROM LOCATIONS;

--1. Display full addresses from locations table in a single column
SELECT LOCATION_ID, STREET_ADDRESS || ' ' || POSTAL_CODE || ' ' || LOCATIONS.CITY AS FULL_ADDRESS
FROM LOCATIONS;

--2. Display all information of the employee who has the minimum salary in employees table

--STEP#1
SELECT MIN(SALARY)
FROM EMPLOYEES;
--> 2100

--STEP#2
SELECT *
FROM EMPLOYEES
WHERE SALARY = 2100;

--make it dynamic
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY)
                FROM EMPLOYEES);

--3. Display the second minimum salary from the employees
--STEP#1
SELECT DISTINCT SALARY
FROM EMPLOYEES
ORDER BY SALARY;

--STEP#2
SELECT MAX(SALARY)
FROM (SELECT DISTINCT SALARY
      FROM EMPLOYEES
      ORDER BY SALARY)
WHERE ROWNUM < 3;


--4. Display all information of the employee who has the second minimum salary

SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
                FROM (SELECT DISTINCT SALARY
                      FROM EMPLOYEES
                      ORDER BY SALARY)
                WHERE ROWNUM < 3);


--5. List all the employees who are making above the average salary;
--STEP#1
SELECT ROUND(AVG(SALARY), 2)
FROM EMPLOYEES;

--STEP#2
SELECT FIRST_NAME || ' ' || LAST_NAME AS FULLNAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT ROUND(AVG(SALARY), 2)
                FROM EMPLOYEES)
ORDER BY SALARY DESC;

--6. List all the employees who are making less than the average salary
--STEP#1
SELECT ROUND(AVG(SALARY), 2)
FROM EMPLOYEES;

--STEP#2
SELECT FIRST_NAME || ' ' || LAST_NAME AS FULLNAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (SELECT ROUND(AVG(SALARY), 2)
                FROM EMPLOYEES)
ORDER BY SALARY;

--7. Display manager name of 'Neena'

--STEP#1
SELECT MANAGER_ID, FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME = 'Neena';
--> 100

--STEP#2
SELECT FIRST_NAME || ' ' || LAST_NAME AS MANAGER_NAME
FROM EMPLOYEES
WHERE EMPLOYEE_ID = (SELECT MANAGER_ID
                     FROM EMPLOYEES
                     WHERE FIRST_NAME = 'Neena');


--8. Find the 3rd maximum salary from the employees table (do not include duplicates)
--STEP#1
SELECT SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC;

--STEP#2
SELECT SALARY
FROM (SELECT DISTINCT SALARY
      FROM EMPLOYEES
      ORDER BY SALARY DESC)
WHERE ROWNUM < 4;

--STEP#3
SELECT MIN(SALARY)
FROM (SELECT SALARY
      FROM (SELECT DISTINCT SALARY
            FROM EMPLOYEES
            ORDER BY SALARY DESC)
      WHERE ROWNUM < 4);

--9. Find the 5th maximum salary from the employees table (do not include duplicates)
--STEP#1
SELECT DISTINCT SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC;

--STEP#2
SELECT SALARY
FROM (SELECT DISTINCT SALARY
      FROM EMPLOYEES
      ORDER BY SALARY DESC)
WHERE ROWNUM < 6;

--STEP#3
SELECT MIN(SALARY)
FROM (SELECT SALARY
      FROM (SELECT DISTINCT SALARY
            FROM EMPLOYEES
            ORDER BY SALARY DESC)
      WHERE ROWNUM < 6);

--extra: who gets 5th max salary
SELECT FIRST_NAME || ' ' || LAST_NAME AS FULLNAME
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY)
                FROM (SELECT SALARY
                      FROM (SELECT DISTINCT SALARY
                            FROM EMPLOYEES
                            ORDER BY SALARY DESC)
                      WHERE ROWNUM < 6));
--10. Find the 7th maximum salary from the employees table (do not include duplicates)
--STEP#1
SELECT DISTINCT SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC;

--STEP#2
SELECT SALARY
FROM (SELECT DISTINCT SALARY
      FROM EMPLOYEES
      ORDER BY SALARY DESC)
WHERE ROWNUM < 8;

--STEP#3
SELECT MIN(SALARY)
FROM (SELECT SALARY
      FROM (SELECT DISTINCT SALARY
            FROM EMPLOYEES
            ORDER BY SALARY DESC)
      WHERE ROWNUM < 8);

--extra: who gets 7th max salary
SELECT FIRST_NAME || ' ' || LAST_NAME AS FULLNAME
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY)
                FROM (SELECT SALARY
                      FROM (SELECT DISTINCT SALARY
                            FROM EMPLOYEES
                            ORDER BY SALARY DESC)
                      WHERE ROWNUM < 8));

--11. Find the 10th maximum salary from the employees table (do not include duplicates)

--STEP#1
SELECT DISTINCT SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC;

--STEP#2
SELECT SALARY
FROM (SELECT DISTINCT SALARY
      FROM EMPLOYEES
      ORDER BY SALARY DESC)
WHERE ROWNUM < 11;

--STEP#3
SELECT MIN(SALARY)
FROM (SELECT SALARY
      FROM (SELECT DISTINCT SALARY
            FROM EMPLOYEES
            ORDER BY SALARY DESC)
      WHERE ROWNUM < 11);

--extra: who gets 10th max salary
SELECT FIRST_NAME || ' ' || LAST_NAME AS FULLNAME
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY)
                FROM (SELECT SALARY
                      FROM (SELECT DISTINCT SALARY
                            FROM EMPLOYEES
                            ORDER BY SALARY DESC)
                      WHERE ROWNUM < 11));

--12. Find the 3rd minimum salary from the employees table (do not include duplicates)
--STEP#1
SELECT DISTINCT SALARY
FROM EMPLOYEES
ORDER BY SALARY;

--STEP#2
SELECT SALARY
FROM (SELECT DISTINCT SALARY
      FROM EMPLOYEES
      ORDER BY SALARY)
WHERE ROWNUM < 4;

--STEP#3
SELECT MAX(SALARY)
FROM (SELECT SALARY
      FROM (SELECT DISTINCT SALARY
            FROM EMPLOYEES
            ORDER BY SALARY)
      WHERE ROWNUM < 4);

--extra: who gets 3rd min salary
SELECT FIRST_NAME || ' ' || LAST_NAME AS FULLNAME
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
                FROM (SELECT SALARY
                      FROM (SELECT DISTINCT SALARY
                            FROM EMPLOYEES
                            ORDER BY SALARY)
                      WHERE ROWNUM < 4));

--13. Find the 5th minimum salary from the employees table (do not include duplicates)
--STEP#1
SELECT DISTINCT SALARY
FROM EMPLOYEES
ORDER BY SALARY;

--STEP#2
SELECT SALARY
FROM (SELECT DISTINCT SALARY
      FROM EMPLOYEES
      ORDER BY SALARY)
WHERE ROWNUM < 6;

--STEP#3
SELECT MAX(SALARY)
FROM (SELECT SALARY
      FROM (SELECT DISTINCT SALARY
            FROM EMPLOYEES
            ORDER BY SALARY)
      WHERE ROWNUM < 6);

--extra: who gets 5th min salary
SELECT FIRST_NAME || ' ' || LAST_NAME AS FULLNAME
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
                FROM (SELECT SALARY
                      FROM (SELECT DISTINCT SALARY
                            FROM EMPLOYEES
                            ORDER BY SALARY)
                      WHERE ROWNUM < 6))