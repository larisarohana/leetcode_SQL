/*Q.No.- 1571. Warehouse Manager
Description - 
Write an SQL query to report, How much cubic feet of volume does the inventory occupy in each warehouse.

warehouse_name
volume
Return the result table in any order.
The query result format is in the following example.


Warehouse table:
+------------+--------------+-------------+
| name       | product_id   | units       |
+------------+--------------+-------------+
| LCHouse1   | 1            | 1           |
| LCHouse1   | 2            | 10          |
| LCHouse1   | 3            | 5           |
| LCHouse2   | 1            | 2           |
| LCHouse2   | 2            | 2           |
| LCHouse3   | 4            | 1           |
+------------+--------------+-------------+

Products table:
+------------+--------------+------------+----------+-----------+
| product_id | product_name | Width      | Length   | Height    |
+------------+--------------+------------+----------+-----------+
| 1          | LC-TV        | 5          | 50       | 40        |
| 2          | LC-KeyChain  | 5          | 5        | 5         |
| 3          | LC-Phone     | 2          | 10       | 10        |
| 4          | LC-T-Shirt   | 4          | 10       | 20        |
+------------+--------------+------------+----------+-----------+

Result table:
+----------------+------------+
| warehouse_name | volume     |
+----------------+------------+
| LCHouse1       | 12250      |
| LCHouse2       | 20250      |
| LCHouse3       | 800        |
+----------------+------------+
Volume of product_id = 1 (LC-TV), 5x50x40 = 10000
Volume of product_id = 2 (LC-KeyChain), 5x5x5 = 125
Volume of product_id = 3 (LC-Phone), 2x10x10 = 200
Volume of product_id = 4 (LC-T-Shirt), 4x10x20 = 800
LCHouse1: 1 unit of LC-TV + 10 units of LC-KeyChain + 5 units of LC-Phone.
          Total volume: 1*10000 + 10*125  + 5*200 = 12250 cubic feet
LCHouse2: 2 units of LC-TV + 2 units of LC-KeyChain.
          Total volume: 2*10000 + 2*125 = 20250 cubic feet
LCHouse3: 1 unit of LC-T-Shirt.
          Total volume: 1*800 = 800 cubic feet.*/

CREATE TABLE Warehouse_1571 (
    name VARCHAR(50),
    product_id INT,
    units INT,
    PRIMARY KEY (name, product_id)
);

CREATE TABLE Products_1571 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    Width INT,
    Length INT,
    Height INT
);

INSERT INTO Warehouse_1571 (name, product_id, units) VALUES
('LCHouse1', 1, 1),
('LCHouse1', 2, 10),
('LCHouse1', 3, 5),
('LCHouse2', 1, 2),
('LCHouse2', 2, 2),
('LCHouse3', 4, 1);


INSERT INTO Products_1571 (product_id, product_name, Width, Length, Height) VALUES
(1, 'LC-TV', 5, 50, 40),
(2, 'LC-KeyChain', 5, 5, 5),
(3, 'LC-Phone', 2, 10, 10),
(4, 'LC-T-Shirt', 4, 10, 20);


Select * from Warehouse_1571;

SELECT 
product_id
, product_name
, (width*length*height) product_volume
FROM Products_1571;

SELECT t1.name as wareghouse_name
, sum((t2.width*t2.length*t2.height)*t1.units) volume
FROM Warehouse_1571 t1
, Products_1571 t2
WHERE t1.product_id = t2.product_id
group by t1.name;
