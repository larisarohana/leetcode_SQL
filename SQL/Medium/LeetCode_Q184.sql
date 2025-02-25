/*184. Department Highest Salary
Description - 
The Employee table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.


+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
The Department table holds all departments of the company.


+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
Write a SQL query to find employees who have the highest salary in each of the departments. For the above tables, your SQL query should return the following rows (order of rows does not matter).


+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+
Explanation:
Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.*/

Create table If Not Exists Employee_184 (id int, name varchar(255), salary int, departmentId int);
Create table If Not Exists Department_184 (id int, name varchar(255));

Truncate table Employee_184;
insert into Employee_184 (id, name, salary, departmentId) values ('1', 'Joe', '70000', '1');
insert into Employee_184 (id, name, salary, departmentId) values ('2', 'Jim', '90000', '1');
insert into Employee_184 (id, name, salary, departmentId) values ('3', 'Henry', '80000', '2');
insert into Employee_184 (id, name, salary, departmentId) values ('4', 'Sam', '60000', '2');
insert into Employee_184 (id, name, salary, departmentId) values ('5', 'Max', '90000', '1');

Truncate table Department_184;
insert into Department_184 (id, name) values ('1', 'IT');
insert into Department_184 (id, name) values ('2', 'Sales');

SELECT Department, Employee, Salary
FROM (SELECT dept.name Department
, emp.name Employee
, emp.Salary
, RANK() OVER(PARTITION BY dept.name ORDER BY emp.salary DESC) as top_salary
FROM Employee_184 emp
, Department_184 dept
WHERE emp.departmentId  = dept.id) tbl
where tbl.top_salary =1
;


