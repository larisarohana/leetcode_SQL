/*Q.No.- 620. Not Boring Movies
Description - 
Please write a SQL query to output movies with an odd numbered ID and a description that is not 'boring'. Order the result by rating.

For example, table cinema:


+---------+-----------+--------------+-----------+
|   id    | movie     |  description |  rating   |
+---------+-----------+--------------+-----------+
|   1     | War       |   great 3D   |   8.9     |
|   2     | Science   |   fiction    |   8.5     |
|   3     | irish     |   boring     |   6.2     |
|   4     | Ice song  |   Fantacy    |   8.6     |
|   5     | House card|   Interesting|   9.1     |
+---------+-----------+--------------+-----------+*/

Create table If Not Exists cinema__620 (id int, movie varchar(255), description varchar(255), rating float(2, 1));

Truncate table cinema__620;
insert into cinema__620 (id, movie, description, rating) values ('1', 'War', 'great 3D', '8.9');
insert into cinema__620 (id, movie, description, rating) values ('2', 'Science', 'fiction', '8.5');
insert into cinema__620 (id, movie, description, rating) values ('3', 'irish', 'boring', '6.2');
insert into cinema__620 (id, movie, description, rating) values ('4', 'Ice song', 'Fantacy', '8.6');
insert into cinema__620 (id, movie, description, rating) values ('5', 'House card', 'Interesting', '9.1');

SELECT * FROM
cinema__620
where id % 2 = 1
AND description != 'boring'
order by rating desc;