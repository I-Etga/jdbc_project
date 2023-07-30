SELECT *
FROM EMPLOYEES;

/*
    1.Column alieases --> it is temporary name to show in display

    2.Table alieases which we will learn later
        Employees --> E

 */

--the query below second column name is "ROUND(AVG(SALARY))" which is not nice.
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) as "Average salary"
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL --to remove null department id from the result
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) > 6000
ORDER BY 2 ASC;

--manager is asking display annual salary for all employees as annual_salary
SELECT FIRST_NAME, SALARY * 12 as annual_salary
FROM EMPLOYEES;

--Note: We're just displaying. So nothing will change DB!!

-------- STRING MANIPULATION --------

/*
        CONCAT
            --Java --> + first_name+" "+last_name
            --SQL --> || first_name||' '||last_name
 */

--I want to get fullname column where we have firstname + ' ' + lastname

SELECT FIRST_NAME || ' ' || LAST_NAME as full_name
FROM EMPLOYEES;

--add @cydeo.com to all the emails in the employee table.
SELECT email || '@cydeo.com'
FROM EMPLOYEES;

SELECT CONCAT(EMAIL, '@cydeo.com')
FROM EMPLOYEES;

--lowercase
SELECT LOWER(EMAIL || '@cydeo.com')
FROM EMPLOYEES;

--UPPERcase
SELECT UPPER(EMAIL || '@cydeo.com')
FROM EMPLOYEES;

--initcap --> it makes the FIRST LETTER uppercase

SELECT INITCAP(EMAIL || '@cydeo.com')
FROM EMPLOYEES;

--LENGTH

SELECT EMAIL, LENGTH(EMAIL) AS email_length
FROM EMPLOYEES;

--display all employees where firstname length equals 6
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) = 6;

--another solution
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '______';

--how many employees ?
SELECT COUNT(*)
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '______';

--display initial from firstname and lastname -->S.K. ---- N.K.
--SUBSTR(columnName, beginningIndex, numberOfChar)
SELECT *
FROM EMPLOYEES;

SELECT SUBSTR(FIRST_NAME, 0, 1) || '.' || SUBSTR(LAST_NAME, 0, 1) || '.' as initials
from EMPLOYEES;

SELECT SUBSTR(FIRST_NAME, 1, 1) || '.' || SUBSTR(LAST_NAME, 1, 1) || '.' as initials
from EMPLOYEES;

-- minus index starts from the end !!
SELECT SUBSTR(FIRST_NAME, -3, 2)
FROM EMPLOYEES;

SELECT SUBSTR(FIRST_NAME, -4)
FROM EMPLOYEES;

/*
    - if beginning index is 0, it is treated as 1
    -if the beginning index negative, it will start from backwards
    -if we dont specify number of char it will work till the end
 */