/*1174. Immediate Food Delivery II
Description - 
If the preferred delivery date of the customer is the same as the order date then the order is called immediate otherwise it's called scheduled.

The first order of a customer is the order with the earliest order date that customer made. It is guaranteed that a customer has exactly one first order.

Write an SQL query to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

The query result format is in the following example:


Delivery table:
+-------------+-------------+------------+-----------------------------+
| delivery_id | customer_id | order_date | customer_pref_delivery_date |
+-------------+-------------+------------+-----------------------------+
| 1           | 1           | 2019-08-01 | 2019-08-02                  |
| 2           | 2           | 2019-08-02 | 2019-08-02                  |
| 3           | 1           | 2019-08-11 | 2019-08-12                  |
| 4           | 3           | 2019-08-24 | 2019-08-24                  |
| 5           | 3           | 2019-08-21 | 2019-08-22                  |
| 6           | 2           | 2019-08-11 | 2019-08-13                  |
| 7           | 4           | 2019-08-09 | 2019-08-09                  |
+-------------+-------------+------------+-----------------------------+

Result table:
+----------------------+
| immediate_percentage |
+----------------------+
| 50.00                |
+----------------------+
The customer id 1 has a first order with delivery id 1 and it is scheduled.
The customer id 2 has a first order with delivery id 2 and it is immediate.
The customer id 3 has a first order with delivery id 5 and it is scheduled.
The customer id 4 has a first order with delivery id 7 and it is immediate.
Hence, half the customers have immediate first orders.
*/

CREATE TABLE Delivery_1174 (	
    delivery_id INT,	
    customer_id INT,	
    order_date DATE,	
    customer_pref_delivery_date DATE	
);	
	
INSERT INTO Delivery_1174 (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES	
(1, 1, '2019-08-01', '2019-08-02'),	
(2, 2, '2019-08-02', '2019-08-02'),	
(3, 1, '2019-08-11', '2019-08-12'),	
(4, 3, '2019-08-24', '2019-08-24'),	
(5, 3, '2019-08-21', '2019-08-22'),	
(6, 2, '2019-08-11', '2019-08-13'),	
(7, 4, '2019-08-09', '2019-08-09');	
	
	
Select * from Delivery_1174;	

SELECT ROUND(SUM(CASE WHEN order_date=customer_pref_delivery_date THEN 1 ELSE 0 END)/count(DISTINCT customer_id)*100, 2) immediate_percentage
FROM Delivery_1174
WHERE (customer_id, order_date) IN
    (SELECT customer_id, MIN(order_date)
    FROM Delivery_1174
    GROUP BY customer_id);
