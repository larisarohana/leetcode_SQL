/*Q.No.- 1068. Product Sales Analysis I
Description - 
Write an SQL query that reports all product names of the products in the Sales table along with their selling year and price.

For example:


Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+

Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+

Result table:
+--------------+-------+-------+
| product_name | year  | price |
+--------------+-------+-------+
| Nokia        | 2008  | 5000  |
| Nokia        | 2009  | 5000  |
| Apple        | 2011  | 9000  |
+--------------+-------+-------+*/

CREATE TABLE Sales_1068 (
    sale_id INT PRIMARY KEY,
    product_id INT,
    year INT,
    quantity INT,
    price DECIMAL(10, 2)
);

CREATE TABLE Product_1068 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255)
);

INSERT INTO Sales_1068 (sale_id, product_id, year, quantity, price)
VALUES
(1, 100, 2008, 10, 5000.00),
(2, 100, 2009, 12, 5000.00),
(7, 200, 2011, 15, 9000.00);


INSERT INTO Product_1068 (product_id, product_name)
VALUES
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');

select * from Sales_1068;
select * from Product_1068;

SELECT t2.product_name, t1.year, t1.price
FROM Sales_1068 t1
JOIN Product_1068 t2
WHERE t1.product_id = t2.product_id;