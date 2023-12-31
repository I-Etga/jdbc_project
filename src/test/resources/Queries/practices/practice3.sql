--1. FIND OUT COUNTRY NAME AND REGION NAME FROM COUNTRIES
-- AND REGION TABLE
SELECT *
FROM COUNTRIES;

SELECT *
FROM REGIONS;

SELECT COUNTRY_NAME, REGION_NAME
FROM COUNTRIES C
         JOIN REGIONS R on C.REGION_ID = R.REGION_ID;


--2. FIND OUT FIRST_NAME AND JOB_TITLE
-- FROM JOBS AND EMPLOYEES TABLE

SELECT *
FROM JOBS;
-- JOB_ID IS COMMON
SELECT *
FROM EMPLOYEES;

SELECT FIRST_NAME, JOB_TITLE
FROM EMPLOYEES E
         JOIN JOBS J ON J.JOB_ID = E.JOB_ID;


--3. FIND OUT DEPARTMENT_NAME AND CITY
SELECT *
FROM DEPARTMENTS;

--LOCATION_ID IS COMMON
SELECT *
FROM LOCATIONS;

SELECT DEPARTMENT_NAME, CITY
FROM DEPARTMENTS D
         JOIN LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID;


--4. FIND OUT ALL CITIES AND COUNTRY NAMES

SELECT *
FROM LOCATIONS;

--COUNTRY_ID IS COMMON
SELECT *
FROM COUNTRIES;

SELECT CITY, COUNTRY_NAME
FROM COUNTRIES C
         JOIN LOCATIONS L on C.COUNTRY_ID = L.COUNTRY_ID;


--5. FIND OUT FIRST_NAME, LAST NAME, DEPARTMENT ID ,
-- DEPARTMENT NAME FOR DEPARTMENT ID 80 OR 40

SELECT *
FROM EMPLOYEES;

--DEPARTMENT_ID IS COMMON
SELECT *
FROM DEPARTMENTS;

SELECT FIRST_NAME, LAST_NAME, D.DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS D
         JOIN EMPLOYEES E on E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.DEPARTMENT_ID IN (40, 80)
ORDER BY DEPARTMENT_ID;


--6. FIND OUT CITY , COUNTRY_NAME OF THAT CITY ,
-- REGION_NAME OF THAT CITY

SELECT *
FROM COUNTRIES;
--COUNTRY_ID IS COMMON
SELECT *
FROM LOCATIONS;

SELECT CITY, COUNTRY_NAME, REGION_NAME
FROM COUNTRIES C
         JOIN LOCATIONS L on C.COUNTRY_ID = L.COUNTRY_ID
         JOIN REGIONS R on C.REGION_ID = R.REGION_ID;


-- 7. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME , CITY

SELECT FIRST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY
FROM EMPLOYEES E
         JOIN JOBS J on J.JOB_ID = E.JOB_ID
         JOIN DEPARTMENTS D on D.DEPARTMENT_ID = E.DEPARTMENT_ID
         JOIN LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID;


--8. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE ,
-- DEPARTMENT_NAME , CITY , COUNTRY_NAME , REGION_NAME
SELECT FIRST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY, COUNTRY_NAME, REGION_NAME
FROM EMPLOYEES E
         JOIN JOBS J on E.JOB_ID = J.JOB_ID
         JOIN DEPARTMENTS D on D.DEPARTMENT_ID = E.DEPARTMENT_ID
         JOIN LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID
         JOIN COUNTRIES C on L.COUNTRY_ID = C.COUNTRY_ID
         JOIN REGIONS R on C.REGION_ID = R.REGION_ID
ORDER BY REGION_NAME;


--9. FIND OUR EMPLOYEES FIRST_NAME, LAST NAME, DEPARTMENT ID AND ALL DEPARTMENTS -INCLUDING-
-- WHERE DO NOT HAVE ANY EMPLOYEE.

SELECT *
FROM DEPARTMENTS;
SELECT *
FROM EMPLOYEES;

SELECT FIRST_NAME, LAST_NAME, D.DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS D
         LEFT OUTER JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;

--10. FIND OUT ALL DEPARTMENT_NAME , LOCATION_ID , AND COUNTRY_ID
-- INCLUDING THOSE LOCATIONS WITH NO DEPARTMENT

SELECT DEPARTMENT_NAME, D.LOCATION_ID, COUNTRY_ID
FROM DEPARTMENTS D
         RIGHT OUTER JOIN LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID
ORDER BY 1;
--- we are ordering by first column so all nulls show in one place ;

--11.FIND OUT DEPARTMENT_NAME , LOCATION_ID , AND COUNTRY_NAME
-- INCLUDING THOSE COUNTRIES WITH NO DEPARTMENT
SELECT D.DEPARTMENT_NAME, L.LOCATION_ID, C.COUNTRY_NAME
FROM DEPARTMENTS D
         -- RETURN ALL MATCHING LOCATIONS FOR DEPARTMENTS
         -- + ANY THAT DOES NOT MATCH DEPARTMENT LOCATION
         RIGHT OUTER JOIN LOCATIONS L ON L.LOCATION_ID = D.LOCATION_ID

    -- RETURN ALL MATCHING COUNTRIES FOR LOCATIONS
    -- + ANY COUNTRY THAT DOES NOT MATCH ANY LOCATION
         RIGHT OUTER JOIN COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID;


--12. FIND OUT EMPLOYEES FIRST_NAME, DEPARTMENT ID AND DEPARTMENT NAME
-- INCLUDING THOSE DOES NOT HAVE DEPARTMENT,
-- INCLUDING THOSE DEPARTMENTS DOES NOT HAVE ANY MATCHING EMPLOYEES

SELECT E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E
         FULL OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
