--SELECT * FROM EMPLOYEES;

/*
 it shows different values from query result based provided column
 */

--It returns 107
SELECT FIRST_NAME FROM EMPLOYEES;

--It removes duplicates and returns 91 result
SELECT DISTINCT FIRST_NAME FROM EMPLOYEES;

--It will check each row to filter different columns --> * --> all columns
SELECT DISTINCT * FROM EMPLOYEES;

SELECT * FROM JOBS;

SELECT JOB_ID FROM JOBS;

--Since primary key cannot be duplicate, it gives the same results
SELECT DISTINCT JOB_ID FROM JOBS;