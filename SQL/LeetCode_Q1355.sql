/*1355. Activity Participants
Description - 
Write an SQL query to find the names of all the activities with neither maximum, nor minimum number of participants.

Return the result table in any order. Each activity in table Activities is performed by any person in the table Friends.

The query result format is in the following example:


Friends table:
+------+--------------+---------------+
| id   | name         | activity      |
+------+--------------+---------------+
| 1    | Jonathan D.  | Eating        |
| 2    | Jade W.      | Singing       |
| 3    | Victor J.    | Singing       |
| 4    | Elvis Q.     | Eating        |
| 5    | Daniel A.    | Eating        |
| 6    | Bob B.       | Horse Riding  |
+------+--------------+---------------+

Activities table:
+------+--------------+
| id   | name         |
+------+--------------+
| 1    | Eating       |
| 2    | Singing      |
| 3    | Horse Riding |
+------+--------------+

Result table:
+--------------+
| results      |
+--------------+
| Singing      |
+--------------+

Eating activity is performed by 3 friends, maximum number of participants, (Jonathan D. , Elvis Q. and Daniel A.)
Horse Riding activity is performed by 1 friend, minimum number of participants, (Bob B.)
Singing is performed by 2 friends (Victor J. and Jade W.)*/

CREATE TABLE Activities_1355 (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO Activities_1355 (id, name) VALUES
(1, 'Eating'),
(2, 'Singing'),
(3, 'Horse Riding');

CREATE TABLE Friends_1355 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    activity VARCHAR(50)
);


INSERT INTO Friends_1355 (id, name, activity) VALUES
(1, 'Jonathan D.', 'Eating'),
(2, 'Jade W.', 'Singing'),
(3, 'Victor J.', 'Singing'),
(4, 'Elvis Q.', 'Eating'),
(5, 'Daniel A.', 'Eating'),
(6, 'Bob B.', 'Horse Riding');


Select * from Activities_1355;
Select * from Friends_1355;

SELECT DISTINCT activity, COUNT(name) OVER(PARTITION BY activity) as total_activity_count
FROM Friends_1355;

				
with cte1 as				
(				
Select activity,count(*) as cn 				
from Friends_1355 group by activity				
)				
select activity from cte1				
where cn not in 				
(select max(cn) from cte1 union all select min(cn) from cte1)	;			
				
				
