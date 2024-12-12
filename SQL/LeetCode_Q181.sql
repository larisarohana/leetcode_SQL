/*Q.No.- 181. Employees Earning More Than Their Managers
Description -  The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.
+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+
Given the Employee table, write a SQL query that finds out employees who earn more than their managers. For the above table, Joe is the only employee who earns more than his manager.
+----------+
| Employee |
+----------+
| Joe      |
+----------+ */

CREATE TABLE IF NOT EXISTS Employee_181 (
    id INT,
    name VARCHAR(255),
    salary INT,
    managerId INT
);

Truncate table Employee_181;

insert into Employee_181 (id, name, salary, managerId) values ('1', 'Joe', '70000', '3');
insert into Employee_181 (id, name, salary, managerId) values ('2', 'Henry', '80000', '4');
insert into Employee_181 (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL);
insert into Employee_181 (id, name, salary, managerId) values ('4', 'Max', '90000', NULL);

select * from Employee_181;

SELECT emp.name as Employee
FROM  Employee_181 emp,
Employee_181 mang
where emp.managerId = mang.id
and emp.salary > mang.salary;