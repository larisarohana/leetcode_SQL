/*1607. Sellers With No Sales
Description - 
Write an SQL query to report the names of all sellers who did not make any sales in 2020.

Return the result table ordered by seller_name in ascending order.

The query result format is in the following example.


Customer table:
+--------------+---------------+
| customer_id  | customer_name |
+--------------+---------------+
| 101          | Alice         |
| 102          | Bob           |
| 103          | Charlie       |
+--------------+---------------+

Orders table:
+-------------+------------+--------------+-------------+-------------+
| order_id    | sale_date  | order_cost   | customer_id | seller_id   |
+-------------+------------+--------------+-------------+-------------+
| 1           | 2020-03-01 | 1500         | 101         | 1           |
| 2           | 2020-05-25 | 2400         | 102         | 2           |
| 3           | 2019-05-25 | 800          | 101         | 3           |
| 4           | 2020-09-13 | 1000         | 103         | 2           |
| 5           | 2019-02-11 | 700          | 101         | 2           |
+-------------+------------+--------------+-------------+-------------+

Seller table:
+-------------+-------------+
| seller_id   | seller_name |
+-------------+-------------+
| 1           | Daniel      |
| 2           | Elizabeth   |
| 3           | Frank       |
+-------------+-------------+

Result table:
+-------------+
| seller_name |
+-------------+
| Frank       |
+-------------+
Daniel made 1 sale in March 2020.
Elizabeth made 2 sales in 2020 and 1 sale in 2019.
Frank made 1 sale in 2019 but no sales in 2020.*/

CREATE TABLE Customer_1607 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE Orders_1607 (
    order_id INT PRIMARY KEY,
    sale_date DATE,
    order_cost DECIMAL(10, 2),
    customer_id INT,
    seller_id INT
);

CREATE TABLE Seller_1607 (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(50)
);


INSERT INTO Customer_1607 (customer_id, customer_name) VALUES
(101, 'Alice'),
(102, 'Bob'),
(103, 'Charlie');


INSERT INTO Orders_1607 (order_id, sale_date, order_cost, customer_id, seller_id) VALUES
(1, '2020-03-01', 1500, 101, 1),
(2, '2020-05-25', 2400, 102, 2),
(3, '2019-05-25', 800, 101, 3),
(4, '2020-09-13', 1000, 103, 2),
(5, '2019-02-11', 700, 101, 2);


INSERT INTO Seller_1607 (seller_id, seller_name) VALUES
(1, 'Daniel'),
(2, 'Elizabeth'),
(3, 'Frank');


Select * from Customer_1607;
Select * from Orders_1607;
Select * from Seller_1607;

SELECT seller_name
FROM Seller_1607
WHERE seller_id NOT IN (SELECT 
seller_id
FROM Orders_1607 
WHERE YEAR(sale_date) = '2020')
;

