select *
from EMPLOYEES;

/*
 -Percent % --> for matching any sequence of characters. (0 or more)
 -Underscore _ --> for any single characters (each underscore represents a char)

 -contains
 -startswith
 -endswith
    --> by using LIKE operator !!
 */

--display all info of the employees where first_name startswith B

SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'B%';

--display all employees where firstname startswith B and length of it 5 letter
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'B____';

--display 5 letter firstname from employees where middle char is z

SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__z__';

--display firstname endswith 'e'

SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%e';

--display all employees where job id contains IT
SELECT *
FROM EMPLOYEES
WHERE JOB_ID LIKE '%IT&';

--display all information where firstname startswith H and ending with l
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'H%l';

