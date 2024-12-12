/*Q.No.- 511. Game Play Analysis I
Description - 
Write an SQL query that reports the first login date for each player.

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
+-----------+-------------+
| player_id | first_login |
+-----------+-------------+
| 1         | 2016-03-01  |
| 2         | 2017-06-25  |
| 3         | 2016-03-02  |
+-----------+-------------+*/

CREATE TABLE IF NOT EXISTS Activity_511 (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT
);

Truncate table Activity_511;

insert into Activity_511 (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5');
insert into Activity_511 (player_id, device_id, event_date, games_played) values ('1', '2', '2016-05-02', '6');
insert into Activity_511 (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1');
insert into Activity_511 (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0');
insert into Activity_511 (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5');

SELECT 
    *
FROM
    Activity_511;

SELECT  DISTINCT player_id, MIN(event_date) over(partition by player_id) AS first_login FROM Activity_511;