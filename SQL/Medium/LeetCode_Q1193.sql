/*1193. Monthly Transactions I
Description - 
Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

The query result format is in the following example:


Transactions table:
+------+---------+----------+--------+------------+
| id   | country | state    | amount | trans_date |
+------+---------+----------+--------+------------+
| 121  | US      | approved | 1000   | 2018-12-18 |
| 122  | US      | declined | 2000   | 2018-12-19 |
| 123  | US      | approved | 2000   | 2019-01-01 |
| 124  | DE      | approved | 2000   | 2019-01-07 |
+------+---------+----------+--------+------------+

Result table:
+----------+---------+-------------+----------------+--------------------+-----------------------+
| month    | country | trans_count | approved_count | trans_total_amount | approved_total_amount |
+----------+---------+-------------+----------------+--------------------+-----------------------+
| 2018-12  | US      | 2           | 1              | 3000               | 1000                  |
| 2019-01  | US      | 1           | 1              | 2000               | 2000                  |
| 2019-01  | DE      | 1           | 1              | 2000               | 2000                  |
+----------+---------+-------------+----------------+--------------------+-----------------------+*/

Create table If Not Exists Transactions_1193 (id int, country varchar(4), state enum('approved', 'declined'), amount int, trans_date date);

Truncate table Transactions_1193;
insert into Transactions_1193 (id, country, state, amount, trans_date) values ('121', 'US', 'approved', '1000', '2018-12-18');
insert into Transactions_1193 (id, country, state, amount, trans_date) values ('122', 'US', 'declined', '2000', '2018-12-19');
insert into Transactions_1193 (id, country, state, amount, trans_date) values ('123', 'US', 'approved', '2000', '2019-01-01');
insert into Transactions_1193 (id, country, state, amount, trans_date) values ('124', 'DE', 'approved', '2000', '2019-01-07');

WITH cte1 as
(SELECT DATE_FORMAT(trans_date,'%Y-%m') AS month, 
country, 
COUNT(state) AS trans_count, 
sum(amount) AS trans_total_amount
FROM Transactions_1193
GROUP BY country, DATE_FORMAT(trans_date,'%Y-%m')),

cte2 as 
(SELECT DATE_FORMAT(trans_date,'%Y-%m') AS month, 
country, 
COUNT(state) AS approved_count, 
sum(amount) AS approved_total_amount 
FROM Transactions_1193
WHERE state = 'approved'
GROUP BY country, DATE_FORMAT(trans_date,'%Y-%m'))

SELECT cte1.month, cte1.country, cte1.trans_count, cte2.approved_count, cte1.trans_total_amount, cte2.approved_total_amount
FROM cte1 LEFT JOIN cte2
ON cte1.country = cte2.country and cte1.month = cte2.month;

SELECT 
    DATE_FORMAT(trans_date , '%Y-%m') AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(state = 'approved') AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(IF(state = 'approved' , amount , 0)) AS approved_total_amount
FROM Transactions_1193
GROUP BY month , country;