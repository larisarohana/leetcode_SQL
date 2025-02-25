/*612. Shortest Distance in a Plane
Description - 
Table point_2d holds the coordinates (x,y) of some unique points (more than two) in a plane. Write a query to find the shortest distance between these points rounded to 2 decimals.


| x  | y  |
|----|----|
| -1 | -1 |
| 0  | 0  |
| -1 | -2 |
The shortest distance is 1.00 from point (-1,-1) to (-1,2). So the output should be:


| shortest |
|----------|
| 1.00     |
Note: The longest distance among all the points are less than 10000.*/

CREATE TABLE your_table_612 (
    x INT,
    y INT
);


INSERT INTO your_table_612 (x, y)
VALUES
    (-1, -1),
    (0, 0),
    (-1, -2);
    
    SELECT * FROM your_table_612;
