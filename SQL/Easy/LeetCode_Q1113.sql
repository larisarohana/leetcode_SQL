/*Q.No.- 1113.Reported Posts
Description - 
Write an SQL query that reports the number of posts reported yesterday for each report reason. Assume today is 2019-07-05.
The query result format is in the following example:
Actions table:
+---------+---------+-------------+--------+--------+
| user_id | post_id | action_date | action | extra  |
+---------+---------+-------------+--------+--------+
| 1       | 1       | 2019-07-01  | view   | null   |
| 1       | 1       | 2019-07-01  | like   | null   |
| 1       | 1       | 2019-07-01  | share  | null   |
| 2       | 4       | 2019-07-04  | view   | null   |
| 2       | 4       | 2019-07-04  | report | spam   |
| 3       | 4       | 2019-07-04  | view   | null   |
| 3       | 4       | 2019-07-04  | report | spam   |
| 4       | 3       | 2019-07-02  | view   | null   |
| 4       | 3       | 2019-07-02  | report | spam   |
| 5       | 2       | 2019-07-04  | view   | null   |
| 5       | 2       | 2019-07-04  | report | racism |
| 5       | 5       | 2019-07-04  | view   | null   |
| 5       | 5       | 2019-07-04  | report | racism |
+---------+---------+-------------+--------+--------+
Result table:
+---------------+--------------+
| report_reason | report_count |
+---------------+--------------+
| spam          | 1            |
| racism        | 2            |
+---------------+--------------+
Note that we only care about report reasons with non zero number of reports.*/

CREATE TABLE Actions_1113 (
    user_id INT,
    post_id INT,
    action_date DATE,
    action VARCHAR(20),
    extra VARCHAR(20)
);


INSERT INTO Actions_1113 (user_id, post_id, action_date, action, extra) VALUES
(1, 1, '2019-07-01', 'view', NULL),
(1, 1, '2019-07-01', 'like', NULL),
(1, 1, '2019-07-01', 'share', NULL),
(2, 4, '2019-07-04', 'view', NULL),
(2, 4, '2019-07-04', 'report', 'spam'),
(3, 4, '2019-07-04', 'view', NULL),
(3, 4, '2019-07-04', 'report', 'spam'),
(4, 3, '2019-07-02', 'view', NULL),
(4, 3, '2019-07-02', 'report', 'spam'),
(5, 2, '2019-07-04', 'view', NULL),
(5, 2, '2019-07-04', 'report', 'racism'),
(5, 5, '2019-07-04', 'view', NULL),
(5, 5, '2019-07-04', 'report', 'racism');


select * from Actions_1113;

SELECT extra as report_reason, count(distinct post_id) as report_count
from (SELECT post_id, extra
FROM Actions_1113
WHERE action_date = date_sub('2019-07-05', INTERVAL 1 DAY)
AND action = 'report') t1
GROUP BY extra
;

