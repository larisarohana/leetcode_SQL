/*Q.No.- 1084. Sales Analysis III
Description - 
Reports the products that were only sold in spring 2019. That is, between 2019-01-01 and 2019-03-31 inclusive. Select the product that were only sold in spring 2019.


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
+-------------+--------------+
| product_id  | product_name |
+-------------+--------------+
| 1           | S8           |
+-------------+--------------+
The product with id 1 was only sold in spring 2019 while the other two were sold after.*/

CREATE TABLE Product_1084 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    unit_price DECIMAL(10, 2)
);

CREATE TABLE Sales_1084 (
    seller_id INT,
    product_id INT,
    buyer_id INT,
    sale_date DATE,
    quantity INT,
    price DECIMAL(10, 2)
 );
 

INSERT INTO Product_1084 (product_id, product_name, unit_price)
VALUES
(1, 'S8', 1000.00),
(2, 'G4', 800.00),
(3, 'iPhone', 1400.00);


INSERT INTO Sales_1084 (seller_id, product_id, buyer_id, sale_date, quantity, price)
VALUES
(1, 1, 1, '2019-01-21', 2, 2000.00),
(1, 2, 2, '2019-02-17', 1, 800.00),
(2, 2, 3, '2019-06-02', 1, 800.00),
(3, 3, 4, '2019-05-13', 2, 2800.00);
 
 
 select * from Product_1084;
 select * from Sales_1084;
 
 SELECT Product_id 
 FROM Sales_1084
 WHERE( sale_date < '2019-01-01' OR sale_date > '2019-03-31')
 ;
 SELECT p1.product_id, p1.product_name
 FROM Product_1084 p1
 JOIN Sales_1084 s1
 WHERE p1.product_id = s1.product_id
 AND s1.product_id NOT IN (SELECT Product_id 
 FROM Sales_1084
 WHERE( sale_date < '2019-01-01' OR sale_date > '2019-03-31'));
 
 select product_id,product_name from Product_1084 where 	
product_id in (select product_id from Sales_1084 s where sale_date between '2019-01-01' and '2019-03-31') and 	
product_id not in (select product_id from Sales_1084 s where sale_date > '2019-03-31' or sale_date < '2019-01-01'); 	
 
 
 