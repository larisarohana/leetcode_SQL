/*Q.No.- 1069. Product Sales Analysis II
Description - 
Write an SQL query that reports the total quantity sold for every product id.

The query result format is in the following example:


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
+--------------+----------------+
| product_id   | total_quantity |
+--------------+----------------+
| 100          | 22             |
| 200          | 15             |
+--------------+----------------+*/

CREATE TABLE Sales_1069 (
    sale_id INT PRIMARY KEY,
    product_id INT,
    year INT,
    quantity INT,
    price DECIMAL(10, 2)
);

CREATE TABLE Product_1069 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255)
);

INSERT INTO Sales_1069 (sale_id, product_id, year, quantity, price)
VALUES
(1, 100, 2008, 10, 5000.00),
(2, 100, 2009, 12, 5000.00),
(7, 200, 2011, 15, 9000.00);


INSERT INTO Product_1069 (product_id, product_name)
VALUES
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');

select * from Sales_1069;
select * from Product_1069;

SELECT DISTINCT product_id , sum(quantity) over(partition by product_id) as total_quantity 
FROM Sales_1069;
