/*Q.No.- 176. Second Highest Salary
Description -  Write a SQL query to get the second highest salary from the Employee table.
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+ */

Create table If Not Exists Employee176 (id int, salary int);

Truncate table Employee176;
insert into Employee176 (id, salary) values ('1', '100');
insert into Employee176 (id, salary) values ('2', '200');
insert into Employee176 (id, salary) values ('3', '300');

select max(salary) from Employee176 where salary <(select max(salary) from Employee176);

/*Table with just one record and no second highest salary*/

Create table If Not Exists Employee176_1 (id int, salary int);

Truncate table Employee176_1;
insert into Employee176_1 (id, salary) values ('1', '100');

select max(salary) from Employee176_1 where salary <(select max(salary) from Employee176_1);


