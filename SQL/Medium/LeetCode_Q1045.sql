/*1045. Customers Who Bought All Products
Description - 
Write an SQL query for a report that provides the customer ids from the Customer table that bought all the products in the Product table.

For example:


Customer table:
+-------------+-------------+
| customer_id | product_key |
+-------------+-------------+
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |
+-------------+-------------+

Product table:
+-------------+
| product_key |
+-------------+
| 5           |
| 6           |
+-------------+

Result table:
+-------------+
| customer_id |
+-------------+
| 1           |
| 3           |
+-------------+
The customers who bought all the products (5 and 6) are customers with id 1 and 3.*/

Create table If Not Exists Customer_1045 (customer_id int, product_key int);
Create table Product_1045 (product_key int);

Truncate table Customer_1045;
insert into Customer_1045 (customer_id, product_key) values ('1', '5');
insert into Customer_1045 (customer_id, product_key) values ('2', '6');
insert into Customer_1045 (customer_id, product_key) values ('3', '5');
insert into Customer_1045 (customer_id, product_key) values ('3', '6');
insert into Customer_1045 (customer_id, product_key) values ('1', '6');

Truncate table Product_1045;
insert into Product_1045 (product_key) values ('5');
insert into Product_1045 (product_key) values ('6');

SELECT customer_id
FROM Customer_1045
GROUP BY customer_id
HAVING COUNT(distinct product_key) = (SELECT COUNT(DISTINCT product_key) FROM Product_1045)
;

