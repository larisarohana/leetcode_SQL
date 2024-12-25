/*1777. Product's Price for Each Store
Description - 
Write an SQL query to find the price of each product in each store.

Return the result table in any order.

The query result format is in the following example:


Products table:
+-------------+--------+-------+
| product_id  | store  | price |
+-------------+--------+-------+
| 0           | store1 | 95    |
| 0           | store3 | 105   |
| 0           | store2 | 100   |
| 1           | store1 | 70    |
| 1           | store3 | 80    |
+-------------+--------+-------+
Result table:
+-------------+--------+--------+--------+
| product_id  | store1 | store2 | store3 |
+-------------+--------+--------+--------+
| 0           | 95     | 100    | 105    |
| 1           | 70     | null   | 80     |
+-------------+--------+--------+--------+
Product 0 price's are 95 for store1, 100 for store2 and, 105 for store3.
Product 1 price's are 70 for store1, 80 for store3 and, it's not sold in store2.*/

CREATE TABLE Products_1777 (
    product_id INT,
    store VARCHAR(50),
    price DECIMAL(10, 2)
);


INSERT INTO Products_1777 (product_id, store, price) VALUES
(0, 'store1', 95),
(0, 'store3', 105),
(0, 'store2', 100),
(1, 'store1', 70),
(1, 'store3', 80);

SELECT
product_id,
SUM(CASE WHEN store = 'store1' THEN price ELSE null END)store1,
SUM(CASE WHEN store = 'store2' THEN price ELSE null END)store2,
SUM(CASE WHEN store = 'store3' THEN price ELSE null END) store3
FROM Products_1777
GROUP BY product_id;

