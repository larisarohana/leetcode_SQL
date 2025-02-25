/*Q.No.- 1378. Replace Employee ID With The Unique Identifier
Description - 
Write an SQL query to show the unique ID of each user, If a user doesn't have a unique ID replace just show null.

Return the result table in any order.

The query result format is in the following example:


Employees table:
+----+----------+
| id | name     |
+----+----------+
| 1  | Alice    |
| 7  | Bob      |
| 11 | Meir     |
| 90 | Winston  |
| 3  | Jonathan |
+----+----------+

EmployeeUNI table:
+----+-----------+
| id | unique_id |
+----+-----------+
| 3  | 1         |
| 11 | 2         |
| 90 | 3         |
+----+-----------+

EmployeeUNI table:
+-----------+----------+
| unique_id | name     |
+-----------+----------+
| null      | Alice    |
| null      | Bob      |
| 2         | Meir     |
| 3         | Winston  |
| 1         | Jonathan |
+-----------+----------+

Alice and Bob don't have a unique ID, We will show null instead.
The unique ID of Meir is 2.
The unique ID of Winston is 3.
The unique ID of Jonathan is 1.*/

Create table If Not Exists Employees_1378 (id int, name varchar(20));
Create table If Not Exists EmployeeUNI_1378 (id int, unique_id int);

Truncate table Employees_1378;
insert into Employees_1378 (id, name) values ('1', 'Alice');
insert into Employees_1378 (id, name) values ('7', 'Bob');
insert into Employees_1378 (id, name) values ('11', 'Meir');
insert into Employees_1378 (id, name) values ('90', 'Winston');
insert into Employees_1378 (id, name) values ('3', 'Jonathan');

Truncate table EmployeeUNI_1378;
insert into EmployeeUNI_1378 (id, unique_id) values ('3', '1');
insert into EmployeeUNI_1378 (id, unique_id) values ('11', '2');
insert into EmployeeUNI_1378 (id, unique_id) values ('90', '3');

SELECT uni.unique_id ,
emp.name
FROM
Employees_1378 emp
LEFT JOIN EmployeeUNI_1378 uni
ON  emp.id = uni.id;