/*1440. Evaluate Boolean Expression
Description - 
Write an SQL query to evaluate the boolean expressions in Expressions table.

Return the result table in any order.

The query result format is in the following example.


Variables table:
+------+-------+
| name | value |
+------+-------+
| x    | 66    |
| y    | 77    |
+------+-------+

Expressions table:
+--------------+----------+---------------+
| left_operand | operator | right_operand |
+--------------+----------+---------------+
| x            | >        | y             |
| x            | <        | y             |
| x            | =        | y             |
| y            | >        | x             |
| y            | <        | x             |
| x            | =        | x             |
+--------------+----------+---------------+

Result table:
+--------------+----------+---------------+-------+
| left_operand | operator | right_operand | value |
+--------------+----------+---------------+-------+
| x            | >        | y             | false |
| x            | <        | y             | true  |
| x            | =        | y             | false |
| y            | >        | x             | true  |
| y            | <        | x             | false |
| x            | =        | x             | true  |
+--------------+----------+---------------+-------+
As shown, you need find the value of each boolean exprssion in the table using the variables table.*/

CREATE TABLE Variables_1440 (
    name VARCHAR(10),
    value INT
);

CREATE TABLE Expressions_1440 (
    left_operand VARCHAR(10),
    operator VARCHAR(5),
    right_operand VARCHAR(10)
);


INSERT INTO Variables_1440 (name, value) VALUES
('x', 66),
('y', 77);


INSERT INTO Expressions_1440 (left_operand, operator, right_operand) VALUES
('x', '>', 'y'),
('x', '<', 'y'),
('x', '=', 'y'),
('y', '>', 'x'),
('y', '<', 'x'),
('x', '=', 'x');


Select * from Variables_1440;

Select * from Expressions_1440;

WITH CTE1 as
(SELECT tbl1.left_operand, tbl1.right_operand , tbl1.operator , tbl1.value1, tbl2.value2
FROM (SELECT 
t1.*, t2.value as value1 FROM Expressions_1440 t1
JOIN Variables_1440 t2
WHERE t1.left_operand = t2.name) tbl1
JOIN
(SELECT 
t1.*, t2.value as value2 FROM Expressions_1440 t1
JOIN Variables_1440 t2
WHERE t1.right_operand = t2.name) tbl2
ON (tbl1.left_operand = tbl2.left_operand
AND tbl1.right_operand = tbl2.right_operand
AND tbl1.operator = tbl2.operator))

SELECT
left_operand, operator, right_operand , 
(CASE WHEN operator = '>' THEN IF(value1>value2, "true", "false")
          WHEN operator = '<' THEN IF(value1<value2, "true", "false")
          WHEN operator = '=' THEN IF(value1=value2, "true", "false")
          END) value
FROM CTE1;


