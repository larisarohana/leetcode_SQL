/*1205. Monthly Transactions II
Description - 
Write an SQL query to find for each month and country, the number of approved transactions and their total amount, the number of chargebacks and their total amount.

Note: In your query, given the month and country, ignore rows with all zeros.

The query result format is in the following example:


Transactions table:
+------+---------+----------+--------+------------+
| id   | country | state    | amount | trans_date |
+------+---------+----------+--------+------------+
| 101  | US      | approved | 1000   | 2019-05-18 |
| 102  | US      | declined | 2000   | 2019-05-19 |
| 103  | US      | approved | 3000   | 2019-06-10 |
| 104  | US      | approved | 4000   | 2019-06-13 |
| 105  | US      | approved | 5000   | 2019-06-15 |
+------+---------+----------+--------+------------+

Chargebacks table:
+------------+------------+
| trans_id   | trans_date |
+------------+------------+
| 102        | 2019-05-29 |
| 101        | 2019-06-30 |
| 105        | 2019-09-18 |
+------------+------------+

Result table:
+----------+---------+----------------+-----------------+-------------------+--------------------+
| month    | country | approved_count | approved_amount | chargeback_count  | chargeback_amount  |
+----------+`---------+----------------+-----------------+-------------------+--------------------+
| 2019-05  | US      | 1              | 1000            | 1                 | 2000               |
| 2019-06  | US      | 3              | 12000           | 1                 | 1000               |
| 2019-09  | US      | 0              | 0               | 1                 | 5000               |
+----------+---------+----------------+-----------------+-------------------+--------------------+*/

CREATE TABLE Transactions_1205 (
    id INT,
    country VARCHAR(50),
    state VARCHAR(20),
    amount INT,
    trans_date DATE
);

CREATE TABLE Chargebacks_1205 (
    trans_id INT,
    trans_date DATE
);

INSERT INTO Transactions_1205 (id, country, state, amount, trans_date) VALUES
(101, 'US', 'approved', 1000, '2019-05-18'),
(102, 'US', 'declined', 2000, '2019-05-19'),
(103, 'US', 'approved', 3000, '2019-06-10'),
(104, 'US', 'approved', 4000, '2019-06-13'),
(105, 'US', 'approved', 5000, '2019-06-15');

INSERT INTO Chargebacks_1205 (trans_id, trans_date) VALUES
(102, '2019-05-29'),
(101, '2019-06-30'),
(105, '2019-09-18');

(SELECT 
    DATE_FORMAT(t1.trans_date , '%Y-%m') AS month,
    t1.country,
    -- coalesce(COUNT(t1.id),0)  AS trans_count,
    coalesce(SUM(t1.state = 'approved'))  AS approved_count,
    -- coalesce(SUM(t1.amount))  AS trans_total_amount,
    coalesce(SUM(IF(t1.state = 'approved' , t1.amount , 0)))  AS approved_total_amount,
    coalesce(COUNT(t2.trans_id),0) as chargeback_count ,
    coalesce(SUM(t1.amount), 0)  AS chargeback_amount  
FROM Transactions_1205 t1
LEFT JOIN Chargebacks_1205 t2
ON (t1.id = t2.trans_id AND DATE_FORMAT(t1.trans_date , '%Y-%m') = DATE_FORMAT(t2.trans_date , '%Y-%m'))
GROUP BY month , country)
UNION
(SELECT 
    DATE_FORMAT(t1.trans_date , '%Y-%m') AS month,
    t1.country,
    -- coalesce(COUNT(t1.id),0)  AS trans_count,
    coalesce(SUM(t1.state = 'approved'))  AS approved_count,
   --  coalesce(SUM(t1.amount))  AS trans_total_amount,
    coalesce(SUM(IF(t1.state = 'approved' , t1.amount , 0)))  AS approved_total_amount,
    coalesce(COUNT(t2.trans_id),0) as chargeback_count ,
    coalesce(SUM(t1.amount), 0)  AS chargeback_amount  
FROM Transactions_1205 t1
RIGHT JOIN Chargebacks_1205 t2
ON (t1.id = t2.trans_id AND DATE_FORMAT(t1.trans_date , '%Y-%m') = DATE_FORMAT(t2.trans_date , '%Y-%m'))
GROUP BY month , country);


SELECT month, country,
    SUM(CASE WHEN type='approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(CASE WHEN type='approved' THEN amount ELSE 0 END) AS approved_amount,
    SUM(CASE WHEN type='chargeback' THEN 1 ELSE 0 END) AS chargeback_count,
    SUM(CASE WHEN type='chargeback' THEN amount ELSE 0 END) AS chargeback_amount
FROM (
    (
    SELECT left(t.trans_date, 7) AS month, t.country, amount,'approved' AS type
    FROM Transactions AS t
    WHERE state='approved'
    )
    UNION ALL (
    SELECT left(c.trans_date, 7) AS month, t.country, amount,'chargeback' AS type
    FROM Transactions AS t JOIN Chargebacks AS c
    ON t.id = c.trans_id
    )
) AS tt
GROUP BY tt.month, tt.country;

-- 1. GET ALL THE APPROVED TYRANSACTIONS

SELECT DATE_FORMAT(t1.trans_date , '%Y-%m') AS month, 
t1.country, 
t1.amount,
'approved' AS type
FROM Transactions_1205 AS t1
WHERE state='approved';
    
-- 2. Get all the chargeback transaction details
SELECT DATE_FORMAT(t2.trans_date , '%Y-%m') AS month, 
t1.country, 
t1.amount,
'chargeback' AS type
FROM Transactions_1205 AS t1 JOIN Chargebacks_1205 t2
WHERE t1.id = t2.trans_id ;

-- 3.Get the union of both the transactions to find the total transactions
(SELECT DATE_FORMAT(t1.trans_date , '%Y-%m') AS month, 
t1.country, 
t1.amount,
'approved' AS type
FROM Transactions_1205 AS t1
WHERE state='approved')
UNION
(SELECT DATE_FORMAT(t2.trans_date , '%Y-%m') AS month, 
t1.country, 
t1.amount,
'chargeback' AS type
FROM Transactions_1205 AS t1 JOIN Chargebacks_1205 t2
WHERE t1.id = t2.trans_id 
);

-- 4. Now find the totals from the union query

SELECT
T3.month,
T3.country,
SUM(CASE WHEN type='approved' THEN 1 ELSE 0 END) AS approved_count,
SUM(CASE WHEN type='approved' THEN amount ELSE 0 END) AS approved_amount,
SUM(CASE WHEN type='chargeback' THEN 1 ELSE 0 END) AS chargeback_count,
SUM(CASE WHEN type='chargeback' THEN amount ELSE 0 END) AS  chargeback_amount
FROM
((SELECT DATE_FORMAT(t1.trans_date , '%Y-%m') AS month, 
t1.country, 
t1.amount,
'approved' AS type
FROM Transactions_1205 AS t1
WHERE state='approved')
UNION
(SELECT DATE_FORMAT(t2.trans_date , '%Y-%m') AS month, 
t1.country, 
t1.amount,
'chargeback' AS type
FROM Transactions_1205 AS t1 JOIN Chargebacks_1205 t2
WHERE t1.id = t2.trans_id 
)) T3
GROUP BY T3.month,
T3.country;




