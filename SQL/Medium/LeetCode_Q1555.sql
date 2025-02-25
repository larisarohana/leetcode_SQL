/*1555. Bank Account Summary
Description - 
Leetcode Bank (LCB) helps its coders in making virtual payments. Our bank records all transactions in the table Transaction, we want to find out the current balance of all users and check wheter they have breached their credit limit (If their current credit is less than 0).

Write an SQL query to report.

user_id
user_name
credit, current balance after performing transactions.
credit_limit_breached, check credit_limit ("Yes" or "No") Return the result table in any order.
The query result format is in the following example.


Users table:
+------------+--------------+-------------+
| user_id    | user_name    | credit      |
+------------+--------------+-------------+
| 1          | Moustafa     | 100         |
| 2          | Jonathan     | 200         |
| 3          | Winston      | 10000       |
| 4          | Luis         | 800         |
+------------+--------------+-------------+

Transaction table:
+------------+------------+------------+----------+---------------+
| trans_id   | paid_by    | paid_to    | amount   | transacted_on |
+------------+------------+------------+----------+---------------+
| 1          | 1          | 3          | 400      | 2020-08-01    |
| 2          | 3          | 2          | 500      | 2020-08-02    |
| 3          | 2          | 1          | 200      | 2020-08-03    |
+------------+------------+------------+----------+---------------+

Result table:
+------------+------------+------------+-----------------------+
| user_id    | user_name  | credit     | credit_limit_breached |
+------------+------------+------------+-----------------------+
| 1          | Moustafa   | -100       | Yes                   |
| 2          | Jonathan   | 500        | No                    |
| 3          | Winston    | 9990       | No                    |
| 4          | Luis       | 800        | No                    |
+------------+------------+------------+-----------------------+
Moustafa paid $400 on "2020-08-01" and received $200 on "2020-08-03", credit (100 -400 +200) = -$100
Jonathan received $500 on "2020-08-02" and paid $200 on "2020-08-08", credit (200 +500 -200) = $500
Winston received $400 on "2020-08-01" and paid $500 on "2020-08-03", credit (10000 +400 -500) = $9990
Luis didn't received any transfer, credit = $800
*/

CREATE TABLE Users_1555 (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    credit DECIMAL(10, 2) NOT NULL
);

INSERT INTO Users_1555 (user_id, user_name, credit)
VALUES
(1, 'Moustafa', 100.00),
(2, 'Jonathan', 200.00),
(3, 'Winston', 10000.00),
(4, 'Luis', 800.00);

CREATE TABLE Transaction_1555 (
    trans_id INT PRIMARY KEY,
    paid_by INT NOT NULL,
    paid_to INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    transacted_on DATE NOT NULL
);


INSERT INTO Transaction_1555 (trans_id, paid_by, paid_to, amount, transacted_on)
VALUES
(1, 1, 3, 400.00, '2020-08-01'),
(2, 3, 2, 500.00, '2020-08-02'),
(3, 2, 1, 200.00, '2020-08-03');

Select * from Users_1555;
Select * from Transaction_1555;

-- 1. Assign negative or positive balances to users account ion the transaction table as per the transation made
-- negative transaction for paid_by user
SELECT paid_by AS user_id, -amount AS trans
    FROM Transaction_1555;

-- Positive transaction for paid_to user
SELECT paid_to AS user_id, amount AS trans
    FROM Transaction_1555;
    
-- 2. Combine both these queries to get all the users with negatiev and posiitve balances
SELECT paid_by AS user_id, -amount AS trans
    FROM Transaction_1555
    UNION ALL
    SELECT paid_to AS user_id, amount AS trans
    FROM Transaction_1555;
    
-- 3. Use the above union query to join with users table to find the total credit 
SELECT t1.user_id
, t1.user_name
, (t1.credit + coalesce(SUM(t2.trans),0)) AS credit
, CASE WHEN (t1.credit + coalesce(SUM(t2.trans),0)) < 0 THEN 'Yes' Else 'No' END credit_limit_breached
FROM Users_1555 t1
LEFT JOIN 
(SELECT paid_by AS user_id, -amount AS trans
    FROM Transaction_1555
    UNION ALL
    SELECT paid_to AS user_id, amount AS trans
    FROM Transaction_1555
) t2
ON t1.user_id = t2.user_id
GROUP BY t1.user_id, t1.user_name;


