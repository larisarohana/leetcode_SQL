/*1789. Primary Department for Each Employee
Description - 
Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department is their primary department. Note that when an employee belongs to only one department, their primary column is 'N'.
Write an SQL query to report all the employees with their primary department. For employees who belong to one department, report their only department.

Return the result table in any order.

The query result format is in the following example.

Employee table:
+-------------+---------------+--------------+
| employee_id | department_id | primary_flag |
+-------------+---------------+--------------+
| 1           | 1             | N            |
| 2           | 1             | Y            |
| 2           | 2             | N            |
| 3           | 3             | N            |
| 4           | 2             | N            |
| 4           | 3             | Y            |
| 4           | 4             | N            |
+-------------+---------------+--------------+

Result table:
+-------------+---------------+
| employee_id | department_id |
+-------------+---------------+
| 1           | 1             |
| 2           | 1             |
| 3           | 3             |
| 4           | 3             |
+-------------+---------------+
- The Primary department for employee 1 is 1.
- The Primary department for employee 2 is 1.
- The Primary department for employee 3 is 3.
- The Primary department for employee 4 is 3.*/

Create table If Not Exists Employee_1789 (employee_id int, department_id int, primary_flag ENUM('Y','N'));

Truncate table Employee_1789;
insert into Employee_1789 (employee_id, department_id, primary_flag) values ('1', '1', 'N');
insert into Employee_1789 (employee_id, department_id, primary_flag) values ('2', '1', 'Y');
insert into Employee_1789 (employee_id, department_id, primary_flag) values ('2', '2', 'N');
insert into Employee_1789 (employee_id, department_id, primary_flag) values ('3', '3', 'N');
insert into Employee_1789 (employee_id, department_id, primary_flag) values ('4', '2', 'N');
insert into Employee_1789 (employee_id, department_id, primary_flag) values ('4', '3', 'Y');
insert into Employee_1789 (employee_id, department_id, primary_flag) values ('4', '4', 'N');

SELECT * FROM Employee_1789;
SELECT
employee_id
, department_id
FROM Employee_1789
WHERE (primary_flag= 'Y')
OR employee_id IN(
	SELECT employee_id
		FROM Employee_1789
        -- WHERE primary_flag = 'N'
        GROUP BY employee_id
        HAVING COUNT(department_id)=1);
        
        SELECT employee_id
		FROM Employee_1789
        -- WHERE primary_flag = 'N'
        GROUP BY employee_id
        HAVING COUNT(department_id)=1;
