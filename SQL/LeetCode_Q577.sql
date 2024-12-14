/*Q.No.- 577. Employee Bonus
Description - 
elect all employee’s name and bonus whose bonus is < 1000.

Table:Employee


+-------+--------+-----------+--------+
| empId |  name  | supervisor| salary |
+-------+--------+-----------+--------+
|   1   | John   |  3        | 1000   |
|   2   | Dan    |  3        | 2000   |
|   3   | Brad   |  null     | 4000   |
|   4   | Thomas |  3        | 4000   |
+-------+--------+-----------+--------+
empId is the primary key column for this table.
Table: Bonus

+-------+-------+
| empId | bonus |
+-------+-------+
| 2     | 500   |
| 4     | 2000  |
+-------+-------+
empId is the primary key column for this table.
Example ouput:
+-------+-------+
| name  | bonus |
+-------+-------+
| John  | null  |
| Dan   | 500   |
| Brad  | null  |
+-------+-------+*/

CREATE TABLE Employees_577 (
    empId INT PRIMARY KEY,
    name VARCHAR(50),
    supervisor INT,
    salary INT
);

CREATE TABLE Bonuses_577 (
    empId INT,
    bonus INT,
    PRIMARY KEY (empId)
    
);


INSERT INTO Employees_577 (empId, name, supervisor, salary) VALUES (1, 'John', 3, 1000);
INSERT INTO Employees_577 (empId, name, supervisor, salary) VALUES (2, 'Dan', 3, 2000);
INSERT INTO Employees_577 (empId, name, supervisor, salary) VALUES (3, 'Brad', NULL, 4000);
INSERT INTO Employees_577 (empId, name, supervisor, salary) VALUES (4, 'Thomas', 3, 4000);

INSERT INTO Bonuses_577 (empId, bonus) VALUES (2, 500);
INSERT INTO Bonuses_577 (empId, bonus) VALUES (4, 2000);


select * from Employees_577;
select * from Bonuses_577;

SELECT emp.name,
bon.bonus
FROM Employees_577 emp
LEFT JOIN Bonuses_577 bon
ON emp.empId = bon.empId 
WHERE (bon.bonus <1000 OR bon.bonus IS NULL);

SELECT emp.name,
bon.bonus
FROM Employees_577 emp
LEFT JOIN Bonuses_577 bon
ON emp.empId = bon.empId 
WHERE (COALESCE(bon.bonus, 0) < 1000);

