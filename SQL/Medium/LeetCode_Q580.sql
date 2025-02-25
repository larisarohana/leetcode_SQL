/*580. Count Student Number in Departments
Description - 
Write a query to print the respective department name and number of students majoring in each department for all departments in the department table (even ones with no current students).

Sort your results by descending number of students; if two or more departments have the same number of students, then sort those departments alphabetically by department name.

The student is described as follow:


| Column Name  | Type      |
|--------------|-----------|
| student_id   | Integer   |
| student_name | String    |
| gender       | Character |
| dept_id      | Integer   |
where student_id is the student’s ID number, student_name is the student’s name, gender is their gender, and dept_id is the department ID associated with their declared major.

And the department table is described as below:


| Column Name | Type    |
|-------------|---------|
| dept_id     | Integer |
| dept_name   | String  |
where dept_id is the department’s ID number and dept_name is the department name.

Here is an example input: student table:


| student_id | student_name | gender | dept_id |
|------------|--------------|--------|---------|
| 1          | Jack         | M      | 1       |
| 2          | Jane         | F      | 1       |
| 3          | Mark         | M      | 2       |
department table:


| dept_id | dept_name   |
|---------|-------------|
| 1       | Engineering |
| 2       | Science     |
| 3       | Law         |
The Output should be:


| dept_name   | student_number |
|-------------|----------------|
| Engineering | 2              |
| Science     | 1              |
| Law         | 0              |*/

CREATE TABLE department_580 (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE student_580 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    gender CHAR(1),
    dept_id INT
);

INSERT INTO department_580 (dept_id, dept_name) VALUES
(1, 'Engineering'),
(2, 'Science'),
(3, 'Law');


INSERT INTO student_580 (student_id, student_name, gender, dept_id) VALUES
(1, 'Jack', 'M', 1),
(2, 'Jane', 'F', 1),
(3, 'Mark', 'M', 2);


Select * from department_580;
Select * from student_580;

SELECT t1.dept_NAME
, coalesce(COUNT(t2.student_id),0) student_number
FROM department_580 t1
LEFT JOIN student_580 t2
ON t1.dept_id = t2.dept_id
GROUP BY t1.dept_ID, t1.dept_NAME
ORDER BY student_number DESC, t1.dept_name;
