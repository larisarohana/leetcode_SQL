/*Q.No.- 512. Game Play Analysis II
Description - 
Write a SQL query that reports the device that is first logged in for each player.

The query result format is in the following example:


Activity table:
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-05-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |
+-----------+-----------+------------+--------------+

Result table:
+-----------+-----------+
| player_id | device_id |
+-----------+-----------+
| 1         | 2         |
| 2         | 3         |
| 3         | 1         |
+-----------+-----------+*/

CREATE TABLE IF NOT EXISTS Activity_512 (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT
);

Truncate table Activity_512;

insert into Activity_512 (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5');
insert into Activity_512 (player_id, device_id, event_date, games_played) values ('1', '2', '2016-05-02', '6');
insert into Activity_512 (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1');
insert into Activity_512 (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0');
insert into Activity_512 (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5');

SELECT 
    *
FROM
    Activity_512;
    
SELECT player_id, device_id FROM Activity_512
WHERE (player_id, event_date) in (
    SELECT  DISTINCT player_id, MIN(event_date) over(partition by player_id) AS first_login FROM Activity_512);
    
    
    SELECT a.player_id, b.device_id
FROM
(SELECT player_id, MIN(event_date) AS event_date FROM Activity_512
GROUP BY player_id) a
JOIN Activity_512 b
ON a.player_id = b.player_id AND a.event_date = b.event_date;

#Solution- 3:
SELECT player_id, device_id
FROM
(SELECT player_id, device_id, event_date,
ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS r
FROM Activity_512) lookup
WHERE r = 1;