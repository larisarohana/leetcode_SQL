/*Q.No.- 586. Customer Placing the Largest Number of Orders
Description - 
Write a solution to find the customer_number for the customer who has placed the largest number of orders.

The test cases are generated so that exactly one customer will have placed more orders than any other customer.

The result format is in the following example.

Example 1:

Input: 
Orders table:
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+
Output: 
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+
Explanation: 
The customer with number 3 has two orders, which is greater than either customer 1 or 2 because each of them only has one order. 
So the result is customer_number 3.*/

Create table If Not Exists orders_586 (order_number int, customer_number int);

Truncate table orders_586;

insert into orders_586 (order_number, customer_number) values ('1', '1');
insert into orders_586 (order_number, customer_number) values ('2', '2');
insert into orders_586 (order_number, customer_number) values ('3', '3');
insert into orders_586 (order_number, customer_number) values ('4', '3');

select * from orders_586;

select count(order_number) over(partition by customer_number), customer_number from orders_586;

select customer_number from orders_586 group by customer_number order by count(order_number) desc LIMIT 1;