/*1454. Active Users
Description - 
Write an SQL query to find the id and the name of active users.

Active users are those who logged in to their accounts for 5 or more consecutive days.

Return the result table ordered by the id.

The query result format is in the following example:


Accounts table:
+----+----------+
| id | name     |
+----+----------+
| 1  | Winston  |
| 7  | Jonathan |
+----+----------+

Logins table:
+----+------------+
| id | login_date |
+----+------------+
| 7  | 2020-05-30 |
| 1  | 2020-05-30 |
| 7  | 2020-05-31 |
| 7  | 2020-06-01 |
| 7  | 2020-06-02 |
| 7  | 2020-06-02 |
| 7  | 2020-06-03 |
| 1  | 2020-06-07 |
| 7  | 2020-06-10 |
+----+------------+

Result table:
+----+----------+
| id | name     |
+----+----------+
| 7  | Jonathan |
+----+----------+
User Winston with id = 1 logged in 2 times only in 2 different days, so, Winston is not an active user.
User Jonathan with id = 7 logged in 7 times in 6 different days, five of them were consecutive days, so, Jonathan is an active user.
Follow up question: Can you write a general solution if the active users are those who logged in to their accounts for n or more consecutive days?*/

CREATE TABLE Accounts_1454 (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Logins_1454 (
    id INT,
    login_date DATE,
    FOREIGN KEY (id) REFERENCES Accounts_1454(id)
);


INSERT INTO Accounts_1454 (id, name) VALUES
(1, 'Winston'),
(7, 'Jonathan');

INSERT INTO Logins_1454 (id, login_date) VALUES
(7, '2020-05-30'),
(1, '2020-05-30'),
(7, '2020-05-31'),
(7, '2020-06-01'),
(7, '2020-06-02'),
(7, '2020-06-02'),
(7, '2020-06-03'),
(1, '2020-06-07'),
(7, '2020-06-10');

Select * from Accounts_1454;
Select * from Logins_1454 order by id, login_date;

							
SELECT * FROM 
Accounts_1454
WHERE id in 
(SELECT distinct t1.id
    FROM Logins_1454 AS t1 
    INNER JOIN Logins_1454 AS t2
    ON t1.id = t2.id 
    AND datediff(t1.login_date, t2.login_date) between 1 and 5)
    order by id
    ;		
							
							



