/*180. Consecutive Numbers
Description - 
Write an SQL query to find all numbers that appear at least three times consecutively.

Return the result table in any order.

The query result format is in the following example:


Logs table:
+----+-----+
| Id | Num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+

Result table:
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
1 is the only number that appears consecutively for at least three times.*/

Create table If Not Exists Logs_180 (id int, num int);

Truncate table Logs_180;
insert into Logs_180 (id, num) values ('1', '1');
insert into Logs_180 (id, num) values ('2', '1');
insert into Logs_180 (id, num) values ('3', '1');
insert into Logs_180 (id, num) values ('4', '2');
insert into Logs_180 (id, num) values ('5', '1');
insert into Logs_180 (id, num) values ('6', '2');
insert into Logs_180 (id, num) values ('7', '2');

SELECT DISTINCT t1.num as ConsecutiveNums 
FROM Logs_180 t1
, Logs_180 t2
, Logs_180 t3
WHERE t2.id = t1.id+1
AND t3.id = t1.id+2
AND t1.num = t2.num
AND t1.num = t3.num
AND t2.num = t3.num
;