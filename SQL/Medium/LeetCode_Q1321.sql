/*1321. Restaurant Growth
Description - 
You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

Write an SQL query to compute moving average of how much customer paid in a 7 days window (current day + 6 days before) .

The query result format is in the following example:

Return result table ordered by visited_on.

average_amount should be rounded to 2 decimal places, all dates are in the format ('YYYY-MM-DD').


Customer table:
+-------------+--------------+--------------+-------------+
| customer_id | name         | visited_on   | amount      |
+-------------+--------------+--------------+-------------+
| 1           | Jhon         | 2019-01-01   | 100         |
| 2           | Daniel       | 2019-01-02   | 110         |
| 3           | Jade         | 2019-01-03   | 120         |
| 4           | Khaled       | 2019-01-04   | 130         |
| 5           | Winston      | 2019-01-05   | 110         |
| 6           | Elvis        | 2019-01-06   | 140         |
| 7           | Anna         | 2019-01-07   | 150         |
| 8           | Maria        | 2019-01-08   | 80          |
| 9           | Jaze         | 2019-01-09   | 110         |
| 1           | Jhon         | 2019-01-10   | 130         |
| 3           | Jade         | 2019-01-10   | 150         |
+-------------+--------------+--------------+-------------+

Result table:
+--------------+--------------+----------------+
| visited_on   | amount       | average_amount |
+--------------+--------------+----------------+
| 2019-01-07   | 860          | 122.86         |
| 2019-01-08   | 840          | 120            |
| 2019-01-09   | 840          | 120            |
| 2019-01-10   | 1000         | 142.86         |
+--------------+--------------+----------------+

1st moving average from 2019-01-01 to 2019-01-07 has an average_amount of (100 + 110 + 120 + 130 + 110 + 140 + 150)/7 = 122.86
2nd moving average from 2019-01-02 to 2019-01-08 has an average_amount of (110 + 120 + 130 + 110 + 140 + 150 + 80)/7 = 120
3rd moving average from 2019-01-03 to 2019-01-09 has an average_amount of (120 + 130 + 110 + 140 + 150 + 80 + 110)/7 = 120
4th moving average from 2019-01-04 to 2019-01-10 has an average_amount of (130 + 110 + 140 + 150 + 80 + 110 + 130 + 150)/7 = 142.86*/
CREATE TABLE Customer_1321 (
    customer_id INT,
    name VARCHAR(50),
    visited_on DATE,
    amount DECIMAL(10, 2)
);


INSERT INTO Customer_1321 (customer_id, name, visited_on, amount) VALUES
(1, 'Jhon', '2019-01-01', 100.00),
(2, 'Daniel', '2019-01-02', 110.00),
(3, 'Jade', '2019-01-03', 120.00),
(4, 'Khaled', '2019-01-04', 130.00),
(5, 'Winston', '2019-01-05', 110.00),
(6, 'Elvis', '2019-01-06', 140.00),
(7, 'Anna', '2019-01-07', 150.00),
(8, 'Maria', '2019-01-08', 80.00),
(9, 'Jaze', '2019-01-09', 110.00),
(1, 'Jhon', '2019-01-10', 130.00),
(3, 'Jade', '2019-01-10', 150.00);

Select * from Customer_1321;

-- 1. Get all the distinct start_dates and end_dates(which is on a interval of 6 days) from the customer tabble
SELECT DISTINCT c.visited_on AS start_date ,c1.visited_on AS end_date 
FROM Customer_1321 c JOIN Customer_1321 c1 
WHERE c1.visited_on = DATE_ADD(c.visited_on, INTERVAL 6 DAY);

-- 2. Then take the above query and use it to find all the transactions done by all the customers on end_date

SELECT c1.end_date AS visited_on, SUM(amount) AS amount, ROUND(SUM(amount)/7,2) AS average_amount 
FROM Customer_1321 c JOIN 
(SELECT DISTINCT c.visited_on AS start_date ,c1.visited_on AS end_date 
FROM Customer_1321 c JOIN Customer_1321 c1 
WHERE c1.visited_on = DATE_ADD(c.visited_on, INTERVAL 6 DAY)) c1 
WHERE c.visited_on BETWEEN c1.start_date AND c1.end_date GROUP BY c1.end_date;



