/*Q.No.- 607.Sales Person
Description - 
Given three tables: salesperson, company, orders. Output all the names in the table salesperson, who didn’t have sales to company ‘RED’.
Example Input
Table: salesperson

+----------+------+--------+-----------------+-----------+
| sales_id | name | salary | commission_rate | hire_date |
+----------+------+--------+-----------------+-----------+
|   1      | John | 100000 |     6           | 4/1/2006  |
|   2      | Amy  | 120000 |     5           | 5/1/2010  |
|   3      | Mark | 65000  |     12          | 12/25/2008|
|   4      | Pam  | 25000  |     25          | 1/1/2005  |
|   5      | Alex | 50000  |     10          | 2/3/2007  |
+----------+------+--------+-----------------+-----------+
The table salesperson holds the salesperson information. Every salesperson has a sales_id and a name. Table: company

+---------+--------+------------+
| com_id  |  name  |    city    |
+---------+--------+------------+
|   1     |  RED   |   Boston   |
|   2     | ORANGE |   New York |
|   3     | YELLOW |   Boston   |
|   4     | GREEN  |   Austin   |
+---------+--------+------------+
The table company holds the company information. Every company has a com_id and a name. Table: orders

+----------+----------+---------+----------+--------+
| order_id |  date    | com_id  | sales_id | amount |
+----------+----------+---------+----------+--------+
| 1        | 1/1/2014 |    3    |    4     | 100000 |
| 2        | 2/1/2014 |    4    |    5     | 5000   |
| 3        | 3/1/2014 |    1    |    1     | 50000  |
| 4        | 4/1/2014 |    1    |    4     | 25000  |
+----------+----------+---------+----------+--------+
The table orders holds the sales record information, salesperson and customer company are represented by sales_id and com_id. output

+------+
| name |
+------+
| Amy  |
| Mark |
| Alex |
+------+*/

Create table If Not Exists SalesPerson_607 (sales_id int, name varchar(255), salary int, commission_rate int, hire_date date);
Create table If Not Exists Company_607 (com_id int, name varchar(255), city varchar(255));
Create table If Not Exists Orders_607 (order_id int, order_date date, com_id int, sales_id int, amount int);

Truncate table SalesPerson_607;
insert into SalesPerson_607 (sales_id, name, salary, commission_rate, hire_date) values ('1', 'John', '100000', '6', '2006-04-01');
insert into SalesPerson_607 (sales_id, name, salary, commission_rate, hire_date) values ('2', 'Amy', '12000', '5', '2010-05-01');
insert into SalesPerson_607 (sales_id, name, salary, commission_rate, hire_date) values ('3', 'Mark', '65000', '12', '2008-12-25');
insert into SalesPerson_607 (sales_id, name, salary, commission_rate, hire_date) values ('4', 'Pam', '25000', '25', '2005-01-01');
insert into SalesPerson_607 (sales_id, name, salary, commission_rate, hire_date) values ('5', 'Alex', '5000', '10', '2007-02-03');

Truncate table Company_607;
insert into Company_607 (com_id, name, city) values ('1', 'RED', 'Boston');
insert into Company_607 (com_id, name, city) values ('2', 'ORANGE', 'New York');
insert into Company_607 (com_id, name, city) values ('3', 'YELLOW', 'Boston');
insert into Company_607 (com_id, name, city) values ('4', 'GREEN', 'Austin');

Truncate table Orders_607;
insert into Orders_607 (order_id, order_date, com_id, sales_id, amount) values ('1', '2014-01-01', '3', '4', '10000');
insert into Orders_607 (order_id, order_date, com_id, sales_id, amount) values ('2', '2014-02-01', '4', '5', '5000');
insert into Orders_607 (order_id, order_date, com_id, sales_id, amount) values ('3', '2014-03-01', '1', '1', '50000');
insert into Orders_607 (order_id, order_date, com_id, sales_id, amount) values ('4', '2014-04-01', '1', '4', '25000');


SELECT m1.name FROM
SalesPerson_607 m1
WHERE m1.name NOT IN
(SELECT t1.name FROM
SalesPerson_607 t1
, Company_607 t2
, Orders_607 t3
WHERE t1.sales_id = t3.sales_id
AND t2.com_id = t3.com_id
AND t2.name = 'RED'  );     
                               