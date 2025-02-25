/*1729. Find Followers Count
Description - 
Write an SQL query that will, for each user, return the number of followers.

Return the result table ordered by user_id.

The query result format is in the following example:


Followers table:
+---------+-------------+
| user_id | follower_id |
+---------+-------------+
| 0       | 1           |
| 1       | 0           |
| 2       | 0           |
| 2       | 1           |
+---------+-------------+
Result table:
+---------+----------------+
| user_id | followers_count|
+---------+----------------+
| 0       | 1              |
| 1       | 1              |
| 2       | 2              |
+---------+----------------+
The followers of 0 are {1}
The followers of 1 are {0}
The followers of 2 are {0,1}*/

Create table If Not Exists Followers_1729(user_id int, follower_id int);

Truncate table Followers_1729;
insert into Followers_1729 (user_id, follower_id) values ('0', '1');
insert into Followers_1729 (user_id, follower_id) values ('1', '0');
insert into Followers_1729 (user_id, follower_id) values ('2', '0');
insert into Followers_1729 (user_id, follower_id) values ('2', '1');

SELECT user_id, COUNT(follower_id ) followers_count
FROM Followers_1729 
GROUP BY user_id 
ORDER BY user_id ASC;