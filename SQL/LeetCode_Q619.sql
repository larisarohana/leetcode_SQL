/*Q.No.- 619. Biggest Single Number
Description - 
Table number contains many numbers in column num including duplicated ones. Can you write a SQL query to find the biggest number, which only appears once.
+---+
|num|
+---+
| 8 |
| 8 |
| 3 |
| 3 |
| 1 |
| 4 |
| 5 |
| 6 |
For the sample data above, your query should return the following result:
+---+
|num|
+---+
| 6 |*/

Create table If Not Exists MyNumbers_619 (num int);

Truncate table MyNumbers_619;

insert into MyNumbers_619 (num) values ('8');
insert into MyNumbers_619 (num) values ('8');
insert into MyNumbers_619 (num) values ('3');
insert into MyNumbers_619 (num) values ('3');
insert into MyNumbers_619 (num) values ('1');
insert into MyNumbers_619 (num) values ('4');
insert into MyNumbers_619 (num) values ('5');
insert into MyNumbers_619 (num) values ('6');

SELECT * FROM MyNumbers_619;

SELECT max(num) as num FROM (SELECT num
FROM MyNumbers_619
GROUP BY num
HAVING COUNT(num) = 1) numt
;