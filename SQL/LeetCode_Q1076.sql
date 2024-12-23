/*Q.No.- 1076. Project Employees II
Description - 
Write an SQL query that reports all the projects that have the most employees.
The query result format is in the following example:

Project table:
+-------------+-------------+
| project_id  | employee_id |
+-------------+-------------+
| 1           | 1           |
| 1           | 2           |
| 1           | 3           |
| 2           | 1           |
| 2           | 4           |
+-------------+-------------+

Employee table:
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 1                |
| 4           | Doe    | 2                |
+-------------+--------+------------------+

Result table:
+-------------+
| project_id  |
+-------------+
| 1           |
+-------------+
The first project has 3 employees while the second one has 2.*/

Create table If Not Exists Project_1076 (project_id int, employee_id int);
Create table If Not Exists Employee_1076 (employee_id int, name varchar(10), experience_years int);

Truncate table Project_1076;
insert into Project_1076 (project_id, employee_id) values ('1', '1');
insert into Project_1076 (project_id, employee_id) values ('1', '2');
insert into Project_1076 (project_id, employee_id) values ('1', '3');
insert into Project_1076 (project_id, employee_id) values ('2', '1');
insert into Project_1076 (project_id, employee_id) values ('2', '4');

Truncate table Employee_1076;
insert into Employee_1076 (employee_id, name, experience_years) values ('1', 'Khaled', '3');
insert into Employee_1076 (employee_id, name, experience_years) values ('2', 'Ali', '2');
insert into Employee_1076 (employee_id, name, experience_years) values ('3', 'John', '1');
insert into Employee_1076 (employee_id, name, experience_years) values ('4', 'Doe', '2');

SELECT project_id
FROM Project_1076
GROUP BY project_id
HAVING COUNT(employee_id) = (SELECT COUNT(employee_id) as total_employees
FROM Project_1076
GROUP BY project_id 
ORDER BY COUNT(employee_id) DESC
LIMIT 1); 
