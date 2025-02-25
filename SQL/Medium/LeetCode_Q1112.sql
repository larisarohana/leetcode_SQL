/*1112. Highest Grade For Each Student | Medium
Description - 
Write a SQL query to find the highest grade with its corresponding course for each student. In case of a tie, you should find the course with the smallest course_id. The output must be sorted by increasing student_id.

The query result format is in the following example:


Enrollments table:
+------------+-------------------+
| student_id | course_id | grade |
+------------+-----------+-------+
| 2          | 2         | 95    |
| 2          | 3         | 95    |
| 1          | 1         | 90    |
| 1          | 2         | 99    |
| 3          | 1         | 80    |
| 3          | 2         | 75    |
| 3          | 3         | 82    |
+------------+-----------+-------+
Result table:
+------------+-------------------+
| student_id | course_id | grade |
+------------+-----------+-------+
| 1          | 2         | 99    |
| 2          | 2         | 95    |
| 3          | 3         | 82    |
+------------+-----------+-------+*/

CREATE TABLE Enrollments_1112 (
    student_id INT,
    course_id INT,
    grade INT
);

INSERT INTO Enrollments_1112 (student_id, course_id, grade) VALUES
(2, 2, 95),
(2, 3, 95),
(1, 1, 90),
(1, 2, 99),
(3, 1, 80),
(3, 2, 75),
(3, 3, 82);


SELECT student_id
, MIN(course_id) as course_id, grade
FROM Enrollments_1112
WHERE (student_id, grade) IN (SELECT DISTINCT student_id, max(grade) over(partition by student_id) as max_grade
		FROM Enrollments_1112)
GROUP BY student_id, grade
ORDER BY student_id
;

