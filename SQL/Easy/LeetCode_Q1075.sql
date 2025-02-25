/*Q.No.- 1075. Project Employees I
Description - 
Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

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
+-------------+---------------+
| project_id  | average_years |
+-------------+---------------+
| 1           | 2.00          |
| 2           | 2.50          |
+-------------+---------------+
The average experience years for the first project is (3 + 2 + 1) / 3 = 2.00 and for the second project is (3 + 2) / 2 = 2.50*/

Create table If Not Exists Project_1075 (project_id int, employee_id int);
Create table If Not Exists Employee_1075 (employee_id int, name varchar(10), experience_years int);

Truncate table Project_1075;
insert into Project_1075 (project_id, employee_id) values ('1', '1');
insert into Project_1075 (project_id, employee_id) values ('1', '2');
insert into Project_1075 (project_id, employee_id) values ('1', '3');
insert into Project_1075 (project_id, employee_id) values ('2', '1');
insert into Project_1075 (project_id, employee_id) values ('2', '4');

Truncate table Employee_1075;
insert into Employee_1075 (employee_id, name, experience_years) values ('1', 'Khaled', '3');
insert into Employee_1075 (employee_id, name, experience_years) values ('2', 'Ali', '2');
insert into Employee_1075 (employee_id, name, experience_years) values ('3', 'John', '1');
insert into Employee_1075 (employee_id, name, experience_years) values ('4', 'Doe', '2');

SELECT t1.project_id ,round(avg(t2.experience_years),2) as average_years 
FROM Project_1075 t1,
Employee_1075 t2
WHERE t1.employee_id = t2.employee_id
GROUP BY project_id;