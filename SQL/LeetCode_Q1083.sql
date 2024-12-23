/*Q.No.- 1083. Sales Analysis II
Description - 
Write an SQL query that reports the buyers who have bought S8 but not iPhone. Note that S8 and iPhone are products present in the Product table.

The query result format is in the following example:

Product table:
+------------+--------------+------------+
| product_id | product_name | unit_price |
+------------+--------------+------------+
| 1          | S8           | 1000       |
| 2          | G4           | 800        |
| 3          | iPhone       | 1400       |
+------------+--------------+------------+

Sales table:
+-----------+------------+----------+------------+----------+-------+
| seller_id | product_id | buyer_id | sale_date  | quantity | price |
+-----------+------------+----------+------------+----------+-------+
| 1         | 1          | 1        | 2019-01-21 | 2        | 2000  |
| 1         | 2          | 2        | 2019-02-17 | 1        | 800   |
| 2         | 1          | 3        | 2019-06-02 | 1        | 800   |
| 3         | 3          | 3        | 2019-05-13 | 2        | 2800  |
+-----------+------------+----------+------------+----------+-------+

Result table:
+-------------+
| buyer_id    |
+-------------+
| 1           |
+-------------+
The buyer with id 1 bought an S8 but didn't buy an iPhone. The buyer with id 3 bought both.*/

CREATE TABLE Product_1083 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    unit_price DECIMAL(10, 2)
);

CREATE TABLE Sales_1083 (
    seller_id INT,
    product_id INT,
    buyer_id INT,
    sale_date DATE,
    quantity INT,
    price DECIMAL(10, 2)
 );
 

INSERT INTO Product_1083 (product_id, product_name, unit_price)
VALUES
(1, 'S8', 1000.00),
(2, 'G4', 800.00),
(3, 'iPhone', 1400.00);


INSERT INTO Sales_1083 (seller_id, product_id, buyer_id, sale_date, quantity, price)
VALUES
(1, 1, 1, '2019-01-21', 2, 2000.00),
(1, 2, 2, '2019-02-17', 1, 800.00),
(2, 1, 3, '2019-06-02', 1, 800.00),
(3, 3, 3, '2019-05-13', 2, 2800.00);
 
 
 select * from Product_1083;
 select * from Sales_1083;

SELECT s1.seller_id
FROM Sales_1083 s1,
Product_1083 p1
WHERE s1.product_id = p1.product_id
AND p1.product_name = 'S8'
AND s1.buyer_id NOT IN (SELECT s2.buyer_id
                        FROM Sales_1083 s2 LEFT JOIN Product_1083 p2 ON
                            s2.product_id = p2.product_id
                        WHERE p2.product_name = 'iPhone');
