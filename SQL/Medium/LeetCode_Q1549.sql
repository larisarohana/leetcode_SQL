/*1549. The Most Recent Orders for Each Product
Description - 
Write an SQL query to find the most recent order(s) of each product.

Return the result table sorted by product_name in ascending order and in case of a tie by the product_id in ascending order. If there still a tie, order them by the order_id in ascending order.

The query result format is in the following example:


Customers
+-------------+-----------+
| customer_id | name      |
+-------------+-----------+
| 1           | Winston   |
| 2           | Jonathan  |
| 3           | Annabelle |
| 4           | Marwan    |
| 5           | Khaled    |
+-------------+-----------+

Orders
+----------+------------+-------------+------------+
| order_id | order_date | customer_id | product_id |
+----------+------------+-------------+------------+
| 1        | 2020-07-31 | 1           | 1          |
| 2        | 2020-07-30 | 2           | 2          |
| 3        | 2020-08-29 | 3           | 3          |
| 4        | 2020-07-29 | 4           | 1          |
| 5        | 2020-06-10 | 1           | 2          |
| 6        | 2020-08-01 | 2           | 1          |
| 7        | 2020-08-01 | 3           | 1          |
| 8        | 2020-08-03 | 1           | 2          |
| 9        | 2020-08-07 | 2           | 3          |
| 10       | 2020-07-15 | 1           | 2          |
+----------+------------+-------------+------------+

Products
+------------+--------------+-------+
| product_id | product_name | price |
+------------+--------------+-------+
| 1          | keyboard     | 120   |
| 2          | mouse        | 80    |
| 3          | screen       | 600   |
| 4          | hard disk    | 450   |
+------------+--------------+-------+

Result table:
+--------------+------------+----------+------------+
| product_name | product_id | order_id | order_date |
+--------------+------------+----------+------------+
| keyboard     | 1          | 6        | 2020-08-01 |
| keyboard     | 1          | 7        | 2020-08-01 |
| mouse        | 2          | 8        | 2020-08-03 |
| screen       | 3          | 3        | 2020-08-29 |
+--------------+------------+----------+------------+
keyboard's most recent order is in 2020-08-01, it was ordered two times this day.
mouse's most recent order is in 2020-08-03, it was ordered only once this day.
screen's most recent order is in 2020-08-29, it was ordered only once this day.
The hard disk was never ordered and we don't include it in the result table.
*/

CREATE TABLE Customers_1549 (	
    customer_id INT PRIMARY KEY,	
    name VARCHAR(50) NOT NULL	
);	
	
	
INSERT INTO Customers_1549 (customer_id, name)	
VALUES	
(1, 'Winston'),	
(2, 'Jonathan'),	
(3, 'Annabelle'),	
(4, 'Marwan'),	
(5, 'Khaled');	
	
CREATE TABLE Orders_1549 (	
    order_id INT PRIMARY KEY,	
    order_date DATE NOT NULL,	
    customer_id INT NOT NULL,	
    product_id INT NOT NULL	
);	
	
INSERT INTO Orders_1549 (order_id, order_date, customer_id, product_id)	
VALUES	
(1, '2020-07-31', 1, 1),	
(2, '2020-07-30', 2, 2),	
(3, '2020-08-29', 3, 3),	
(4, '2020-07-29', 4, 1),	
(5, '2020-06-10', 1, 2),	
(6, '2020-08-01', 2, 1),	
(7, '2020-08-01', 3, 1),	
(8, '2020-08-03', 1, 2),	
(9, '2020-08-07', 2, 3),	
(10, '2020-07-15', 1, 2);	
	
CREATE TABLE Products_1549 (	
    product_id INT PRIMARY KEY,	
    product_name VARCHAR(50) NOT NULL,	
    price DECIMAL(10, 2) NOT NULL	
);	
	
INSERT INTO Products_1549 (product_id, product_name, price)	
VALUES	
(1, 'keyboard', 120.00),	
(2, 'mouse', 80.00),	
(3, 'screen', 600.00),	
(4, 'hard disk', 450.00);	
	
Select * from Customers_1549;	
Select * from Orders_1549;	
Select * from Products_1549;	


SELECT t1.product_name, t1.product_id, t2.order_id, t2.order_date
FROM Products_1549 t1 JOIN
(SELECT * ,
DENSE_RANK() over(partition by product_id order by order_date desc) rank_order
FROM
Orders_1549) t2
ON t1.product_id = t2.product_id
WHERE rank_order =1 
ORDER BY t1.product_name, t1.product_id, t2.order_date;

