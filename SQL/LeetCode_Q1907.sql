Create table If Not Exists Accounts_1907 (account_id int, income int);
Truncate table Accounts_1907;
insert into Accounts_1907 (account_id, income) values ('3', '108939');
insert into Accounts_1907 (account_id, income) values ('2', '12747');
insert into Accounts_1907 (account_id, income) values ('8', '87709');
insert into Accounts_1907 (account_id, income) values ('6', '91796');

SELECT
(CASE 
WHEN income < 20000 THEN 'Low Salary'
WHEN income >= 20000 AND income < 50000 THEN 'Average Salary'
ELSE 'High Salary' END) as category
,coalesce(sum( (CASE
WHEN income < 20000 THEN 1
WHEN income >= 20000 AND income < 50000 THEN 1
WHEN income >= 50000 THEN 1
ELSE 0 END)),0) as accounts_count 
FROM Accounts_1907
GROUP BY category;

SELECT "Low Salary" AS Category,
SUM(CASE WHEN income<20000 THEN 1 ELSE 0 end) AS accounts_count
FROM Accounts_1907
UNION
SELECT "Average Salary" AS Category,
SUM(CASE WHEN income >= 20000 AND income < 50000 THEN 1 ELSE 0 end) AS accounts_count
FROM Accounts_1907
UNION
SELECT "High Salary" AS Category,
SUM(CASE WHEN income >= 50000 THEN 1 ELSE 0 end) AS accounts_count
FROM Accounts_1907;