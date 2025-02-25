/*1341. Movie Rating
Description - 
Write the following SQL query:

Find the name of the user who has rated the greatest number of the movies.
In case of a tie, return lexicographically smaller user name.

Find the movie name with the highest average rating in February 2020.
In case of a tie, return lexicographically smaller movie name..

Query is returned in 2 rows, the query result format is in the following example:


Movies table:
+-------------+--------------+
| movie_id    |  title       |
+-------------+--------------+
| 1           | Avengers     |
| 2           | Frozen 2     |
| 3           | Joker        |
+-------------+--------------+

Users table:
+-------------+--------------+
| user_id     |  name        |
+-------------+--------------+
| 1           | Daniel       |
| 2           | Monica       |
| 3           | Maria        |
| 4           | James        |
+-------------+--------------+

Movie_Rating table:
+-------------+--------------+--------------+-------------+
| movie_id    | user_id      | rating       | created_at  |
+-------------+--------------+--------------+-------------+
| 1           | 1            | 3            | 2020-01-12  |
| 1           | 2            | 4            | 2020-02-11  |
| 1           | 3            | 2            | 2020-02-12  |
| 1           | 4            | 1            | 2020-01-01  |
| 2           | 1            | 5            | 2020-02-17  |
| 2           | 2            | 2            | 2020-02-01  |
| 2           | 3            | 2            | 2020-03-01  |
| 3           | 1            | 3            | 2020-02-22  |
| 3           | 2            | 4            | 2020-02-25  |
+-------------+--------------+--------------+-------------+

Result table:
+--------------+
| results      |
+--------------+
| Daniel       |
| Frozen 2     |
+--------------+

Daniel and Maria have rated 3 movies ("Avengers", "Frozen 2" and "Joker") but Daniel is smaller lexicographically.
Frozen 2 and Joker have a rating average of 3.5 in February but Frozen 2 is smaller lexicographically.*/

Create table If Not Exists Movies_341 (movie_id int, title varchar(30));
Create table If Not Exists Users_1341 (user_id int, name varchar(30));
Create table If Not Exists MovieRating_1341 (movie_id int, user_id int, rating int, created_at date);

Truncate table Movies_341;
insert into Movies_341 (movie_id, title) values ('1', 'Avengers');
insert into Movies_341 (movie_id, title) values ('2', 'Frozen 2');
insert into Movies_341 (movie_id, title) values ('3', 'Joker');

Truncate table Users_1341;
insert into Users_1341 (user_id, name) values ('1', 'Daniel');
insert into Users_1341 (user_id, name) values ('2', 'Monica');
insert into Users_1341 (user_id, name) values ('3', 'Maria');
insert into Users_1341 (user_id, name) values ('4', 'James');

Truncate table MovieRating_1341;
insert into MovieRating_1341 (movie_id, user_id, rating, created_at) values ('1', '1', '3', '2020-01-12');
insert into MovieRating_1341 (movie_id, user_id, rating, created_at) values ('1', '2', '4', '2020-02-11');
insert into MovieRating_1341 (movie_id, user_id, rating, created_at) values ('1', '3', '2', '2020-02-12');
insert into MovieRating_1341 (movie_id, user_id, rating, created_at) values ('1', '4', '1', '2020-01-01');
insert into MovieRating_1341 (movie_id, user_id, rating, created_at) values ('2', '1', '5', '2020-02-17');
insert into MovieRating_1341 (movie_id, user_id, rating, created_at) values ('2', '2', '2', '2020-02-01');
insert into MovieRating_1341 (movie_id, user_id, rating, created_at) values ('2', '3', '2', '2020-03-01');
insert into MovieRating_1341 (movie_id, user_id, rating, created_at) values ('3', '1', '3', '2020-02-22');
insert into MovieRating_1341 (movie_id, user_id, rating, created_at) values ('3', '2', '4', '2020-02-25');

(Select t2.name FROM MovieRating_1341 t1 JOIN Users_1341 t2
ON t1.user_id = t2.user_id
GROUP BY t2.name
ORDER BY count(1) DESC, name
LIMIT 1)
UNION ALL
(Select t2.title FROM MovieRating_1341 t1 JOIN Movies_341 t2
ON t1.movie_id = t2.movie_id
WHERE DATE_FORMAT(t1.created_at , '%Y-%m') = '2020-02'
GROUP BY t2.title
ORDER BY AVG(RATING) DESC, t2.title
LIMIT 1);
