/*626. Exchange Seats
Description - 
Mary is a teacher in a middle school and she has a table seat storing students' names and their corresponding seat ids.

The column id is continuous increment.

Mary wants to change seats for the adjacent students.

Can you write a SQL query to output the result for Mary?


+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Abbot   |
|    2    | Doris   |
|    3    | Emerson |
|    4    | Green   |
|    5    | Jeames  |
+---------+---------+
For the sample input, the output is:


+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Doris   |
|    2    | Abbot   |
|    3    | Green   |
|    4    | Emerson |
|    5    | Jeames  |
+---------+---------+
Note:
If the number of students is odd, there is no need to change the last one's seat.*/

Create table If Not Exists Seat_626 (id int, student varchar(255));

Truncate table Seat_626;
insert into Seat_626 (id, student) values ('1', 'Abbot');
insert into Seat_626 (id, student) values ('2', 'Doris');
insert into Seat_626 (id, student) values ('3', 'Emerson');
insert into Seat_626 (id, student) values ('4', 'Green');
insert into Seat_626 (id, student) values ('5', 'Jeames');


SELECT 
    CASE 
        WHEN id = (SELECT MAX(id) FROM Seat_626) AND id % 2 = 1 
            THEN id -- When the last id = 5 and 5 is odd then the id stays the same
        WHEN id % 2 = 1 -- When the is id the odd number then make the id the next id
            THEN id + 1
        ELSE id - 1 -- else When the is id the even number then make the id the previous id
    END AS id,
    student
FROM Seat_626
ORDER BY id;