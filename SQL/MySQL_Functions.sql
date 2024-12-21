-- LIMIT & OFFSET CLAUSE
SELECT * FROM employee_window e;
SELECT * FROM employee_window e LIMIT 3 OFFSET 4;

-- COALESCE() - Coalesce returns the first non-null value in a list. If all the values in the list are NULL, then the function returns null.
SELECT e.*, 
coalesce(LAG(salary) OVER(partition by DEPT_NAME order by emp_id) , 0) AS prev_emp_sal
FROM employee_window e;

-- DATEDIFF() - The DATEDIFF() function calculates the difference between two date or timestamp values and returns the result in a specified unit, such as days, months, or years.
SELECT DATEDIFF('2024-06-01', '2022-12-31') AS days_difference;

-- Problem: MySQL’s DATEDIFF() only supports day differences.
-- Solution: Use TIMESTAMPDIFF() for granular units like years or months.
-- Correct (MySQL)
SELECT TIMESTAMPDIFF(YEAR, '2023-01-01', '2024-01-01') AS years_difference; 

-- CAST() - The CAST() function converts a value (of any type) into a specified datatype.
/*The datatypes in which a given value can be converted are:
DATE: It is used to convert a value to the DATE datatype. The Format returned is “YYYY-MM-DD”.
DATETIME: It is used to convert a value to the DATETIME datatype. The Format returned is “YYYY-MM-DD HH:MM: SS”.
TIME: It is used to convert a value to the TIME datatype. The Format returned is “HH:MM: SS”.
CHAR: It is used to convert a value to the CHAR datatype.
SIGNED: It is used to convert a value to a SIGNED datatype.
UNSIGNED: It is used to convert a value to an UNSIGNED datatype.
BINARY: It is used to convert a value to a BINARY datatype.*/
SELECT CAST('2017-08-25' AS datetime);
SELECT CAST(25.65 AS char);

-- ABS() - Return the absolute value of a number:
SELECT ABS(-243.5);

-- DATE_ADD() - The DATE_ADD() function adds a time/date interval to a date and then returns the date.
SELECT DATE_ADD("2024-12-19", INTERVAL 10 DAY);
SELECT DATE_ADD("2024-12-19 09:34:21", INTERVAL 15 MINUTE);
SELECT DATE_ADD("2024-12-19 09:34:21", INTERVAL -3 HOUR);
SELECT DATE_ADD("2024-12-19", INTERVAL -2 MONTH);

-- DATE_SUB() - The DATE_ADD() function subtracts a time/date interval to a date and then returns the date.
SELECT DATE_SUB("2024-12-19", INTERVAL 10 DAY);
SELECT DATE_SUB("2024-12-19 09:34:21", INTERVAL 15 MINUTE);
SELECT DATE_SUB("2024-12-19 09:34:21", INTERVAL -3 HOUR);
SELECT DATE_SUB("2024-12-19", INTERVAL -2 MONTH);