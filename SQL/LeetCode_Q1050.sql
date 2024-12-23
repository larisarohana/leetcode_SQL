/*Q.No.- 1050. Actors and Directors Who Cooperated At Least Three Times
Description - 
Write a SQL query for a report that provides the pairs (actor_id, director_id) where the actor have cooperated with the director at least 3 times.

Example:

ActorDirector table:
+-------------+-------------+-------------+
| actor_id    | director_id | timestamp   |
+-------------+-------------+-------------+
| 1           | 1           | 0           |
| 1           | 1           | 1           |
| 1           | 1           | 2           |
| 1           | 2           | 3           |
| 1           | 2           | 4           |
| 2           | 1           | 5           |
| 2           | 1           | 6           |
+-------------+-------------+-------------+

Result table:
+-------------+-------------+
| actor_id    | director_id |
+-------------+-------------+
| 1           | 1           |
+-------------+-------------+
The only pair is (1, 1) where they cooperated exactly 3 times.*/

Create table If Not Exists ActorDirector_1050 (actor_id int, director_id int, timestamp int);

Truncate table ActorDirector_1050;
insert into ActorDirector_1050 (actor_id, director_id, timestamp) values ('1', '1', '0');
insert into ActorDirector_1050 (actor_id, director_id, timestamp) values ('1', '1', '1');
insert into ActorDirector_1050 (actor_id, director_id, timestamp) values ('1', '1', '2');
insert into ActorDirector_1050 (actor_id, director_id, timestamp) values ('1', '2', '3');
insert into ActorDirector_1050 (actor_id, director_id, timestamp) values ('1', '2', '4');
insert into ActorDirector_1050 (actor_id, director_id, timestamp) values ('2', '1', '5');
insert into ActorDirector_1050 (actor_id, director_id, timestamp) values ('2', '1', '6');

SELECT actor_id, director_id
FROM ActorDirector_1050
GROUP BY actor_id, director_id
HAVING COUNT(1) >=3;

