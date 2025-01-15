/*1459. Rectangles Area
Description - 
Write an SQL query to report of all possible rectangles which can be formed by any two points of the table.

Each row in the result contains three columns (p1, p2, area) where:

p1 and p2 are the id of two opposite corners of a rectangle and p1 < p2.
Area of this rectangle is represented by the column area. Report the query in descending order by area in case of tie in ascending order by p1 and p2.

Points table:
+----------+-------------+-------------+
| id       | x_value     | y_value     |
+----------+-------------+-------------+
| 1        | 2           | 8           |
| 2        | 4           | 7           |
| 3        | 2           | 10          |
+----------+-------------+-------------+

Result table:
+----------+-------------+-------------+
| p1       | p2          | area        |
+----------+-------------+-------------+
| 2        | 3           | 6           |
| 1        | 2           | 2           |
+----------+-------------+-------------+

p1 should be less than p2 and area greater than 0.
p1 = 1 and p2 = 2, has an area equal to |2-4| * |8-7| = 2.
p1 = 2 and p2 = 3, has an area equal to |4-2| * |7-10| = 2.
p1 = 1 and p2 = 3 It's not possible because has an area equal to 0.*/

CREATE TABLE Points_1459 (
    id INT PRIMARY KEY,
    x_value INT,
    y_value INT
);

INSERT INTO Points_1459 (id, x_value, y_value) VALUES
(1, 2, 8),
(2, 4, 7),
(3, 2, 10);

SELECT *
FROM
(SELECT t1.id as p1,t2.id as p2, ABS((t1.x_value-t2.x_value)*(t1.y_value-t2.y_value))area
FROM Points_1459 t1
JOIN Points_1459 t2
ON t2.id = t1.id+1
AND t1.x_value != t2.x_value AND t1.y_value != t2.y_value) tbl
order by area DESC;

									
							



