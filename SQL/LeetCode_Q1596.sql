/*1596. The Most Frequently Ordered Products for Each Customer 
Description - 
Write an SQL query to find the most frequently ordered product(s) for each customer.

The result table should have the product_id and product_name for each customer_id who ordered at least one order. Return the result table in any order.

The query result format is in the following example:


Customers
+-------------+-------+
| customer_id | name  |
+-------------+-------+
| 1           | Alice |
| 2           | Bob   |
| 3           | Tom   |
| 4           | Jerry |
| 5           | John  |
+-------------+-------+

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
| 7        | 2020-08-01 | 3           | 3          |
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
+-------------+------------+--------------+
| customer_id | product_id | product_name |
+-------------+------------+--------------+
| 1           | 2          | mouse        |
| 2           | 1          | keyboard     |
| 2           | 2          | mouse        |
| 2           | 3          | screen       |
| 3           | 3          | screen       |
| 4           | 1          | keyboard     |
+-------------+------------+--------------+

Alice (customer 1) ordered the mouse three times and the keyboard one time, so the mouse is the most frquently ordered product for them.
Bob (customer 2) ordered the keyboard, the mouse, and the screen one time, so those are the most frquently ordered products for them.
Tom (customer 3) only ordered the screen (two times), so that is the most frquently ordered product for them.
Jerry (customer 4) only ordered the keyboard (one time), so that is the most frquently ordered product for them.
John (customer 5) did not order anything, so we do not include them in the result table.
*/

CREATE TABLE Customers_1596 (				
    customer_id INT PRIMARY KEY,				
    name VARCHAR(50) NOT NULL				
);				
				
				
INSERT INTO Customers_1596 (customer_id, name)				
VALUES				
(1, 'Alice'),				
(2, 'Bob'),				
(3, 'Tom'),				
(4, 'Jerry'),				
(5, 'John');				

CREATE TABLE Products_1596 (				
    product_id INT PRIMARY KEY,				
    product_name VARCHAR(50) NOT NULL,				
    price DECIMAL(10, 2) NOT NULL				
);				
				
				
INSERT INTO Products_1596 (product_id, product_name, price)				
VALUES				
(1, 'keyboard', 120.00),				
(2, 'mouse', 80.00),				
(3, 'screen', 600.00),				
(4, 'hard disk', 450.00);				
				
CREATE TABLE Orders_1596 (				
    order_id INT PRIMARY KEY,				
    order_date DATE NOT NULL,				
    customer_id INT NOT NULL,				
    product_id INT NOT NULL				
	);			
				
				
INSERT INTO Orders_1596 (order_id, order_date, customer_id, product_id)				
VALUES				
(1, '2020-07-31', 1, 1),				
(2, '2020-07-30', 2, 2),				
(3, '2020-08-29', 3, 3),				
(4, '2020-07-29', 4, 1),				
(5, '2020-06-10', 1, 2),				
(6, '2020-08-01', 2, 1),				
(7, '2020-08-01', 3, 3),				
(8, '2020-08-03', 1, 2),				
(9, '2020-08-07', 2, 3),				
(10, '2020-07-15', 1, 2);				
				
Select * from Customers_1596;				
Select * from Products_1596;				
Select * from Orders_1596;				
	
WITH cte1 as
(SELECT customer_id, product_id
, dense_rank() over(partition by customer_id ORDER BY count_purchase DESC ) as high_purcahse_ranked
FROM
(SELECT customer_id, product_id , COUNT(order_id) as count_purchase
FROM Orders_1596
GROUP BY customer_id, product_id
Order by customer_id, product_id) t1)

SELECT t1.customer_id, t1.product_id, t2.product_name
FROM cte1 t1 JOIN Products_1596 t2
ON t1.product_id = t2.product_id
where t1.high_purcahse_ranked = 1
ORDER BY t1.customer_id, t1.product_id;