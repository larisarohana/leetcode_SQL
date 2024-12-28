/*570. Managers with at Least 5 Direct Reports
Description - 
The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.


+------+----------+-----------+----------+
|Id    |Name 	    |Department |ManagerId |
+------+----------+-----------+----------+
|101   |John 	    |A 	        |null      |
|102   |Dan 	    |A 	        |101       |
|103   |James 	  |A 	        |101       |
|104   |Amy 	    |A 	        |101       |
|105   |Anne 	    |A 	        |101       |
|106   |Ron 	    |B 	        |101       |
+------+----------+-----------+----------+
Given the Employee table, write a SQL query that finds out managers with at least 5 direct report. For the above table, your SQL query should return:


+-------+
| Name  |
+-------+
| John  |
+-------+
Note: No one would report to himself.*/

Create table If Not Exists Employee_570 (id int, name varchar(255), department varchar(255), managerId int);

Truncate table Employee_570;
insert into Employee_570 (id, name, department, managerId) values ('101', 'John', 'A', NULL);
insert into Employee_570 (id, name, department, managerId) values ('102', 'Dan', 'A', '101');
insert into Employee_570 (id, name, department, managerId) values ('103', 'James', 'A', '101');
insert into Employee_570 (id, name, department, managerId) values ('104', 'Amy', 'A', '101');
insert into Employee_570 (id, name, department, managerId) values ('105', 'Anne', 'A', '101');
insert into Employee_570 (id, name, department, managerId) values ('106', 'Ron', 'B', '101');

SELECT manager.name
FROM Employee_570 manager
, Employee_570 employee
WHERE manager.id = employee.managerId
GROUP BY manager.id, manager.name
HAVING count(employee.id) >= 5;

SELECT name 
FROM Employee_570
WHERE id in (SELECT managerid FROM
				Employee_570
                GROUP BY managerid
                HAVING count(id)>=5);