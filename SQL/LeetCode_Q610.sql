/*Q.No.- 610. Triangle Judgement
Description - 
A pupil Tim gets homework to identify whether three line segments could possibly form a triangle. However, this assignment is very heavy because there are hundreds of records to calculate. Could you help Tim by writing a query to judge whether these three sides can form a triangle, assuming table triangle holds the length of the three sides x, y and z.

| x  | y  | z  |
|----|----|----|
| 13 | 15 | 30 |
| 10 | 20 | 15 |
For the sample data above, your query should return the follow result:

| x  | y  | z  | triangle |
|----|----|----|----------|
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |*/

Create table If Not Exists Triangle_610 (x int, y int, z int);

Truncate table Triangle_610;
insert into Triangle_610 (x, y, z) values ('13', '15', '30');
insert into Triangle_610 (x, y, z) values ('10', '20', '15');

SELECT x, y, z,
CASE WHEN (x+y>z AND y+z>x AND z+x>y) THEN 'Yes'
ELSE 'No' END triangle
FROM Triangle_610;