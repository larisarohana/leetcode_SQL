/*1623. All Valid Triplets That Can Represent a Country
Description - 
There is a country with three schools, where each student is enrolled in exactly one school. The country is joining a competition and wants to select one student from each school to represent the country such that:

member_A is selected from SchoolA,
member_B is selected from SchoolB,
member_C is selected from SchoolC, and The selected students' names and IDs are pairwise distinct (i.e. no two students share the same name, and no two students share the same ID). Write an SQL query to find all the possible triplets representing the country under the given constraints.
Return the result table in any order.

The query result format is in the following example.


SchoolA table:
+------------+--------------+
| student_id | student_name |
+------------+--------------+
| 1          | Alice        |
| 2          | Bob          |
+------------+--------------+

SchoolB table:
+------------+--------------+
| student_id | student_name |
+------------+--------------+
| 3          | Tom          |
+------------+--------------+

SchoolC table:
+------------+--------------+
| student_id | student_name |
+------------+--------------+
| 3          | Tom          |
| 2          | Jerry        |
| 10         | Alice        |
+------------+--------------+

Result table:
+----------+----------+----------+
| member_A | member_B | member_C |
+----------+----------+----------+
| Alice    | Tom      | Jerry    |
| Bob      | Tom      | Alice    |
+----------+----------+----------+
Let us see all the possible triplets.
- (Alice, Tom, Tom) --> Rejected because member_B and member_C have the same name and the same ID.
- (Alice, Tom, Jerry) --> Valid triplet.
- (Alice, Tom, Alice) --> Rejected because member_A and member_C have the same name.
- (Bob, Tom, Tom) --> Rejected because member_B and member_C have the same name and the same ID.
- (Bob, Tom, Jerry) --> Rejected because member_A and member_C have the same ID.
- (Bob, Tom, Alice) --> Valid triplet.*/

CREATE TABLE SchoolA_1623 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);


CREATE TABLE SchoolB_1623 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);



CREATE TABLE SchoolC_1623 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);



INSERT INTO SchoolA_1623 (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob');


INSERT INTO SchoolB_1623 (student_id, student_name) VALUES
(3, 'Tom');

INSERT INTO SchoolC_1623 (student_id, student_name) VALUES
(3, 'Tom'),
(2, 'Jerry'),
(10, 'Alice');

Select * from SchoolA_1623;
Select * from SchoolB_1623;
Select * from SchoolC_1623;

SELECT 
t1.student_name member_A,t2.student_name member_B, t3.student_name member_B
FROM
SchoolA_1623 t1
JOIN SchoolB_1623 t2 ON (t1.student_id != t2.student_id AND t1.student_name != t2.student_name)
JOIN SchoolC_1623 t3 ON 
(t1.student_id != t3.student_id
AND t2.student_id != t3.student_id
AND t1.student_name != t3.student_name
AND t2.student_name != t3.student_name
)
;
