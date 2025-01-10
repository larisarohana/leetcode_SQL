/*1077. Project Employees III
Description - 
Write an SQL query that reports the most experienced employees in each project. In case of a tie, report all employees with the maximum number of experience years.

The query result format is in the following example:


Project table:
+-------------+-------------+
| project_id  | employee_id |
+-------------+-------------+
| 1           | 1           |
| 1           | 2           |
| 1           | 3           |
| 2           | 1           |
| 2           | 4           |
+-------------+-------------+

Employee table:
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 3                |
| 4           | Doe    | 2                |
+-------------+--------+------------------+

Result table:
+-------------+---------------+
| project_id  | employee_id   |
+-------------+---------------+
| 1           | 1             |
| 1           | 3             |
| 2           | 1             |
+-------------+---------------+
Both employees with id 1 and 3 have the most experience among the employees of the first project. For the second project, the employee with id*/

CREATE TABLE Employee_1077 (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    experience_years INT
);

CREATE TABLE Project_1077 (
    project_id INT,
    employee_id INT,
    PRIMARY KEY (project_id, employee_id)

);

INSERT INTO Employee_1077 (employee_id, name, experience_years)
VALUES
    (1, 'Khaled', 3),
    (2, 'Ali', 2),
    (3, 'John', 3),
    (4, 'Doe', 2);


INSERT INTO Project_1077 (project_id, employee_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 4);

Select * from Employee_1077;
Select * from Project_1077;

SELECT t1.project_id, t1.employee_id
FROM Project_1077 t1
, Employee_1077 t2
WHERE t1.employee_id = t2.employee_id
AND (t1.project_id, t2.experience_years) IN (SELECT p.project_id, MAX(e.experience_years)
										FROM Project_1077 p join Employee_1077 e
                                        ON p.employee_id = e.employee_id
                                        GROUP BY p.project_id);
                                        
SELECT p.project_id, MAX(e.experience_years)
										FROM Project_1077 p join Employee_1077 e
                                        ON p.employee_id = e.employee_id
                                        GROUP BY p.project_id;
