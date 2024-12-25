/*1484. Group Sold Products By The Date
Description - 
Write an SQL query to find for each date, the number of distinct products sold and their names.

The sold-products names for each date should be sorted lexicographically.

Return the result table ordered by sell_date.

The query result format is in the following example.


Activities table:
+------------+-------------+
| sell_date  | product     |
+------------+-------------+
| 2020-05-30 | Headphone   |
| 2020-06-01 | Pencil      |
| 2020-06-02 | Mask        |
| 2020-05-30 | Basketball  |
| 2020-06-01 | Bible       |
| 2020-06-02 | Mask        |
| 2020-05-30 | T-Shirt     |
+------------+-------------+

Result table:
+------------+----------+------------------------------+
| sell_date  | num_sold | products                     |
+------------+----------+------------------------------+
| 2020-05-30 | 3        | Basketball,Headphone,T-shirt |
| 2020-06-01 | 2        | Bible,Pencil                 |
| 2020-06-02 | 1        | Mask                         |
+------------+----------+------------------------------+
For 2020-05-30, Sold items were (Headphone, Basketball, T-shirt), we sort them lexicographically and separate them by comma.
For 2020-06-01, Sold items were (Pencil, Bible), we sort them lexicographically and separate them by comma.
For 2020-06-02, Sold item is (Masks), we just return it.*/

Create table If Not Exists Activities_1484 (sell_date date, product varchar(20));

Truncate table Activities_1484;
insert into Activities_1484 (sell_date, product) values ('2020-05-30', 'Headphone');
insert into Activities_1484 (sell_date, product) values ('2020-06-01', 'Pencil');
insert into Activities_1484 (sell_date, product) values ('2020-06-02', 'Mask');
insert into Activities_1484 (sell_date, product) values ('2020-05-30', 'Basketball');
insert into Activities_1484 (sell_date, product) values ('2020-06-01', 'Bible');
insert into Activities_1484 (sell_date, product) values ('2020-06-02', 'Mask');
insert into Activities_1484 (sell_date, product) values ('2020-05-30', 'T-Shirt');

SELECT sell_date, COUNT(DISTINCT Product) num_sold, GROUP_CONCAT(DISTINCT Product) products
FROM Activities_1484
GROUP BY sell_date
ORDER BY sell_date
;


