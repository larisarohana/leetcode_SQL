/*Q.No.- 1303. Find the Team Size
Description - 
Write an SQL query to find the team size of each of the employees.

Return result table in any order.

The query result format is in the following example:


Employee Table:
+-------------+------------+
| employee_id | team_id    |
+-------------+------------+
|     1       |     8      |
|     2       |     8      |
|     3       |     8      |
|     4       |     7      |
|     5       |     9      |
|     6       |     9      |
+-------------+------------+
Result table:
+-------------+------------+
| employee_id | team_size  |
+-------------+------------+
|     1       |     3      |
|     2       |     3      |
|     3       |     3      |
|     4       |     1      |
|     5       |     2      |
|     6       |     2      |
+-------------+------------+
Employees with Id 1,2,3 are part of a team with team_id = 8.
Employees with Id 4 is part of a team with team_id = 7.
Employees with Id 5,6 are part of a team with team_id = 9.*/

CREATE Table Employee_1303 (employee_id int, team_id int);

INSERT INTO Employee_1303(employee_id,team_id) values (1,8),(2,8),(3,8),(4,7),(5,9),(6,9);

SELECT employee_id, count(employee_id) over(partition by team_id) as team_size
FROM Employee_1303
 order by employee_id;

