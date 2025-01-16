/*1699. Number of Calls Between Two Persons
Description - 
Write an SQL query to report the number of calls and the total call duration between each pair of distinct persons (person1, person2) where person1 < person2.

Return the result table in any order.

The query result format is in the following example:


Calls table:
+---------+-------+----------+
| from_id | to_id | duration |
+---------+-------+----------+
| 1       | 2     | 59       |
| 2       | 1     | 11       |
| 1       | 3     | 20       |
| 3       | 4     | 100      |
| 3       | 4     | 200      |
| 3       | 4     | 200      |
| 4       | 3     | 499      |
+---------+-------+----------+

Result table:
+---------+---------+------------+----------------+
| person1 | person2 | call_count | total_duration |
+---------+---------+------------+----------------+
| 1       | 2       | 2          | 70             |
| 1       | 3       | 1          | 20             |
| 3       | 4       | 4          | 999            |
+---------+---------+------------+----------------+
Users 1 and 2 had 2 calls and the total duration is 70 (59 + 11).
Users 1 and 3 had 1 call and the total duration is 20.
Users 3 and 4 had 4 calls and the total duration is 999 (100 + 200 + 200 + 499).
*/

CREATE TABLE Calls_1699 (
    from_id INT,
    to_id INT,
    duration INT
);

INSERT INTO Calls_1699 (from_id, to_id, duration) VALUES
(1, 2, 59),
(2, 1, 11),
(1, 3, 20),
(3, 4, 100),
(3, 4, 200),
(3, 4, 200),
(4, 3, 499);

Select * from Calls_1699;

-- 1. FIND ALL THE CALLS OF THE PERSON WHERE PERSON1< PERSON2
SELECT t1.from_id as person1, t1.to_id as person2, t1.duration
FROM Calls_1699 t1
-- JOIN Calls_1699 t2
WHERE t1.from_id < t1.to_id;

-- 2. FIND ALL THE CALLS OF THE PERSON WHERE calls are excjhnaged and the persons are present in the first query
SELECT t2.from_id as person1, t2.to_id as person2, t2.duration
FROM Calls_1699 t2
WHERE (t2.from_id,t2.to_id) IN (SELECT  t1.to_id ,t1.from_id
FROM Calls_1699 t1
-- JOIN Calls_1699 t2
WHERE t1.from_id < t1.to_id);

-- 3. JOin bpth the queries as two tables 
WITH cte1 as 
(SELECT t1.from_id as person1, t1.to_id as person2, t1.duration
FROM Calls_1699 t1
-- JOIN Calls_1699 t2
WHERE t1.from_id < t1.to_id),

cte2 as 
(SELECT t2.from_id as person1, t2.to_id as person2, t2.duration
FROM Calls_1699 t2
WHERE (t2.from_id,t2.to_id) IN (SELECT  person2 , person1
FROM cte1))

SELECT person1
, person2
, (count(*) + coalesce((SELECT COUNT(*) FROM cte2 c1 where c1.person1=cte1.person2 and c1.person2 = cte1.person1),0)) as call_count 
, (SUM(duration) + coalesce((SELECT SUM(duration) FROM cte2 c1 where c1.person1=cte1.person2 and c1.person2 = cte1.person1),0)) as total_duration
FROM cte1
GROUP BY person1
, person2;

