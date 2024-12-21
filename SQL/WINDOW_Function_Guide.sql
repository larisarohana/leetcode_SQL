
create table employee_window
( emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee_window values(101, 'Mohan', 'Admin', 4000);
insert into employee_window values(102, 'Rajkumar', 'HR', 3000);
insert into employee_window values(103, 'Akbar', 'IT', 4000);
insert into employee_window values(104, 'Dorvin', 'Finance', 6500);
insert into employee_window values(105, 'Rohit', 'HR', 3000);
insert into employee_window values(106, 'Rajesh',  'Finance', 5000);
insert into employee_window values(107, 'Preet', 'HR', 7000);
insert into employee_window values(108, 'Maryam', 'Admin', 4000);
insert into employee_window values(109, 'Sanjay', 'IT', 6500);
insert into employee_window values(110, 'Vasudha', 'IT', 7000);
insert into employee_window values(111, 'Melinda', 'IT', 8000);
insert into employee_window values(112, 'Komal', 'IT', 10000);
insert into employee_window values(113, 'Gautham', 'Admin', 2000);
insert into employee_window values(114, 'Manisha', 'HR', 3000);
insert into employee_window values(115, 'Chandni', 'IT', 4500);
insert into employee_window values(116, 'Satya', 'Finance', 6500);
insert into employee_window values(117, 'Adarsh', 'HR', 3500);
insert into employee_window values(118, 'Tejaswi', 'Finance', 5500);
insert into employee_window values(119, 'Cory', 'HR', 8000);
insert into employee_window values(120, 'Monica', 'Admin', 5000);
insert into employee_window values(121, 'Rosalin', 'IT', 6000);
insert into employee_window values(122, 'Ibrahim', 'IT', 8000);
insert into employee_window values(123, 'Vikram', 'IT', 8000);
insert into employee_window values(124, 'Dheeraj', 'IT', 11000);

-- Selecting maximum salary from the employee table
SELECT MAX(salary) as max_salary FROM employee_window; -- 11000

-- Selecting maximum salary from the employee table BY department
SELECT DEPT_NAME, MAX(salary) as max_salary FROM employee_window GROUP BY DEPT_NAME ;

-- Selecting all columns from employee table using maximum salary as analytic function
SELECT e.*,  MAX(salary) over () as max_salary FROM employee_window e ;

-- Selecting all columns from employee table using maximum salary of every department as analytic function 
SELECT e.*,  MAX(salary) over (partition by DEPT_NAME) as max_salary FROM employee_window e ;

-- ROW_NUMBER() 
SELECT e.*, ROW_NUMBER() OVER() as rn
FROM employee_window e;

SELECT e.*, ROW_NUMBER() OVER(partition by DEPT_NAME) as rn
FROM employee_window e;

-- Fetch the first 2 employees from each department to join the company
SELECT * FROM
(SELECT e.*, ROW_NUMBER() OVER(partition by DEPT_NAME order by emp_ID) as rn
FROM employee_window e) t1
where t1.rn<3;

-- RANK()
-- Fetch the top 3 employees in each department earning the max salary
SELECT * FROM 
(SELECT e.*, RANK() OVER(partition by DEPT_NAME order by salary DESC) as rnk
FROM employee_window e) t1
WHERE t1.rnk <4;

-- DENSE_RANK()
-- Fetch the top 3 employees in each department earning the max salary
SELECT e.*, RANK() OVER(partition by DEPT_NAME order by salary DESC) as rnk ,
DENSE_RANK() OVER(partition by DEPT_NAME order by salary DESC) as dense_rnk
FROM employee_window e;

-- LEAD/LAG
-- Fetch a query to display if the salary of an employee is higher , lower or equal to the previous employee
SELECT e.*, 
LAG(salary) OVER(partition by DEPT_NAME order by emp_id) as prev_emp_sal
FROM employee_window e;

-- Fetch a query to display if the salary of an employee is higher , lower or equal to the previous 2 employee  or display 0
SELECT e.*, 
LAG(salary,2,0) OVER(partition by DEPT_NAME order by emp_id) as prev_emp_sal
FROM employee_window e;

-- Fetch a query to display if the salary of an employee is higher , lower or equal to the next employee
SELECT e.*, 
LAG(salary) OVER(partition by DEPT_NAME order by emp_id) as prev_emp_sal,
LEAD(salary) OVER(partition by DEPT_NAME order by emp_id) as next_emp_sal
FROM employee_window e;

-- UseCase 
-- When salary is greater than previous Employee's salary then display "Higher than previous employee" 
-- else "Lower than previous employee" Or if its equal to then display "Same as previous employee"

SELECT e.*, 
LAG(salary) OVER(partition by DEPT_NAME order by emp_id) as prev_emp_sal,
CASE WHEN e.SALARY > LAG(salary) OVER(partition by DEPT_NAME order by emp_id) then 'Higher than previous employee'
	WHEN e.SALARY < LAG(salary) OVER(partition by DEPT_NAME order by emp_id) then 'Lower than previous employee'
    WHEN e.SALARY = LAG(salary) OVER(partition by DEPT_NAME order by emp_id) then 'Same as previous employee'
    end sal_range
FROM employee_window e;



