/*1407. Top Travellers
Description - 
Write an SQL query to report the distance travelled by each user.

Return the result table ordered by travelled_distance in descending order, if two or more users travelled the same distance, order them by their name in ascending order.

The query result format is in the following example.


Users table:
+------+-----------+
| id   | name      |
+------+-----------+
| 1    | Alice     |
| 2    | Bob       |
| 3    | Alex      |
| 4    | Donald    |
| 7    | Lee       |
| 13   | Jonathan  |
| 19   | Elvis     |
+------+-----------+

Rides table:
+------+----------+----------+
| id   | user_id  | distance |
+------+----------+----------+
| 1    | 1        | 120      |
| 2    | 2        | 317      |
| 3    | 3        | 222      |
| 4    | 7        | 100      |
| 5    | 13       | 312      |
| 6    | 19       | 50       |
| 7    | 7        | 120      |
| 8    | 19       | 400      |
| 9    | 7        | 230      |
+------+----------+----------+

Result table:
+----------+--------------------+
| name     | travelled_distance |
+----------+--------------------+
| Elvis    | 450                |
| Lee      | 450                |
| Bob      | 317                |
| Jonathan | 312                |
| Alex     | 222                |
| Alice    | 120                |
| Donald   | 0                  |
+----------+--------------------+
Elvis and Lee travelled 450 miles, Elvis is the top traveller as his name is alphabetically smaller than Lee.
Bob, Jonathan, Alex and Alice have only one ride and we just order them by the total distances of the ride.
Donald didn't have any rides, the distance travelled by him is 0.*/

Create Table If Not Exists Users_1407 (id int, name varchar(30));
Create Table If Not Exists Rides_1407 (id int, user_id int, distance int);

Truncate table Users_1407;
insert into Users_1407 (id, name) values ('1', 'Alice');
insert into Users_1407 (id, name) values ('2', 'Bob');
insert into Users_1407 (id, name) values ('3', 'Alex');
insert into Users_1407 (id, name) values ('4', 'Donald');
insert into Users_1407 (id, name) values ('7', 'Lee');
insert into Users_1407 (id, name) values ('13', 'Jonathan');
insert into Users_1407 (id, name) values ('19', 'Elvis');

Truncate table Rides_1407;
insert into Rides_1407 (id, user_id, distance) values ('1', '1', '120');
insert into Rides_1407 (id, user_id, distance) values ('2', '2', '317');
insert into Rides_1407 (id, user_id, distance) values ('3', '3', '222');
insert into Rides_1407 (id, user_id, distance) values ('4', '7', '100');
insert into Rides_1407 (id, user_id, distance) values ('5', '13', '312');
insert into Rides_1407 (id, user_id, distance) values ('6', '19', '50');
insert into Rides_1407 (id, user_id, distance) values ('7', '7', '120');
insert into Rides_1407 (id, user_id, distance) values ('8', '19', '400');
insert into Rides_1407 (id, user_id, distance) values ('9', '7', '230');



SELECT t1.name, SUM(coalesce(t2.distance,0))  AS travelled_distance
FROM Users_1407 t1 LEFT JOIN Rides_1407 t2
ON t1.id = t2.user_id
GROUP BY t1.name
ORDER BY travelled_distance DESC, t1.name;