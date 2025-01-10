/*550. Game Play Analysis IV
Description - 
Write an SQL query that reports the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.

The query result format is in the following example:


Activity table:
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-03-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |
+-----------+-----------+------------+--------------+

Result table:
+-----------+
| fraction  |
+-----------+
| 0.33      |
+-----------+
Only the player with id 1 logged back in after the first day he had logged in so the answer is 1/3 = 0.33*/

Create table If Not Exists Activity_550 (player_id int, device_id int, event_date date, games_played int);

Truncate table Activity_550;
insert into Activity_550 (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5');
insert into Activity_550 (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6');
insert into Activity_550 (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1');
insert into Activity_550 (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0');
insert into Activity_550 (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5');

SELECT ROUND(COUNT(DISTINCT t1.player_id)/(SELECT COUNT(DISTINCT player_id) FROM Activity),2) AS fraction
FROM
Activity t1
, Activity t2
WHERE t1.player_id = t2.player_id
AND DATEDIFF(t2.event_date, t1.event_date) = 1 
;

