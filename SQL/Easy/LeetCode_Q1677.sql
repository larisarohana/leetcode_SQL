/*1677. Product's Worth Over Invoices
Description - 
Write an SQL query that will, for all products, return each product name with total amount due, paid, canceled, and refunded across all invoices.

Return the result table ordered by product_name.

The query result format is in the following example:


Product table:
+------------+-------+
| product_id | name  |
+------------+-------+
| 0          | ham   |
| 1          | bacon |
+------------+-------+
Invoice table:
+------------+------------+------+------+----------+----------+
| invoice_id | product_id | rest | paid | canceled | refunded |
+------------+------------+------+------+----------+----------+
| 23         | 0          | 2    | 0    | 5        | 0        |
| 12         | 0          | 0    | 4    | 0        | 3        |
| 1          | 1          | 1    | 1    | 0        | 1        |
| 2          | 1          | 1    | 0    | 1        | 1        |
| 3          | 1          | 0    | 1    | 1        | 1        |
| 4          | 1          | 1    | 1    | 1        | 0        |
+------------+------------+------+------+----------+----------+
Result table:
+-------+------+------+----------+----------+
| name  | rest | paid | canceled | refunded |
+-------+------+------+----------+----------+
| bacon | 3    | 3    | 3        | 3        |
| ham   | 2    | 4    | 5        | 3        |
+-------+------+------+----------+----------+
- The amount of money left to pay for bacon is 1 + 1 + 0 + 1 = 3
- The amount of money paid for bacon is 1 + 0 + 1 + 1 = 3
- The amount of money canceled for bacon is 0 + 1 + 1 + 1 = 3
- The amount of money refunded for bacon is 1 + 1 + 1 + 0 = 3
- The amount of money left to pay for ham is 2 + 0 = 2
- The amount of money paid for ham is 0 + 4 = 4
- The amount of money canceled for ham is 5 + 0 = 5
- The amount of money refunded for ham is 0 + 3 = 3*/

CREATE TABLE Product_1677 (
    product_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Invoice_1677 (
    invoice_id INT PRIMARY KEY,
    product_id INT,
    rest INT,
    paid INT,
    canceled INT,
    refunded INT
);

INSERT INTO Product_1677 (product_id, name) VALUES
(0, 'ham'),
(1, 'bacon');

INSERT INTO Invoice_1677 (invoice_id, product_id, rest, paid, canceled, refunded) VALUES
(23, 0, 2, 0, 5, 0),
(12, 0, 0, 4, 0, 3),
(1, 1, 1, 1, 0, 1),
(2, 1, 1, 0, 1, 1),
(3, 1, 0, 1, 1, 1),
(4, 1, 1, 1, 1, 0);

SELECT p.name AS name,
    SUM(i.rest) AS rest,
    SUM(i.paid) AS paid,
    SUM(i.canceled) AS canceled,
    SUM(i.refunded) AS refunded
FROM Invoice_1677 i
LEFT JOIN Product_1677 p ON p.product_id = i.product_id
GROUP BY name
ORDER BY name;


