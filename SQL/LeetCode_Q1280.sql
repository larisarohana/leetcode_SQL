/*Q.No.- 1280. Students and Examinations 
Description - 
Write an SQL query to find the number of times each student attended each exam.

Order the result table by student_id and subject_name.

The query result format is in the following example:


Students table:
+------------+--------------+
| student_id | student_name |
+------------+--------------+
| 1          | Alice        |
| 2          | Bob          |
| 13         | John         |
| 6          | Alex         |
+------------+--------------+
Subjects table:
+--------------+
| subject_name |
+--------------+
| Math         |
| Physics      |
| Programming  |
+--------------+
Examinations table:
+------------+--------------+
| student_id | subject_name |
+------------+--------------+
| 1          | Math         |
| 1          | Physics      |
| 1          | Programming  |
| 2          | Programming  |
| 1          | Physics      |
| 1          | Math         |
| 13         | Math         |
| 13         | Programming  |
| 13         | Physics      |
| 2          | Math         |
| 1          | Math         |
+------------+--------------+
Result table:
+------------+--------------+--------------+----------------+
| student_id | student_name | subject_name | attended_exams |
+------------+--------------+--------------+----------------+
| 1          | Alice        | Math         | 3              |
| 1          | Alice        | Physics      | 2              |
| 1          | Alice        | Programming  | 1              |
| 2          | Bob          | Math         | 1              |
| 2          | Bob          | Physics      | 0              |
| 2          | Bob          | Programming  | 1              |
| 6          | Alex         | Math         | 0              |
| 6          | Alex         | Physics      | 0              |
| 6          | Alex         | Programming  | 0              |
| 13         | John         | Math         | 1              |
| 13         | John         | Physics      | 1              |
| 13         | John         | Programming  | 1              |
+------------+--------------+--------------+----------------+
The result table should contain all students and all subjects.
Alice attended Math exam 3 times, Physics exam 2 times and Programming exam 1 time.
Bob attended Math exam 1 time, Programming exam 1 time and didn't attend the Physics exam.
Alex didn't attend any exam.
John attended Math exam 1 time, Physics exam 1 time and Programming exam 1 time.
*/

Create table If Not Exists Students_1280 (student_id int, student_name varchar(20));
Create table If Not Exists Subjects_1280 (subject_name varchar(20));
Create table If Not Exists Examinations_1280 (student_id int, subject_name varchar(20));

Truncate table Students_1280;

insert into Students_1280 (student_id, student_name) values ('1', 'Alice');
insert into Students_1280 (student_id, student_name) values ('2', 'Bob');
insert into Students_1280 (student_id, student_name) values ('13', 'John');
insert into Students_1280 (student_id, student_name) values ('6', 'Alex');

Truncate table Subjects_1280;

insert into Subjects_1280 (subject_name) values ('Math');
insert into Subjects_1280 (subject_name) values ('Physics');
insert into Subjects_1280 (subject_name) values ('Programming');

Truncate table Examinations_1280;

insert into Examinations_1280 (student_id, subject_name) values ('1', 'Math');
insert into Examinations_1280 (student_id, subject_name) values ('1', 'Physics');
insert into Examinations_1280 (student_id, subject_name) values ('1', 'Programming');
insert into Examinations_1280 (student_id, subject_name) values ('2', 'Programming');
insert into Examinations_1280 (student_id, subject_name) values ('1', 'Physics');
insert into Examinations_1280 (student_id, subject_name) values ('1', 'Math');
insert into Examinations_1280 (student_id, subject_name) values ('13', 'Math');
insert into Examinations_1280 (student_id, subject_name) values ('13', 'Programming');
insert into Examinations_1280 (student_id, subject_name) values ('13', 'Physics');
insert into Examinations_1280 (student_id, subject_name) values ('2', 'Math');
insert into Examinations_1280 (student_id, subject_name) values ('1', 'Math');

SELECT t1.student_id ,
t1.student_name ,
t2.subject_name ,
COUNT(t3.student_id) as attended_exams 
FROM (Students_1280 t1,
Subjects_1280 t2)
LEFT JOIN Examinations_1280  t3 ON 
 (t1.student_id = t3.student_id 
AND t2.subject_name = t3.subject_name)
GROUP BY t1.student_id, t2.subject_name
;