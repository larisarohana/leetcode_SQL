/*1757. Recyclable and Low Fat Products
Description - 
Write an SQL query to find the ids of products that are both low fat and recyclable.

Return the result table in any order.

The query result format is in the following example:


Products table:
+-------------+----------+------------+
| product_id  | low_fats | recyclable |
+-------------+----------+------------+
| 0           | Y        | N          |
| 1           | Y        | Y          |
| 2           | N        | Y          |
| 3           | Y        | Y          |
| 4           | N        | N          |
+-------------+----------+------------+
Result table:
+-------------+
| product_id  |
+-------------+
| 1           |
| 3           |
+-------------+
Only products 1 and 3 are both low fat and recyclable.*/

Create table If Not Exists Products_1757 (product_id int, low_fats ENUM('Y', 'N'), recyclable ENUM('Y','N'));

Truncate table Products_1757;
insert into Products_1757 (product_id, low_fats, recyclable) values ('0', 'Y', 'N');
insert into Products_1757 (product_id, low_fats, recyclable) values ('1', 'Y', 'Y');
insert into Products_1757 (product_id, low_fats, recyclable) values ('2', 'N', 'Y');
insert into Products_1757 (product_id, low_fats, recyclable) values ('3', 'Y', 'Y');
insert into Products_1757 (product_id, low_fats, recyclable) values ('4', 'N', 'N');

Select product_id  
from Products_1757 
Where low_fats = 'Y'
AND recyclable  = 'Y';