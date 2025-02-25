/*1158. Market Analysis I
Description - 
Write an SQL query to find for each user, the join date and the number of orders they made as a buyer in 2019.

The query result format is in the following example:
Users table:
+---------+------------+----------------+
| user_id | join_date  | favorite_brand |
+---------+------------+----------------+
| 1       | 2018-01-01 | Lenovo         |
| 2       | 2018-02-09 | Samsung        |
| 3       | 2018-01-19 | LG             |
| 4       | 2018-05-21 | HP             |
+---------+------------+----------------+

Orders table:
+----------+------------+---------+----------+-----------+
| order_id | order_date | item_id | buyer_id | seller_id |
+----------+------------+---------+----------+-----------+
| 1        | 2019-08-01 | 4       | 1        | 2         |
| 2        | 2018-08-02 | 2       | 1        | 3         |
| 3        | 2019-08-03 | 3       | 2        | 3         |
| 4        | 2018-08-04 | 1       | 4        | 2         |
| 5        | 2018-08-04 | 1       | 3        | 4         |
| 6        | 2019-08-05 | 2       | 2        | 4         |
+----------+------------+---------+----------+-----------+

Items table:
+---------+------------+
| item_id | item_brand |
+---------+------------+
| 1       | Samsung    |
| 2       | Lenovo     |
| 3       | LG         |
| 4       | HP         |
+---------+------------+

Result table:
+-----------+------------+----------------+
| buyer_id  | join_date  | orders_in_2019 |
+-----------+------------+----------------+
| 1         | 2018-01-01 | 1              |
| 2         | 2018-02-09 | 2              |
| 3         | 2018-01-19 | 0              |
| 4         | 2018-05-21 | 0              |
+-----------+------------+----------------+*/

Create table If Not Exists Users_1158 (user_id int, join_date date, favorite_brand varchar(10));
Create table If Not Exists Orders_1158 (order_id int, order_date date, item_id int, buyer_id int, seller_id int);
Create table If Not Exists Items_1158 (item_id int, item_brand varchar(10));

Truncate table Users_1158;
insert into Users_1158 (user_id, join_date, favorite_brand) values ('1', '2018-01-01', 'Lenovo');
insert into Users_1158 (user_id, join_date, favorite_brand) values ('2', '2018-02-09', 'Samsung');
insert into Users_1158 (user_id, join_date, favorite_brand) values ('3', '2018-01-19', 'LG');
insert into Users_1158 (user_id, join_date, favorite_brand) values ('4', '2018-05-21', 'HP');

Truncate table Orders_1158;
insert into Orders_1158 (order_id, order_date, item_id, buyer_id, seller_id) values ('1', '2019-08-01', '4', '1', '2');
insert into Orders_1158 (order_id, order_date, item_id, buyer_id, seller_id) values ('2', '2018-08-02', '2', '1', '3');
insert into Orders_1158 (order_id, order_date, item_id, buyer_id, seller_id) values ('3', '2019-08-03', '3', '2', '3');
insert into Orders_1158 (order_id, order_date, item_id, buyer_id, seller_id) values ('4', '2018-08-04', '1', '4', '2');
insert into Orders_1158 (order_id, order_date, item_id, buyer_id, seller_id) values ('5', '2018-08-04', '1', '3', '4');
insert into Orders_1158 (order_id, order_date, item_id, buyer_id, seller_id) values ('6', '2019-08-05', '2', '2', '4');

Truncate table Items_1158;
insert into Items_1158 (item_id, item_brand) values ('1', 'Samsung');
insert into Items_1158 (item_id, item_brand) values ('2', 'Lenovo');
insert into Items_1158 (item_id, item_brand) values ('3', 'LG');
insert into Items_1158 (item_id, item_brand) values ('4', 'HP');

SELECT
t1.user_id as buyer_id,t1.join_date,count(order_id) as orders_in_2019
FROM Users_1158 t1
LEFT JOIN Orders_1158 t2
ON t1.user_id = t2.buyer_id
AND YEAR(order_date) = 2019
GROUP BY t1.user_id ,t1.join_date
;

