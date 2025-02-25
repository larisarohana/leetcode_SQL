Create table If Not Exists Employee_185 (id int, name varchar(255), salary int, departmentId int);
Create table If Not Exists Department_185 (id int, name varchar(255));

Truncate table Employee_185;
insert into Employee_185 (id, name, salary, departmentId) values ('1', 'Joe', '85000', '1');
insert into Employee_185 (id, name, salary, departmentId) values ('2', 'Henry', '80000', '2');
insert into Employee_185 (id, name, salary, departmentId) values ('3', 'Sam', '60000', '2');
insert into Employee_185 (id, name, salary, departmentId) values ('4', 'Max', '90000', '1');
insert into Employee_185 (id, name, salary, departmentId) values ('5', 'Janet', '69000', '1');
insert into Employee_185 (id, name, salary, departmentId) values ('6', 'Randy', '85000', '1');
insert into Employee_185 (id, name, salary, departmentId) values ('7', 'Will', '70000', '1');

Truncate table Department_185;
insert into Department_185 (id, name) values ('1', 'IT');
insert into Department_185 (id, name) values ('2', 'Sales');

SELECT Department, Employee, Salary FROM
(SELECT t1.name as Department, t2.name as Employee, t2.Salary
, dense_rank() over(partition by t2.departmentId order by salary DESC) salary_rank
FROM
Department_185 t1
JOIN Employee_185 t2
ON  t1.id = t2.departmentId) tbl
WHERE salary_rank <=3
;