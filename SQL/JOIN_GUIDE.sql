
create table employee_join
( emp_ID varchar(50)
, emp_NAME varchar(50)
, SALARY int
, DEPT_id varchar(50)
, manager_id varchar(50));

insert into employee_join values('E1', 'Rahul', 15000, 'D1', 'M1');
insert into employee_join values('E2', 'Manoj', 15000, 'D1', 'M1');
insert into employee_join values('E3', 'James', 55000, 'D2', 'M2');
insert into employee_join values('E4', 'Michael', 25000, 'D2', 'M2');
insert into employee_join values('E5', 'Ali', 20000, 'D10', 'M3');
insert into employee_join values('E6', 'Robin', 35000, 'D10', 'M3');

create table manager_join
( manager_ID varchar(50)
, manager_NAME varchar(50)
, DEPT_id varchar(50));

insert into manager_join values('M1', 'Prem', 'D3');
insert into manager_join values('M2', 'Shripadh', 'D4');
insert into manager_join values('M3', 'Nick', 'D1');
insert into manager_join values('M4', 'Cory', 'D1');

create table department_join
( DEPT_id varchar(50)
, dept_name varchar(50));

insert into department_join values('D1', 'IT');
insert into department_join values('D2', 'HR');
insert into department_join values('D3', 'Finance');
insert into department_join values('D4', 'Admin');

create table projects_join
( project_id varchar(50)
, project_name varchar(50)
, team_member_id varchar(50));

insert into projects_join values('P1', 'Data Migration', 'E1');
insert into projects_join values('P1', 'Data Migration', 'E2');
insert into projects_join values('P1', 'Data Migration', 'M3');
insert into projects_join values('P2', 'ETL Tool', 'E1');
insert into projects_join values('P2', 'ETL Tool', 'M4');

select * from employee_join;
select * from manager_join;
select * from department_join;
select * from projects_join;

-- INNER JOIN / JOIN - Fetches records which are present in both the tables mentioned on the joining condiiton
-- Fetch the employee name and department name they belong to.
SELECT ej.emp_NAME, dj.dept_name
FROM employee_join ej
JOIN department_join dj ON ej.DEPT_id = dj.DEPT_id
;

-- LEFT JOIN - It does 2 things - First it does inner join + then any additional records in the left table
-- Fetch all the employee name and their department name they belong to
SELECT ej.emp_NAME, dj.dept_name
FROM employee_join ej
LEFT JOIN department_join dj ON ej.DEPT_id = dj.DEPT_id
;

-- RIGHT JOIN - First it does inner join + then any additional records in the right table
SELECT ej.emp_NAME, dj.dept_name
FROM employee_join ej
RIGHT JOIN department_join dj ON ej.DEPT_id = dj.DEPT_id
;

-- Fetch details of All emp , their manager, their deprtament and the projects they work on.

SELECT ej.emp_NAME, dj.dept_name, mj.manager_NAME , pj.project_name
FROM employee_join ej
LEFT JOIN department_join dj ON ej.DEPT_id = dj.DEPT_id
JOIN manager_join mj ON ej.manager_id = mj. manager_id
LEFT JOIN  projects_join pj ON (ej.emp_ID = pj.team_member_id)
;

-- FULL OUTER JOIN / FULL JOIN - INNER JOIN + all remaining records from the left table + all remaining records from the right table
-- There is no synatx for Full pouter join in MYSQL . what we can do is use union or union all to get all the values like full outer join
/*SELECT ej.emp_NAME, dj.dept_name
FROM employee_join ej
FULL JOIN department_join dj ON ej.DEPT_id = dj.DEPT_id;*/

(SELECT ej.emp_NAME, dj.dept_name
FROM employee_join ej
LEFT JOIN department_join dj ON ej.DEPT_id = dj.DEPT_id)
UNION
(SELECT ej.emp_NAME, dj.dept_name
FROM employee_join ej
RIGHT JOIN department_join dj ON ej.DEPT_id = dj.DEPT_id);

SELECT emp_NAME, dept_name
FROM ((SELECT ej.emp_NAME, dj.dept_name
FROM employee_join ej
LEFT JOIN department_join dj ON ej.DEPT_id = dj.DEPT_id)
UNION ALL
(SELECT ej.emp_NAME, dj.dept_name
FROM employee_join ej
RIGHT JOIN department_join dj ON ej.DEPT_id = dj.DEPT_id)) main
GROUP BY emp_NAME, dept_name;

-- CROSS JOIN -Returns the cartesian product
SELECT ej.emp_NAME, dj.dept_name
FROM employee_join ej -- 6 records
CROSS JOIN department_join dj ; -- 4 records
-- We will get 24 records because every record in left side table will join to every record in the right table. 
-- since employee table has 6 records and department table has 4 records so total 24 records will come.
-- Usecase is - Write a query to fetchg the employee and their corresponding department name.
-- Also make sure to display the company name and the company locatoion corresponding to each employee
create table company_join
( company_ID varchar(50)
, company_NAME varchar(50)
, location varchar(50));

insert into company_join values('C001', 'LR Solutions', 'Vancouver');

SELECT ej.emp_NAME, dj.dept_name, cj.company_name, cj.location
FROM employee_join ej
JOIN department_join dj ON ej.DEPT_id = dj.DEPT_id
CROSS JOIN company_join cj;

-- NATURAL JOIN - In natural join sql will decide the join condition and not the user
-- If the columns are sharing the same name then the joining will happen. If the tables dont have same name to join then it will not join.
SELECT ej.emp_NAME, dj.dept_name
FROM employee_join ej
NATURAL JOIN department_join dj;

-- SELF JOIN - is when you joina table to itself
create table family_join
( member_ID varchar(50)
, NAME varchar(50)
, age int
, parent_id varchar(50));

insert into family_join values('F1', 'David', 4, 'F5');
insert into family_join values('F2', 'Carol', 10, 'F5');
insert into family_join values('F3', 'Michael', 12, 'F5');
insert into family_join values('F4', 'Johnson', 36, '');
insert into family_join values('F5', 'Maryam', 40, 'F6');
insert into family_join values('F6', 'Stewart', 70, '');
insert into family_join values('F7', 'Rohan', 6, 'F4');
insert into family_join values('F8', 'Asha', 8, 'F4');

SELECT * FROM family_join;

-- Write a query to fetch the child name and their age corresponding to their parent name and parent age
SELECT f1_child.name as child_name
, f1_child.age as child_age
, f2_parent.name as parent_name
, f2_parent.age as parent_age
FROM family_join f1_child
JOIN family_join f2_parent ON f1_child.parent_id = f2_parent.member_id
;