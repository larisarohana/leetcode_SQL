/*1667. Fix Names in a Table
Description - 
Write an SQL query to fix the names so that only the first character is uppercase and the rest are lowercase.

Return the result table ordered by user_id.

The query result format is in the following example:


Users table:
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | aLice |
| 2       | bOB   |
+---------+-------+

Result table:
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | Alice |
| 2       | Bob   |
+---------+-------+*/

Create table If Not Exists Users_1667 (user_id int, name varchar(40));

Truncate table Users_1667;
insert into Users_1667 (user_id, name) values ('1', 'aLice');
insert into Users_1667 (user_id, name) values ('2', 'bOB');

SELECT user_id, concat(UPPER(substring(name,1,1)), substring(LOWER(name),2)) as name
FROM Users_1667;
