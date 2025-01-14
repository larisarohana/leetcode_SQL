/*1212. Team Scores in Football Tournament
Description - 
You would like to compute the scores of all teams after all matches. Points are awarded as follows:

A team receives three points if they win a match (Score strictly more goals than the opponent team).

A team receives one point if they draw a match (Same number of goals as the opponent team).

A team receives no points if they lose a match (Score less goals than the opponent team).

Write an SQL query that selects the team_id, team_name and num_points of each team in the tournament after all described matches. Result table should be ordered by num_points (decreasing order). In case of a tie, order the records by team_id (increasing order).

The query result format is in the following example:


Teams table:
+-----------+--------------+
| team_id   | team_name    |
+-----------+--------------+
| 10        | Leetcode FC  |
| 20        | NewYork FC   |
| 30        | Atlanta FC   |
| 40        | Chicago FC   |
| 50        | Toronto FC   |
+-----------+--------------+

Matches table:
+------------+--------------+---------------+-------------+--------------+
| match_id   | host_team    | guest_team    | host_goals  | guest_goals  |
+------------+--------------+---------------+-------------+--------------+
| 1          | 10           | 20            | 3           | 0            |
| 2          | 30           | 10            | 2           | 2            |
| 3          | 10           | 50            | 5           | 1            |
| 4          | 20           | 30            | 1           | 0            |
| 5          | 50           | 30            | 1           | 0            |
+------------+--------------+---------------+-------------+--------------+

Result table:
+------------+--------------+---------------+
| team_id    | team_name    | num_points    |
+------------+--------------+---------------+
| 10         | Leetcode FC  | 7             |
| 20         | NewYork FC   | 3             |
| 50         | Toronto FC   | 3             |
| 30         | Atlanta FC   | 1             |
| 40         | Chicago FC   | 0             |
+------------+--------------+---------------+*/
CREATE TABLE Teams_1212 (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(50)
);

CREATE TABLE Matches_1212 (
    match_id INT PRIMARY KEY,
    host_team INT,
    guest_team INT,
    host_goals INT,
    guest_goals INT
);


INSERT INTO Teams_1212 (team_id, team_name) VALUES
(10, 'Leetcode FC'),
(20, 'NewYork FC'),
(30, 'Atlanta FC'),
(40, 'Chicago FC'),
(50, 'Toronto FC');


INSERT INTO Matches_1212 (match_id, host_team, guest_team, host_goals, guest_goals) VALUES
(1, 10, 20, 3, 0),
(2, 30, 10, 2, 2),
(3, 10, 50, 5, 1),
(4, 20, 30, 1, 0),
(5, 50, 30, 1, 0);


Select * from Teams_1212;
Select * from Matches_1212;

SELECT Teams.team_id, Teams.team_name, SUM(if(isnull(num_points), 0, num_points)) AS num_points
FROM Teams LEFT JOIN
    (
        SELECT host_team AS team_id,
            SUM(CASE WHEN host_goals>guest_goals THEN 3
                     WHEN host_goals=guest_goals THEN 1
                     ELSE 0 END) AS num_points
        FROM Matches
        GROUP BY host_team
        UNION ALL
        SELECT guest_team AS team_id,
            SUM(CASE WHEN host_goals<guest_goals THEN 3
                     WHEN host_goals=guest_goals THEN 1
                     ELSE 0 END) AS num_points
        FROM Matches
        GROUP BY guest_team
    ) AS tt
ON Teams.team_id = tt.team_id
GROUP BY Teams.team_id
ORDER BY num_points DESC, Teams.team_id ASC;

-- 1. Get the winning scores of host_teams
SELECT host_team AS team_id,
            SUM(CASE WHEN host_goals>guest_goals THEN 3
                     WHEN host_goals=guest_goals THEN 1
                     ELSE 0 END) AS num_points
        FROM Matches_1212
        GROUP BY host_team;

-- 2. Get the winning scores of guest_teams
SELECT guest_team AS team_id,
            SUM(CASE WHEN host_goals<guest_goals THEN 3
                     WHEN host_goals=guest_goals THEN 1
                     ELSE 0 END) AS num_points
        FROM Matches_1212
        GROUP BY guest_team;
        
-- 3. Get the union of both the winning team queries

(SELECT host_team AS team_id,
            SUM(CASE WHEN host_goals>guest_goals THEN 3
                     WHEN host_goals=guest_goals THEN 1
                     ELSE 0 END) AS num_points
        FROM Matches_1212
        GROUP BY host_team)
UNION
(SELECT guest_team AS team_id,
            SUM(CASE WHEN host_goals<guest_goals THEN 3
                     WHEN host_goals=guest_goals THEN 1
                     ELSE 0 END) AS num_points
        FROM Matches_1212
        GROUP BY guest_team);
        
-- 4. Use the above union query to calculate the total [points by each team by grouping the team-ids
SELECT 
t1.team_id,
coalesce(SUM(t1.num_points),0) as num_points
FROM
((SELECT host_team AS team_id,
            SUM(CASE WHEN host_goals>guest_goals THEN 3
                     WHEN host_goals=guest_goals THEN 1
                     ELSE 0 END) AS num_points
        FROM Matches_1212
        GROUP BY host_team)
UNION
(SELECT guest_team AS team_id,
            SUM(CASE WHEN host_goals<guest_goals THEN 3
                     WHEN host_goals=guest_goals THEN 1
                     ELSE 0 END) AS num_points
        FROM Matches_1212
        GROUP BY guest_team)) t1
GROUP BY t1.team_id
ORDER BY t1.team_id;

-- 5. USE left join to find the team name and total num_points

SELECT tbl1.team_id, tbl1.team_name, coalesce(tbl2.num_points,0)
FROM Teams_1212 tbl1 LEFT JOIN
(SELECT 
t1.team_id,
coalesce(SUM(t1.num_points),0) as num_points
FROM
((SELECT host_team AS team_id,
            SUM(CASE WHEN host_goals>guest_goals THEN 3
                     WHEN host_goals=guest_goals THEN 1
                     ELSE 0 END) AS num_points
        FROM Matches_1212
        GROUP BY host_team)
UNION
(SELECT guest_team AS team_id,
            SUM(CASE WHEN host_goals<guest_goals THEN 3
                     WHEN host_goals=guest_goals THEN 1
                     ELSE 0 END) AS num_points
        FROM Matches_1212
        GROUP BY guest_team)) t1
GROUP BY t1.team_id
ORDER BY t1.team_id) tbl2
ON tbl1.team_id = tbl2.team_id
ORDER BY tbl2.num_points DESC, tbl1.team_id;