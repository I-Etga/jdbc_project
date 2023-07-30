SELECT *
FROM EMPLOYEES;

--Task1: How many locations we have for each country

SELECT *
FROM LOCATIONS;

SELECT COUNTRY_ID, COUNT(*)
FROM LOCATIONS
group by COUNTRY_ID;

--order them based country_id asc
SELECT COUNTRY_ID, COUNT(*)
FROM LOCATIONS
group by COUNTRY_ID
ORDER BY COUNTRY_ID DESC;

--what if I want to see only US,UK and CA

SELECT COUNTRY_ID, COUNT(*)
FROM LOCATIONS
WHERE COUNTRY_ID IN ('US', 'UK', 'CA')
GROUP BY COUNTRY_ID
ORDER BY COUNTRY_ID DESC;

--display where location count is bigger than 2
SELECT COUNTRY_ID, COUNT(*)
FROM LOCATIONS
WHERE COUNTRY_ID IN ('US', 'UK', 'CA')
GROUP BY COUNTRY_ID
HAVING COUNT(*) > 2
ORDER BY COUNTRY_ID DESC;

--Task2: Display all employees salary in following format as column name Employees_salary
--Ex:
--Steven makes 24000
--Neena makes 17000

SELECT *
FROM EMPLOYEES;

SELECT FIRST_NAME || ' makes ' || SALARY as Employee_salary
FROM EMPLOYEES;