/*1070. Product Sales Analysis III
Description - 
Write an SQL query that selects the product id, year, quantity, and price for the first year of every product sold.

The query result format is in the following example:


Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+

Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+

Result table:
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+*/

Create table If Not Exists Sales_1070 (sale_id int, product_id int, year int, quantity int, price int);
Create table If Not Exists Product_1070 (product_id int, product_name varchar(10));

Truncate table Sales_1070;
insert into Sales_1070 (sale_id, product_id, year, quantity, price) values ('1', '100', '2008', '10', '5000');
insert into Sales_1070 (sale_id, product_id, year, quantity, price) values ('2', '100', '2009', '12', '5000');
insert into Sales_1070 (sale_id, product_id, year, quantity, price) values ('7', '200', '2011', '15', '9000');

Truncate table Product_1070;
insert into Product_1070 (product_id, product_name) values ('100', 'Nokia');
insert into Product_1070 (product_id, product_name) values ('200', 'Apple');
insert into Product_1070 (product_id, product_name) values ('300', 'Samsung');


SELECT product_id, year first_year, quantity, price
FROM Sales_1070
WHERE (product_id, year) IN ( SELECT product_id, min(year)
				FROM Sales_1070
                GROUP BY product_id
					); 
                    
SELECT product_id, min(year)
				FROM Sales_1070
                GROUP BY product_id
					;
