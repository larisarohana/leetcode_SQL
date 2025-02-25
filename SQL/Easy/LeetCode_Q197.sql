/*Q.No.- 197. Rising Temperature
Description - 
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the primary key for this table.
This table contains information about the temperature in a certain day.
Write an SQL query to find all dates' id with higher temperature compared to its previous dates (yesterday).

Return the result table in any order.

The query result format is in the following example:
Weather
+----+------------+-------------+
| id | recordDate | Temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+

Result table:
+----+
| id |
+----+
| 2  |
| 4  |
+----+*/

CREATE TABLE IF NOT EXISTS Weather_197 (
    id INT,
    recordDate DATE,
    temperature INT
);

Truncate table Weather_197;

insert into Weather_197 (id, recordDate, temperature) values ('1', '2015-01-01', '10');
insert into Weather_197 (id, recordDate, temperature) values ('2', '2015-01-02', '25');
insert into Weather_197 (id, recordDate, temperature) values ('3', '2015-01-03', '20');
insert into Weather_197 (id, recordDate, temperature) values ('4', '2015-01-04', '30');

SELECT 
    *
FROM
    Weather_197;

SELECT 
    w2.id
FROM
    Weather_197 w1,
    Weather_197 w2
WHERE
    w2.recordDate - w1.recordDate = 1
        AND w2.temperature > w1.temperature;

SELECT 
    w1.Id
FROM
    Weather_197 AS w1,
    Weather_197 AS w2
WHERE
    DATEDIFF(w1.RecordDate, w2.RecordDate) = 1
        AND w1.Temperature > w2.Temperature;
