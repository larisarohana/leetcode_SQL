/*Q.No.- 176. Second Highest Salary
Description -  Write a SQL query to get the second highest salary from the Employee table.
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+ */

CREATE TABLE IF NOT EXISTS Employee176 (
    id INT,
    salary INT
);

Truncate table Employee176;
insert into Employee176 (id, salary) values ('1', '100');
insert into Employee176 (id, salary) values ('2', '200');
insert into Employee176 (id, salary) values ('3', '300');
insert into Employee176 (id, salary) values ('4', '200');

SELECT 
    MAX(salary)
FROM
    Employee176
WHERE
    salary < (SELECT 
            MAX(salary)
        FROM
            Employee176);

/*Table with just one record and no second highest salary*/

CREATE TABLE IF NOT EXISTS Employee176_1 (
    id INT,
    salary INT
);

Truncate table Employee176_1;
insert into Employee176_1 (id, salary) values ('1', '100');

SELECT 
    MAX(salary)
FROM
    Employee176_1
WHERE
    salary < (SELECT 
            MAX(salary)
        FROM
            Employee176_1);
            

SELECT distinct Salary
, DENSE_RANK() OVER(order by Salary desc) as denserank
, RANK() OVER(order by Salary desc) as rnk
FROM Employee176;

