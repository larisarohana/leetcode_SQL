/*1270. All People Report to the Given Manager
Description - 
Write an SQL query to find employee_id of all employees that directly or indirectly report their work to the head of the company.

The indirect relation between managers will not exceed 3 managers as the company is small.

Return result table in any order without duplicates.

The query result format is in the following example:


Employees table:
+-------------+---------------+------------+
| employee_id | employee_name | manager_id |
+-------------+---------------+------------+
| 1           | Boss          | 1          |
| 3           | Alice         | 3          |
| 2           | Bob           | 1          |
| 4           | Daniel        | 2          |
| 7           | Luis          | 4          |
| 8           | Jhon          | 3          |
| 9           | Angela        | 8          |
| 77          | Robert        | 1          |
+-------------+---------------+------------+

Result table:
+-------------+
| employee_id |
+-------------+
| 2           |
| 77          |
| 4           |
| 7           |
+-------------+

The head of the company is the employee with employee_id 1.
The employees with employee_id 2 and 77 report their work directly to the head of the company.
The employee with employee_id 4 report his work indirectly to the head of the company 4 --> 2 --> 1.
The employee with employee_id 7 report his work indirectly to the head of the company 7 --> 4 --> 2 --> 1.
The employees with employee_id 3, 8 and 9 don't report their work to head of company directly or indirectly.*/

CREATE TABLE Logs_1285 (
    log_id INT PRIMARY KEY
);

INSERT INTO Logs_1285 (log_id) VALUES
(1),
(2),
(3),
(7),
(8),
(10);

-- 1.  GET THE Row numbers and calcukate the rabks of each log id by subtracting log_id from row_num
SELECT log_id, ROW_NUMBER() OVER (ORDER BY log_id) AS ROW_NUM
, log_id-ROW_NUMBER() OVER (ORDER BY log_id) AS rk
FROM Logs_1285;

-- 2. Use max & min to get the start and end of each ranked log_ids by using group by function

SELECT MIN(log_id) AS start_id, MAX(log_id) AS end_id
FROM(
SELECT log_id, ROW_NUMBER() OVER (ORDER BY log_id) AS ROW_NUM
, log_id-ROW_NUMBER() OVER (ORDER BY log_id) AS rk
FROM Logs_1285) a
GROUP BY rk;

 /*SOLUTION 2*/

-- 1. 
SELECT t1.log_id AS start_id
    FROM Logs_1285 AS t1 LEFT JOIN Logs_1285 AS t2
    ON t1.log_id-1 = t2.log_id
    WHERE t2.log_id IS NULL;


SELECT start_id, MIN(end_id) AS end_id
FROM (SELECT t1.log_id AS start_id
    FROM Logs_1285 AS t1 LEFT JOIN Logs_1285 AS t2
    ON t1.log_id-1 = t2.log_id
    WHERE t2.log_id IS NULL) tt_start join
    (SELECT t1.log_id AS end_id
    FROM Logs_1285 AS t1 LEFT JOIN Logs_1285 AS t2
    ON t1.log_id+1 = t2.log_id
    WHERE t2.log_id IS NULL) tt_end
WHERE start_id<=end_id
GROUP BY start_id;

