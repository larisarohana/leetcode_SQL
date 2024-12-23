/*Q.No.- 1148. Article Views I
Description - 
Write an SQL query to find all the authors that viewed at least one of their own articles, sorted in ascending order by their id.

The query result format is in the following example:

Views table:
+------------+-----------+-----------+------------+
| article_id | author_id | viewer_id | view_date  |
+------------+-----------+-----------+------------+
| 1          | 3         | 5         | 2019-08-01 |
| 1          | 3         | 6         | 2019-08-02 |
| 2          | 7         | 7         | 2019-08-01 |
| 2          | 7         | 6         | 2019-08-02 |
| 4          | 7         | 1         | 2019-07-22 |
| 3          | 4         | 4         | 2019-07-21 |
| 3          | 4         | 4         | 2019-07-21 |
+------------+-----------+-----------+------------+

Result table:
+------+
| id   |
+------+
| 4    |
| 7    |
+------+*/

Create table If Not Exists Views_1148 (article_id int, author_id int, viewer_id int, view_date date);

Truncate table Views_1148;
insert into Views_1148 (article_id, author_id, viewer_id, view_date) values ('1', '3', '5', '2019-08-01');
insert into Views_1148 (article_id, author_id, viewer_id, view_date) values ('1', '3', '6', '2019-08-02');
insert into Views_1148 (article_id, author_id, viewer_id, view_date) values ('2', '7', '7', '2019-08-01');
insert into Views_1148 (article_id, author_id, viewer_id, view_date) values ('2', '7', '6', '2019-08-02');
insert into Views_1148 (article_id, author_id, viewer_id, view_date) values ('4', '7', '1', '2019-07-22');
insert into Views_1148 (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', '2019-07-21');
insert into Views_1148 (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', '2019-07-21');

SELECT author_id AS id
FROM Views_1148
WHERE author_id = viewer_id 
GROUP BY author_id 
order by author_id;
