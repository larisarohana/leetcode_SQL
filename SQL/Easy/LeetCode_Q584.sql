/*Q.No.- 584. Find Customer Referee
Description - 
Given a table customer holding customers information and the referee.

+------+------+-----------+
| id   | name | referee_id|
+------+------+-----------+
|    1 | Will |      NULL |
|    2 | Jane |      NULL |
|    3 | Alex |         2 |
|    4 | Bill |      NULL |
|    5 | Zack |         1 |
|    6 | Mark |         2 |
+------+------+-----------+
Write a query to return the list of customers NOT referred by the person with id ‘2’.

For the sample data above, the result is:

+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+*/

Create table If Not Exists Customer_584 (id int, name varchar(25), referee_id int);

Truncate table Customer_584;

insert into Customer_584 (id, name, referee_id) values ('1', 'Will', NULL);
insert into Customer_584 (id, name, referee_id) values ('2', 'Jane', NULL);
insert into Customer_584 (id, name, referee_id) values ('3', 'Alex', '2');
insert into Customer_584 (id, name, referee_id) values ('4', 'Bill', NULL);
insert into Customer_584 (id, name, referee_id) values ('5', 'Zack', '1');
insert into Customer_584 (id, name, referee_id) values ('6', 'Mark', '2');

select * from Customer_584;

SELECT name 
FROM Customer_584
WHERE (referee_id != 2 or referee_id IS NULL)