/*1327. List the Products Ordered in a Period
Description - 
Write an SQL query to get the names of products with greater than or equal to 100 units ordered in February 2020 and their amount.

Return result table in any order.

The query result format is in the following example:


Products table:
+-------------+-----------------------+------------------+
| product_id  | product_name          | product_category |
+-------------+-----------------------+------------------+
| 1           | Leetcode Solutions    | Book             |
| 2           | Jewels of Stringology | Book             |
| 3           | HP                    | Laptop           |
| 4           | Lenovo                | Laptop           |
| 5           | Leetcode Kit          | T-shirt          |
+-------------+-----------------------+------------------+

Orders table:
+--------------+--------------+----------+
| product_id   | order_date   | unit     |
+--------------+--------------+----------+
| 1            | 2020-02-05   | 60       |
| 1            | 2020-02-10   | 70       |
| 2            | 2020-01-18   | 30       |
| 2            | 2020-02-11   | 80       |
| 3            | 2020-02-17   | 2        |
| 3            | 2020-02-24   | 3        |
| 4            | 2020-03-01   | 20       |
| 4            | 2020-03-04   | 30       |
| 4            | 2020-03-04   | 60       |
| 5            | 2020-02-25   | 50       |
| 5            | 2020-02-27   | 50       |
| 5            | 2020-03-01   | 50       |
+--------------+--------------+----------+

Result table:
+--------------------+---------+
| product_name       | unit    |
+--------------------+---------+
| Leetcode Solutions | 130     |
| Leetcode Kit       | 100     |
+--------------------+---------+

Products with product_id = 1 is ordered in February a total of (60 + 70) = 130.
Products with product_id = 2 is ordered in February a total of 80.
Products with product_id = 3 is ordered in February a total of (2 + 3) = 5.
Products with product_id = 4 was not ordered in February 2020.
Products with product_id = 5 is ordered in February a total of (50 + 50) = 100.*/

Create table If Not Exists Products_1327 (product_id int, product_name varchar(40), product_category varchar(40));
Create table If Not Exists Orders_1327 (product_id int, order_date date, unit int);

Truncate table Products_1327;
insert into Products_1327 (product_id, product_name, product_category) values ('1', 'Leetcode Solutions', 'Book');
insert into Products_1327 (product_id, product_name, product_category) values ('2', 'Jewels of Stringology', 'Book');
insert into Products_1327 (product_id, product_name, product_category) values ('3', 'HP', 'Laptop');
insert into Products_1327 (product_id, product_name, product_category) values ('4', 'Lenovo', 'Laptop');
insert into Products_1327 (product_id, product_name, product_category) values ('5', 'Leetcode Kit', 'T-shirt');

Truncate table Orders_1327;
insert into Orders_1327 (product_id, order_date, unit) values ('1', '2020-02-05', '60');
insert into Orders_1327 (product_id, order_date, unit) values ('1', '2020-02-10', '70');
insert into Orders_1327 (product_id, order_date, unit) values ('2', '2020-01-18', '30');
insert into Orders_1327 (product_id, order_date, unit) values ('2', '2020-02-11', '80');
insert into Orders_1327 (product_id, order_date, unit) values ('3', '2020-02-17', '2');
insert into Orders_1327 (product_id, order_date, unit) values ('3', '2020-02-24', '3');
insert into Orders_1327 (product_id, order_date, unit) values ('4', '2020-03-01', '20');
insert into Orders_1327 (product_id, order_date, unit) values ('4', '2020-03-04', '30');
insert into Orders_1327 (product_id, order_date, unit) values ('4', '2020-03-04', '60');
insert into Orders_1327 (product_id, order_date, unit) values ('5', '2020-02-25', '50');
insert into Orders_1327 (product_id, order_date, unit) values ('5', '2020-02-27', '50');
insert into Orders_1327 (product_id, order_date, unit) values ('5', '2020-03-01', '50');

SELECT t2.product_name, SUM(t1.UNIT) as unit
FROM Orders_1327 t1
, Products_1327 t2
WHERE t1.product_id = t2.product_id
and t1.order_date like '2020-02%'
GROUP BY t2.product_name
HAVING  SUM(t1.UNIT)>=100;
