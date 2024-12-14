/*Q.No.- 596. Classes More Than 5 Students
Description - 
There is a table courses with columns: student and class
Please list out all classes which have more than or equal to 5 students.
For example, the table:
+---------+------------+
| student | class      |
+---------+------------+
| A       | Math       |
| B       | English    |
| C       | Math       |
| D       | Biology    |
| E       | Math       |
| F       | Computer   |
| G       | Math       |
| H       | Math       |
| I       | Math       |
+---------+------------+
Should output:
+---------+
| class   |
+---------+
| Math    |
+---------+*/

Create table If Not Exists Courses_596 (student varchar(255), class varchar(255));

Truncate table Courses_596;

insert into Courses_596 (student, class) values ('A', 'Math');
insert into Courses_596 (student, class) values ('B', 'English');
insert into Courses_596 (student, class) values ('C', 'Math');
insert into Courses_596 (student, class) values ('D', 'Biology');
insert into Courses_596 (student, class) values ('E', 'Math');
insert into Courses_596 (student, class) values ('F', 'Computer');
insert into Courses_596 (student, class) values ('G', 'Math');
insert into Courses_596 (student, class) values ('H', 'Math');
insert into Courses_596 (student, class) values ('I', 'Math');

Select * from Courses_596;

WITH class_count(class,c_count) AS (
SELECT DISTINCT class, count(student) over(partition by class) from Courses_596
)

SELECT class 
FROM class_count
WHERE c_count>5;

SELECT class from Courses 
GROUP BY class
HAVING COUNT(student)>=5;