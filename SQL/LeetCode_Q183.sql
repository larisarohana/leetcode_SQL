/*Q.No.- 183. Customers Who Never Order
Description -  Suppose that a website contains two tables, 
the Customers table and the Orders table. Write a SQL query to 
find all customers who never order anything. */

Create table If Not Exists Customers (id int, name varchar(255));
Create table If Not Exists Orders (id int, customerId int);

Truncate table Customers;
insert into Customers (id, name) values ('1', 'Joe');
insert into Customers (id, name) values ('2', 'Henry');
insert into Customers (id, name) values ('3', 'Sam');
insert into Customers (id, name) values ('4', 'Max');

Select * from Customers;

Truncate table Orders;
insert into Orders (id, customerId) values ('1', '3');
insert into Orders (id, customerId) values ('2', '1');

Select * from Orders;

select * from Customers Cust
where NOT EXISTS (Select 1 from orders ord where Cust.id = Ord.customerId);