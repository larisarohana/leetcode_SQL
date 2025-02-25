/*1741. Find Total Time Spent by Each Employee
Description - 
Write an SQL query to calculate the total time in minutes spent by each employee on each day at the office. Note that within one day, an employee can enter and leave more than once.

Return the result table in any order.

The query result format is in the following example:


Employees table:
+--------+------------+---------+----------+
| emp_id | event_day  | in_time | out_time |
+--------+------------+---------+----------+
| 1      | 2020-11-28 | 4       | 32       |
| 1      | 2020-11-28 | 55      | 200      |
| 1      | 2020-12-03 | 1       | 42       |
| 2      | 2020-11-28 | 3       | 33       |
| 2      | 2020-12-09 | 47      | 74       |
+--------+------------+---------+----------+
Result table:
+------------+--------+------------+
| day        | emp_id | total_time |
+------------+--------+------------+
| 2020-11-28 | 1      | 173        |
| 2020-11-28 | 2      | 30         |
| 2020-12-03 | 1      | 41         |
| 2020-12-09 | 2      | 27         |
+------------+--------+------------+
Employee 1 has three events two on day 2020-11-28 with a total of (32 - 4) + (200-55) = 173 and one on day 2020-12-03 with a total of (42 - 1) = 41.
Employee 2 has two events one on day 2020-11-28 with a total of (33-3) = 30 and one on day 2020-12-09 with a total of (74 - 47) = 27.*/

Create table If Not Exists Employees_1741(emp_id int, event_day date, in_time int, out_time int);

Truncate table Employees_1741;
insert into Employees_1741 (emp_id, event_day, in_time, out_time) values ('1', '2020-11-28', '4', '32');
insert into Employees_1741 (emp_id, event_day, in_time, out_time) values ('1', '2020-11-28', '55', '200');
insert into Employees_1741 (emp_id, event_day, in_time, out_time) values ('1', '2020-12-3', '1', '42');
insert into Employees_1741 (emp_id, event_day, in_time, out_time) values ('2', '2020-11-28', '3', '33');
insert into Employees_1741 (emp_id, event_day, in_time, out_time) values ('2', '2020-12-9', '47', '74');

SELECT 
event_day day
, emp_id
, SUM(out_time-in_time) total_time
FROM Employees_1741
GROUP BY 1,2;