/*Q.No.- 1511. Customer Order Frequency
Description - 
Write an SQL query to report the customer_id and customer_name of customers who have spent at least $100 in each month of June and July 2020.

Return the result table in any order.

The query result format is in the following example.


Customers
+--------------+-----------+-------------+
| customer_id  | name      | country     |
+--------------+-----------+-------------+
| 1            | Winston   | USA         |
| 2            | Jonathan  | Peru        |
| 3            | Moustafa  | Egypt       |
+--------------+-----------+-------------+

Product
+--------------+-------------+-------------+
| product_id   | description | price       |
+--------------+-------------+-------------+
| 10           | LC Phone    | 300         |
| 20           | LC T-Shirt  | 10          |
| 30           | LC Book     | 45          |
| 40           | LC Keychain | 2           |
+--------------+-------------+-------------+

Orders
+--------------+-------------+-------------+-------------+-----------+
| order_id     | customer_id | product_id  | order_date  | quantity  |
+--------------+-------------+-------------+-------------+-----------+
| 1            | 1           | 10          | 2020-06-10  | 1         |
| 2            | 1           | 20          | 2020-07-01  | 1         |
| 3            | 1           | 30          | 2020-07-08  | 2         |
| 4            | 2           | 10          | 2020-06-15  | 2         |
| 5            | 2           | 40          | 2020-07-01  | 10        |
| 6            | 3           | 20          | 2020-06-24  | 2         |
| 7            | 3           | 30          | 2020-06-25  | 2         |
| 9            | 3           | 30          | 2020-05-08  | 3         |
+--------------+-------------+-------------+-------------+-----------+

Result table:
+--------------+------------+
| customer_id  | name       |
+--------------+------------+
| 1            | Winston    |
+--------------+------------+
Winston spent $300 (300 * 1) in June and $100 ( 10 * 1 + 45 * 2) in July 2020.
Jonathan spent $600 (300 * 2) in June and $20 ( 2 * 10) in July 2020.
Moustafa spent $110 (10 * 2 + 45 * 2) in June and $0 in July 2020.*/

drop table Customers_1517;
drop table Product_1517;
drop table Orders_1517;

CREATE TABLE Customers_1511 (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE Product_1511 (
    product_id INT PRIMARY KEY,
    description VARCHAR(100),
    price DECIMAL(10, 2)
);

CREATE TABLE Orders_1511 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT
    
);


INSERT INTO Customers_1511 (customer_id, name, country) VALUES
(1, 'Winston', 'USA'),
(2, 'Jonathan', 'Peru'),
(3, 'Moustafa', 'Egypt');


INSERT INTO Product_1511 (product_id, description, price) VALUES
(10, 'LC Phone', 300),
(20, 'LC T-Shirt', 10),
(30, 'LC Book', 45),
(40, 'LC Keychain', 2);


INSERT INTO Orders_1511 (order_id, customer_id, product_id, order_date, quantity) VALUES
(1, 1, 10, '2020-06-10', 1),
(2, 1, 20, '2020-07-01', 1),
(3, 1, 30, '2020-07-08', 2),
(4, 2, 10, '2020-06-15', 2),
(5, 2, 40, '2020-07-01', 10),
(6, 3, 20, '2020-06-24', 2),
(7, 3, 30, '2020-06-25', 2),
(9, 3, 30, '2020-05-08', 3);


Select * from Customers_1511;
Select * from Product_1511;
Select * from Orders_1511;

SELECT
t1.customer_id, t3.name
FROM Orders_1511 t1
, Product_1511 t2
, Customers_1511 t3
WHERE t1.product_id = t2.product_id
AND t1.customer_id = t3.customer_id
GROUP BY t1.customer_id
HAVING
(
    SUM(CASE WHEN t1.order_date LIKE '2020-06%' THEN (t1.quantity*t2.price) ELSE 0 END) >= 100
    and
    SUM(CASE WHEN t1.order_date LIKE '2020-07%' THEN (t1.quantity*t2.price) ELSE 0 END) >= 100
);
