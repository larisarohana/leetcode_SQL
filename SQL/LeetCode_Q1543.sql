/*Q.No.- 1543. Fix Product Name Format
Description - 
Write an SQL query to report

product_name in lowercase without leading or trailing white spaces.
sale_date in the format ('YYYY-MM')
total the number of times the product was sold in this month.
Return the result table ordered by product_name in ascending order, in case of a tie order it by sale_date in ascending order.
The query result format is in the following example.


Sales
+------------+------------------+--------------+
| sale_id    | product_name     | sale_date    |
+------------+------------------+--------------+
| 1          |      LCPHONE     | 2000-01-16   |
| 2          |    LCPhone       | 2000-01-17   |
| 3          |     LcPhOnE      | 2000-02-18   |
| 4          |      LCKeyCHAiN  | 2000-02-19   |
| 5          |   LCKeyChain     | 2000-02-28   |
| 6          | Matryoshka       | 2000-03-31   |
+------------+------------------+--------------+

Result table:
+--------------+--------------+----------+
| product_name | sale_date    | total    |
+--------------+--------------+----------+
| lcphone      | 2000-01      | 2        |
| lckeychain   | 2000-02      | 2        |
| lcphone      | 2000-02      | 1        |
| matryoshka   | 2000-03      | 1        |
+--------------+--------------+----------+*/

CREATE TABLE Sales_1543 (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    sale_date DATE
);


INSERT INTO Sales_1543 (sale_id, product_name, sale_date) VALUES
(1, '      LCPHONE     ', '2000-01-16'),
(2, '    LCPhone       ', '2000-01-17'),
(3, '     LcPhOnE      ', '2000-02-18'),
(4, '      LCKeyCHAiN  ', '2000-02-19'),
(5, '   LCKeyChain     ', '2000-02-28'),
(6, ' Matryoshka       ', '2000-03-31');

SELECT lower(TRIM(product_name)) product_name
, DATE_FORMAT(sale_date,'%Y-%m') sale_date
, count(sale_id) total
 FROM 
Sales_1543
GROUP BY lower(TRIM(product_name)), DATE_FORMAT(sale_date,'%Y-%m')
order by lower(TRIM(product_name)) ;
