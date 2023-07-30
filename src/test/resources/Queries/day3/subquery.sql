SELECT *
FROM EMPLOYEES;

--Display all information who is making max salary
--max salary

SELECT MAX(SALARY)
FROM EMPLOYEES;
--2400

--if we know max salary can we find who is getting it ?
SELECT *
FROM EMPLOYEES
WHERE SALARY = 24000;

--dynamic result
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);

--TASK: Give me all information who is getting min salary
--min salary
SELECT MIN(SALARY)
FROM EMPLOYEES;
--2100

--who is making min 2100?
SELECT *
FROM EMPLOYEES
WHERE SALARY = 2100;

--dynamic result
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES);

--First subquery gets executed !!

--Display all info who is getting second highest salary

--find MAX salary
SELECT MAX(SALARY)
FROM EMPLOYEES;
--24k

--second max salary
SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE SALARY < 24000;
--17k

--second max(dynamic)
SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES);


--who makes 17k
SELECT *
FROM EMPLOYEES
WHERE SALARY = 17000;

--dynamic
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
                FROM EMPLOYEES
                WHERE SALARY < 24000);

--more dynamic [3 queries -2 subq and 1 query]
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
                FROM EMPLOYEES
                WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES));

--Display all info who is getting more than average ?

SELECT ROUND(AVG(SALARY), 2) -->6461.83
FROM EMPLOYEES;

SELECT *
FROM EMPLOYEES
WHERE SALARY >
      (SELECT ROUND(AVG(SALARY), 2) FROM EMPLOYEES);