SELECT *
FROM EMPLOYEES;


SELECT *
FROM EMPLOYEES
WHERE ROWNUM < 11;
--returns only 10 column result

--display all info from employees who is getting first 5 highest salary

SELECT DISTINCT *
FROM EMPLOYEES
WHERE ROWNUM < 6
ORDER BY SALARY DESC;

--
SELECT *
FROM EMPLOYEES
ORDER BY SALARY DESC;

--correct answer
--using ordered by salary desc employees table as an input,
-- after FROM keyword then cutting first 5 rownum
SELECT *
FROM (SELECT *
      FROM EMPLOYEES
      ORDER BY SALARY DESC)
WHERE ROWNUM < 6;

--display all info who is getting 5th highest salary
SELECT DISTINCT SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC;

--first we need to find what is 5th highest salary
SELECT MIN(SALARY)
FROM (SELECT DISTINCT SALARY
      FROM EMPLOYEES
      ORDER BY SALARY DESC)
WHERE ROWNUM < 6;
--13k

--last part of task --> who is making 5th highest salary ?
SELECT *
FROM EMPLOYEES
WHERE SALARY = 13000;

--dynamic
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY)
                FROM (SELECT DISTINCT SALARY
                      FROM EMPLOYEES
                      ORDER BY SALARY DESC)
                WHERE ROWNUM < 6);


-- how do you find who is making 37th highest salary
-- for the Nth highest salary formula is rownum < N+1
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY)
                FROM (SELECT DISTINCT SALARY
                      FROM EMPLOYEES
                      ORDER BY SALARY DESC)
                WHERE ROWNUM < 6)

--HOMEWORK --> display all info who is making 3th lowest salary

--#1 --get the unique salaries and order them desc.
SELECT DISTINCT SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC;

--#2 returns the only highest 3 salaries
SELECT *
FROM (SELECT DISTINCT SALARY
      FROM EMPLOYEES
      ORDER BY SALARY DESC)
WHERE ROWNUM < 4;

--#3 returns the 3th highest salary
SELECT MIN(SALARY)
FROM (SELECT *
      FROM (SELECT DISTINCT SALARY
            FROM EMPLOYEES
            ORDER BY SALARY DESC)
      WHERE ROWNUM < 4);

--#4 [final step] returns who is making the 3th highest salary
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY)
                FROM (SELECT *
                      FROM (SELECT DISTINCT SALARY
                            FROM EMPLOYEES
                            ORDER BY SALARY DESC)
                      WHERE ROWNUM < 4));