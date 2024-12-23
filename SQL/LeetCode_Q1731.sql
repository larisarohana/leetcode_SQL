/*Q.No.- 1731. The Number of Employees Which Report to Each Employee
Description - 
Write an SQL query to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.

Return the result table ordered by employee_id.

The query result format is in the following example:


Employees table:
+-------------+---------+------------+-----+
| employee_id | name    | reports_to | age |
+-------------+---------+------------+-----+
| 9           | Hercy   | null       | 43  |
| 6           | Alice   | 9          | 41  |
| 4           | Bob     | 9          | 36  |
| 2           | Winston | null       | 37  |
+-------------+---------+------------+-----+

Result table:
+-------------+-------+---------------+-------------+
| employee_id | name  | reports_count | average_age |
+-------------+-------+---------------+-------------+
| 9           | Hercy | 2             | 39          |
+-------------+-------+---------------+-------------+
Hercy has 2 people report directly to him, Alice and Bob. Their average age is (41+36)/2 = 38.5, which is 39 after rounding it to the near*/

Create table If Not Exists Employees_1731(employee_id int, name varchar(20), reports_to int, age int);

Truncate table Employees_1731;
insert into Employees_1731 (employee_id, name, reports_to, age) values ('9', 'Hercy', NULL, '43');
insert into Employees_1731 (employee_id, name, reports_to, age) values ('6', 'Alice', '9', '41');
insert into Employees_1731 (employee_id, name, reports_to, age) values ('4', 'Bob', '9', '36');
insert into Employees_1731 (employee_id, name, reports_to, age) values ('2', 'Winston', NULL, '37');

SELECT employee_id, name, reports_count, ROUND(avg(employee_age)) as average_age 
FROM (SELECT m1.employee_id, m1.name , count(e1.employee_id) over(partition by m1.employee_id) as reports_count , e1.age as employee_age-- , ROUND(avg(e1.age))
FROM Employees_1731 m1
JOIN Employees_1731 e1
WHERE m1.employee_id = e1.reports_to) t1
GROUP BY employee_id, name, reports_count
;