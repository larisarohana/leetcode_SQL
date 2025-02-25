/*Q.No.- 1082. Sales Analysis I
Description - 
Write an SQL query that reports the best seller by total sales price, If there is a tie, report them all.

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
| 2         | 2          | 3        | 2019-06-02 | 1        | 800   |
| 3         | 3          | 4        | 2019-05-13 | 2        | 2800  |
+-----------+------------+----------+------------+----------+-------+

Result table:
+-------------+
| seller_id   |
+-------------+
| 1           |
| 3           |
+-------------+
Both sellers with id 1 and 3 sold products with the most total price of 2800.*/

CREATE TABLE Product_1082 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    unit_price DECIMAL(10, 2)
);

CREATE TABLE Sales_1082 (
    seller_id INT,
    product_id INT,
    buyer_id INT,
    sale_date DATE,
    quantity INT,
    price DECIMAL(10, 2)
 );
 

INSERT INTO Product_1082 (product_id, product_name, unit_price)
VALUES
(1, 'S8', 1000.00),
(2, 'G4', 800.00),
(3, 'iPhone', 1400.00);


INSERT INTO Sales_1082 (seller_id, product_id, buyer_id, sale_date, quantity, price)
VALUES
(1, 1, 1, '2019-01-21', 2, 2000.00),
(1, 2, 2, '2019-02-17', 1, 800.00),
(2, 2, 3, '2019-06-02', 1, 800.00),
(3, 3, 4, '2019-05-13', 2, 2800.00);
 
 
 select * from Product_1082;
 select * from Sales_1082;
 
 SELECT seller_id 
 FROM
 Sales_1082
 GROUP BY seller_id
 HAVING Sum(price) IN (
 SELECT Max(total_sales) from
 (SELECT Seller_id, sum(price) over(partition by seller_id) total_sales
 FROM Sales_1082) s1);
 

 

