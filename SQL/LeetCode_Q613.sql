/*Q.No.- 613. Shortest Distance in a Line 
Description - 
Table point holds the x coordinate of some points on x-axis in a plane, which are all integers. Write a query to find the shortest distance between two points in these points.

| x   |
|-----|
| -1  |
| 0   |
| 2   |
The shortest distance is ‘1’ obviously, which is from point ‘-1’ to ‘0’. So the output is as below:

| shortest|
|---------|
| 1       |
Note: Every point is unique, which means there is no duplicates in table point.

Follow-up: What if all these points have an id and are arranged from the left most to the right most of x axis?*/

Create table If Not Exists x_613 (x int);

Truncate table x_613;
insert into x_613(x) values (-1),(0),(2);

SELECT abs(min(next_value-x)) shortest
FROM
(SELECT x, LEAD(x) over(order by x) as next_value
FROM x_613 ) t1;