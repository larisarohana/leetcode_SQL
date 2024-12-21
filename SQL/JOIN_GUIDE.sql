
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