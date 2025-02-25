/*1204. Last Person to Fit in the Elevator
Description - 
he maximum weight the elevator can hold is 1000.

Write an SQL query to find the person_name of the last person who will fit in the elevator without exceeding the weight limit. It is guaranteed that the person who is first in the queue can fit in the elevator.

The query result format is in the following example:


Queue table
+-----------+-------------------+--------+------+
| person_id | person_name       | weight | turn |
+-----------+-------------------+--------+------+
| 5         | George Washington | 250    | 1    |
| 3         | John Adams        | 350    | 2    |
| 6         | Thomas Jefferson  | 400    | 3    |
| 2         | Will Johnliams    | 200    | 4    |
| 4         | Thomas Jefferson  | 175    | 5    |
| 1         | James Elephant    | 500    | 6    |
+-----------+-------------------+--------+------+

Result table
+-------------------+
| person_name       |
+-------------------+
| Thomas Jefferson  |
+-------------------+

Queue table is ordered by turn in the example for simplicity.
In the example George Washington(id 5), John Adams(id 3) and Thomas Jefferson(id 6) will enter the elevator as their weight sum is 250 + 350 + 400 = 1000.
Thomas Jefferson(id 6) is the last person to fit in the elevator because he has the last turn in these three people.*/

CREATE TABLE Queue_1204 (
    person_id INT,
    person_name VARCHAR(50),
    weight INT,
    turn INT
);

INSERT INTO Queue_1204 (person_id, person_name, weight, turn) VALUES
(5, 'George Washington', 250, 1),
(3, 'John Adams', 350, 2),
(6, 'Thomas Jefferson', 400, 3),
(2, 'Will Johnliams', 200, 4),
(4, 'Thomas Jefferson', 175, 5),
(1, 'James Elephant', 500, 6);

Select * from Queue_1204;

SELECT *,
SUM(weight) OVER(ORDER BY turn) AS cum_weight
FROM Queue_1204
order by turn;

SELECT person_name
FROM Queue_1204 
WHERE turn = ( SELECT MAX(t1.TURN)
				FROM (SELECT *,
SUM(weight) OVER(ORDER BY turn) AS cum_weight
FROM Queue_1204
order by turn) t1
WHERE t1.cum_weight <= 1000
		);


