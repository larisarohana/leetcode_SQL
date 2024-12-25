/*1251. Average Selling Price
Description - 
Write an SQL query to find the average selling price for each product.

average_price should be rounded to 2 decimal places.

The query result format is in the following example:


Prices table:
+------------+------------+------------+--------+
| product_id | start_date | end_date   | price  |
+------------+------------+------------+--------+
| 1          | 2019-02-17 | 2019-02-28 | 5      |
| 1          | 2019-03-01 | 2019-03-22 | 20     |
| 2          | 2019-02-01 | 2019-02-20 | 15     |
| 2          | 2019-02-21 | 2019-03-31 | 30     |
+------------+------------+------------+--------+

UnitsSold table:
+------------+---------------+-------+
| product_id | purchase_date | units |
+------------+---------------+-------+
| 1          | 2019-02-25    | 100   |
| 1          | 2019-03-01    | 15    |
| 2          | 2019-02-10    | 200   |
| 2          | 2019-03-22    | 30    |
+------------+---------------+-------+

Result table:
+------------+---------------+
| product_id | average_price |
+------------+---------------+
| 1          | 6.96          |
| 2          | 16.96         |
+------------+---------------+
Average selling price = Total Price of Product / Number of products sold.
Average selling price for product 1 = ((100 * 5) + (15 * 20)) / 115 = 6.96
Average selling price for product 2 = ((200 * 15) + (30 * 30)) / 230 = 16.96*/

Create table If Not Exists Prices_1251 (product_id int, start_date date, end_date date, price int);
Create table If Not Exists UnitsSold_1251 (product_id int, purchase_date date, units int);

Truncate table Prices_1251;
insert into Prices_1251 (product_id, start_date, end_date, price) values ('1', '2019-02-17', '2019-02-28', '5');
insert into Prices_1251 (product_id, start_date, end_date, price) values ('1', '2019-03-01', '2019-03-22', '20');
insert into Prices_1251 (product_id, start_date, end_date, price) values ('2', '2019-02-01', '2019-02-20', '15');
insert into Prices_1251 (product_id, start_date, end_date, price) values ('2', '2019-02-21', '2019-03-31', '30');

Truncate table UnitsSold_1251;
insert into UnitsSold_1251 (product_id, purchase_date, units) values ('1', '2019-02-25', '100');
insert into UnitsSold_1251 (product_id, purchase_date, units) values ('1', '2019-03-01', '15');
insert into UnitsSold_1251 (product_id, purchase_date, units) values ('2', '2019-02-10', '200');
insert into UnitsSold_1251 (product_id, purchase_date, units) values ('2', '2019-03-22', '30');


SELECT t1.product_id
, ROUND(SUM(t1.price*t2.units)/SUM(units),2) as average_price
FROM Prices_1251 t1
, UnitsSold_1251 t2
WHERE t1.product_id = t2.product_id
AND (t2.purchase_date >= t1.start_date AND t2.purchase_date <= t1.end_date)
GROUP BY t1.product_id
;


