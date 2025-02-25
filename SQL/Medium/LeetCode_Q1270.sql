/*1270. All People Report to the Given Manager
Description - 
Write an SQL query to find employee_id of all employees that directly or indirectly report their work to the head of the company.

The indirect relation between managers will not exceed 3 managers as the company is small.

Return result table in any order without duplicates.

The query result format is in the following example:


Employees table:
+-------------+---------------+------------+
| employee_id | employee_name | manager_id |
+-------------+---------------+------------+
| 1           | Boss          | 1          |
| 3           | Alice         | 3          |
| 2           | Bob           | 1          |
| 4           | Daniel        | 2          |
| 7           | Luis          | 4          |
| 8           | Jhon          | 3          |
| 9           | Angela        | 8          |
| 77          | Robert        | 1          |
+-------------+---------------+------------+

Result table:
+-------------+
| employee_id |
+-------------+
| 2           |
| 77          |
| 4           |
| 7           |
+-------------+

The head of the company is the employee with employee_id 1.
The employees with employee_id 2 and 77 report their work directly to the head of the company.
The employee with employee_id 4 report his work indirectly to the head of the company 4 --> 2 --> 1.
The employee with employee_id 7 report his work indirectly to the head of the company 7 --> 4 --> 2 --> 1.
The employees with employee_id 3, 8 and 9 don't report their work to head of company directly or indirectly.*/

CREATE TABLE Employees_1270 (		
    employee_id INT PRIMARY KEY,		
    employee_name VARCHAR(50),		
    manager_id INT		
);		
		
INSERT INTO Employees_1270 (employee_id, employee_name, manager_id) VALUES		
(1, 'Boss', 1),		
(3, 'Alice', 3),		
(2, 'Bob', 1),		
(4, 'Daniel', 2),		
(7, 'Luis', 4),		
(8, 'Jhon', 3),		
(9, 'Angela', 8), 		
(77, 'Robert', 1);		
		
Select * from Employees_1270;	
	
		
-- 1. Get all the employees who haver reporting managers excluding manager_id = 1
select e1.employee_id	
from Employees_1270 e1 		
join Employees_1270 e2 on e1.manager_id=e2.employee_id	
and e1.employee_id!=1;

-- 2. Get all the employees who haver reporting managers excluding manager_id = 1 and reporting directly to manager_id = 1
select e1.employee_id	
from Employees_1270 e1 		
join Employees_1270 e2 on e1.manager_id=e2.employee_id	
and e1.employee_id!=1
and e1.manager_id=1;

-- 3. Get all the employees who haver reporting managers excluding manager_id = 1 and reporting directly or indrectly to manager_id = 1
select e1.employee_id	
from Employees_1270 e1 		
join Employees_1270 e2 on e1.manager_id=e2.employee_id	
and e1.employee_id!=1
and e2.manager_id=1;

-- 4. Get all the employees who haver reporting managers  reporting indrectly to manager_id = 1
select e1.employee_id	
from Employees_1270 e1 		
join Employees_1270 e2 on e1.manager_id=e2.employee_id	
join Employees_1270 e3 on e2.manager_id=e3.employee_id		
where e3.manager_id=1 and e1.employee_id!=1		
