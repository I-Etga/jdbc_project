SELECT *
FROM EMPLOYEES;

--display all info of where first name is david

SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME = 'David';

--'' --> whatevet inside this is case sensitive

SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME = 'David'
  AND LAST_NAME = 'Lee';

--display firstname, lastname, salary where firstname is Peter
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'Peter';

--display all information from employees where salary is bigger than 6000;
SELECT *
FROM EMPLOYEES
WHERE SALARY > 6000;

--display email of who making less than 5000;
SELECT EMAIL
FROM EMPLOYEES
WHERE SALARY < 5000;

--display all info from employees who is making more than 7000 and department id is 60

SELECT *
FROM EMPLOYEES
WHERE SALARY > 7000
  AND DEPARTMENT_ID = 60;

--display all info from employees where salary equals or more than 3000 and salary equals or less than 7000

SELECT *
FROM EMPLOYEES
WHERE SALARY >= 3000
   OR SALARY <= 7000;

SELECT *
FROM EMPLOYEES
WHERE SALARY BETWEEN 3000 AND 7000;

--display all info from employees who is working as IT_PROG or MK_MAN
--Solution 1
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG'
   OR JOB_ID = 'MK_MAN';

--Solution 2
SELECT *
FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'MK_MAN');

--display all info from employee id is 121,142,154,165,187
--Solution 1
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 121
   OR EMPLOYEE_ID = 142
   OR EMPLOYEE_ID = 154
   OR EMPLOYEE_ID = 165
   OR EMPLOYEE_ID = 187;

--Solution 2
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (121, 142, 154, 165, 187);

--display all information where country id is US and IT;

SELECT *
FROM COUNTRIES
WHERE COUNTRY_ID IN ('US', 'IT');

--display all information where EXCEPT! country id is US and IT;
SELECT *
FROM COUNTRIES
WHERE COUNTRY_ID NOT IN ('US', 'IT');
-- by using 'NOT'

--IS NULL
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;

SELECT * FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;