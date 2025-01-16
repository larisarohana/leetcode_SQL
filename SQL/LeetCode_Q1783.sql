/*1783. Grand Slam Titles
Description - 
Write an SQL query to report the number of grand slam tournaments won by each player. Do not include the players who did not win any tournament.

Return the result table in any order.

The query result format is in the following example:


Players table:
+-----------+-------------+
| player_id | player_name |
+-----------+-------------+
| 1         | Nadal       |
| 2         | Federer     |
| 3         | Novak       |
+-----------+-------------+

Championships table:
+------+-----------+---------+---------+---------+
| year | Wimbledon | Fr_open | US_open | Au_open |
+------+-----------+---------+---------+---------+
| 2018 | 1         | 1       | 1       | 1       |
| 2019 | 1         | 1       | 2       | 2       |
| 2020 | 2         | 1       | 2       | 2       |
+------+-----------+---------+---------+---------+

Result table:
+-----------+-------------+-------------------+
| player_id | player_name | grand_slams_count |
+-----------+-------------+-------------------+
| 2         | Federer     | 5                 |
| 1         | Nadal       | 7                 |
+-----------+-------------+-------------------+

Player 1 (Nadal) won 7 titles: Wimbledon (2018, 2019), Fr_open (2018, 2019, 2020), US_open (2018), and Au_open (2018).
Player 2 (Federer) won 5 titles: Wimbledon (2020), US_open (2019, 2020), and Au_open (2019, 2020).
Player 3 (Novak) did not win anything, we did not include them in the result table.
*/

CREATE TABLE Players_1783 (					
    player_id INT PRIMARY KEY,					
    player_name VARCHAR(50)					
);					
					
					
INSERT INTO Players_1783 (player_id, player_name) VALUES					
(1, 'Nadal'),					
(2, 'Federer'),					
(3, 'Novak');					
					
CREATE TABLE Championships_1783 (					
    year INT PRIMARY KEY,					
    Wimbledon INT,					
    Fr_open INT,					
    US_open INT,					
    Au_open INT					
);					
					
					
INSERT INTO Championships_1783 (year, Wimbledon, Fr_open, US_open, Au_open) VALUES					
(2018, 1, 1, 1, 1),					
(2019, 1, 1, 2, 2),					
(2020, 2, 1, 2, 2);					
					
					
Select * from Players_1783;					
Select * from Championships_1783;					
				
SELECT t1.player_id,t1.player_name, 
SUM((CASE WHEN t2.Wimbledon = t1.player_id THEN 1 ELSE 0 END) +
	(CASE WHEN t2.Fr_open = t1.player_id THEN 1 ELSE 0 END) +
	(CASE WHEN t2.US_open = t1.player_id THEN 1 ELSE 0 END) +
	(CASE WHEN t2.Au_open = t1.player_id THEN 1 ELSE 0 END)) as grand_slams_count
FROM Players_1783 t1
JOIN Championships_1783 t2
ON ((t1.player_id = t2.Wimbledon ) OR (t2.Fr_open = t1.player_id) OR (t2.US_open = t1.player_id) OR (t2.Au_open = t1.player_id))
GROUP BY t1.player_id,t1.player_name ;