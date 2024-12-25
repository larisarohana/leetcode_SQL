/*1587. Bank Account Summary II
Description - 
Write an SQL query to report the name and balance of users with a balance higher than 10000. The balance of an account is equal to the sum of the amounts of all transactions involving that account.

Return the result table in any order.

The query result format is in the following example.


Users table:
+------------+--------------+
| account    | name         |
+------------+--------------+
| 900001     | Alice        |
| 900002     | Bob          |
| 900003     | Charlie      |
+------------+--------------+

Transactions table:
+------------+------------+------------+---------------+
| trans_id   | account    | amount     | transacted_on |
+------------+------------+------------+---------------+
| 1          | 900001     | 7000       |  2020-08-01   |
| 2          | 900001     | 7000       |  2020-09-01   |
| 3          | 900001     | -3000      |  2020-09-02   |
| 4          | 900002     | 1000       |  2020-09-12   |
| 5          | 900003     | 6000       |  2020-08-07   |
| 6          | 900003     | 6000       |  2020-09-07   |
| 7          | 900003     | -4000      |  2020-09-11   |
+------------+------------+------------+---------------+

Result table:
+------------+------------+
| name       | balance    |
+------------+------------+
| Alice      | 11000      |
+------------+------------+
Alice's balance is (7000 + 7000 - 3000) = 11000.
Bob's balance is 1000.
Charlie's balance is (6000 + 6000 - 4000) = 8000.*/

Create table If Not Exists Users_1587 (account int, name varchar(20));
Create table If Not Exists Transactions_1587 (trans_id int, account int, amount int, transacted_on date);

Truncate table Users_1587;
insert into Users_1587 (account, name) values ('900001', 'Alice');
insert into Users_1587 (account, name) values ('900002', 'Bob');
insert into Users_1587 (account, name) values ('900003', 'Charlie');

Truncate table Transactions_1587;
insert into Transactions_1587 (trans_id, account, amount, transacted_on) values ('1', '900001', '7000', '2020-08-01');
insert into Transactions_1587 (trans_id, account, amount, transacted_on) values ('2', '900001', '7000', '2020-09-01');
insert into Transactions_1587 (trans_id, account, amount, transacted_on) values ('3', '900001', '-3000', '2020-09-02');
insert into Transactions_1587 (trans_id, account, amount, transacted_on) values ('4', '900002', '1000', '2020-09-12');
insert into Transactions_1587 (trans_id, account, amount, transacted_on) values ('5', '900003', '6000', '2020-08-07');
insert into Transactions_1587 (trans_id, account, amount, transacted_on) values ('6', '900003', '6000', '2020-09-07');
insert into Transactions_1587 (trans_id, account, amount, transacted_on) values ('7', '900003', '-4000', '2020-09-11');

SELECT t2.name
, sum(t1.amount) balance
FROM Transactions_1587 t1
, Users_1587 t2
WHERE t1.account = t2.account
GROUP BY t2.name
HAVING sum(amount) > 10000;




