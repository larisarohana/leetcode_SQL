/*1132. Reported Posts II
Description - 
Write an SQL query to find the average for daily percentage of posts that got removed after being reported as spam, rounded to 2 decimal places.

The query result format is in the following example:


Actions table:
+---------+---------+-------------+--------+--------+
| user_id | post_id | action_date | action | extra  |
+---------+---------+-------------+--------+--------+
| 1       | 1       | 2019-07-01  | view   | null   |
| 1       | 1       | 2019-07-01  | like   | null   |
| 1       | 1       | 2019-07-01  | share  | null   |
| 2       | 2       | 2019-07-04  | view   | null   |
| 2       | 2       | 2019-07-04  | report | spam   |
| 3       | 4       | 2019-07-04  | view   | null   |
| 3       | 4       | 2019-07-04  | report | spam   |
| 4       | 3       | 2019-07-02  | view   | null   |
| 4       | 3       | 2019-07-02  | report | spam   |
| 5       | 2       | 2019-07-03  | view   | null   |
| 5       | 2       | 2019-07-03  | report | racism |
| 5       | 5       | 2019-07-03  | view   | null   |
| 5       | 5       | 2019-07-03  | report | racism |
+---------+---------+-------------+--------+--------+

Removals table:
+---------+-------------+
| post_id | remove_date |
+---------+-------------+
| 2       | 2019-07-20  |
| 3       | 2019-07-18  |
+---------+-------------+

Result table:
+-----------------------+
| average_daily_percent |
+-----------------------+
| 75.00                 |
+-----------------------+
The percentage for 2019-07-04 is 50% because only one post of two spam reported posts was removed.
The percentage for 2019-07-02 is 100% because one post was reported as spam and it was removed.
The other days had no spam reports so the average is (50 + 100) / 2 = 75%
Note that the output is only one number and that we do not care about the remove dates.*/

CREATE TABLE Actions_1132 (	
    user_id INT,	
    post_id INT,	
    action_date DATE,	
    action VARCHAR(50),	
    extra VARCHAR(50)	
);	
	
	
INSERT INTO Actions_1132 (user_id, post_id, action_date, action, extra) VALUES	
(1, 1, '2019-07-01', 'view', NULL),	
(1, 1, '2019-07-01', 'like', NULL),	
(1, 1, '2019-07-01', 'share', NULL),	
(2, 2, '2019-07-04', 'view', NULL),	
(2, 2, '2019-07-04', 'report', 'spam'),	
(3, 4, '2019-07-04', 'view', NULL),	
(3, 4, '2019-07-04', 'report', 'spam'),	
(4, 3, '2019-07-02', 'view', NULL),	
(4, 3, '2019-07-02', 'report', 'spam'),	
(5, 2, '2019-07-03', 'view', NULL),	
(5, 2, '2019-07-03', 'report', 'racism'),	
(5, 5, '2019-07-03', 'view', NULL),	
(5, 5, '2019-07-03', 'report', 'racism');	
	
CREATE TABLE Removals_1132 (	
    post_id INT,	
    remove_date DATE	
);	
	
INSERT INTO Removals_1132 (post_id, remove_date) VALUES	
(2, '2019-07-20'),	
(3, '2019-07-18');	

SELECT * FROM Actions_1132;
SELECT COUNT(post_id) as total_posts_removed FROM Removals_1132;

SELECT
* FROM Actions_1132
WHERE action ='report'
and extra = 'spam';

WITH cte1 AS
(SELECT
action_date, count(distinct post_id) as total_distinct_posts FROM Actions_1132
WHERE action_date IN (SELECT
DISTINCT action_date FROM Actions_1132
WHERE action ='report'
and extra = 'spam') -- to derive all the posts that were taken action on the days when a spam post was reported
GROUP BY action_date),

cte2 as (SELECT
action_date, count(distinct post_id) total_distinct_posts_removed FROM Actions_1132
WHERE action_date IN (SELECT
DISTINCT action_date FROM Actions_1132
WHERE action ='report'
and extra = 'spam')
AND post_id in (SELECT post_id FROM Removals_1132)
GROUP BY action_date), -- to derive all the post that were removed after they were reported spam

cte3 as (SELECT (total_distinct_posts_removed/total_distinct_posts)*100 as percentage_removed
FROM cte1 t1
join cte2 t2
ON t1.action_date = t2.action_date) -- derive the percentage of post removed

SELECT ROUND(AVG(percentage_removed),2) as average_daily_percent
from cte3;

	


