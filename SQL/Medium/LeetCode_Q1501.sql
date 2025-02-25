/*1501. Countries You Can Safely Invest In
Description - 
Write an SQL query to find the countries where this company can invest.

Return the result table in any order.

The query result format is in the following example.


Person table:
+----+----------+--------------+
| id | name     | phone_number |
+----+----------+--------------+
| 3  | Jonathan | 051-1234567  |
| 12 | Elvis    | 051-7654321  |
| 1  | Moncef   | 212-1234567  |
| 2  | Maroua   | 212-6523651  |
| 7  | Meir     | 972-1234567  |
| 9  | Rachel   | 972-0011100  |
+----+----------+--------------+

Country table:
+----------+--------------+
| name     | country_code |
+----------+--------------+
| Peru     | 051          |
| Israel   | 972          |
| Morocco  | 212          |
| Germany  | 049          |
| Ethiopia | 251          |
+----------+--------------+

Calls table:
+-----------+-----------+----------+
| caller_id | callee_id | duration |
+-----------+-----------+----------+
| 1         | 9         | 33       |
| 2         | 9         | 4        |
| 1         | 2         | 59       |
| 3         | 12        | 102      |
| 3         | 12        | 330      |
| 12        | 3         | 5        |
| 7         | 9         | 13       |
| 7         | 1         | 3        |
| 9         | 7         | 1        |
| 1         | 7         | 7        |
+-----------+-----------+----------+

Result table:
+----------+
| country  |
+----------+
| Peru     |
+----------+
The average call duration for Peru is (102 + 102 + 330 + 330 + 5 + 5) / 6 = 145.666667
The average call duration for Israel is (33 + 4 + 13 + 13 + 3 + 1 + 1 + 7) / 8 = 9.37500
The average call duration for Morocco is (33 + 4 + 59 + 59 + 3 + 7) / 6 = 27.5000
Global call duration average = (2 * (33 + 3 + 59 + 102 + 330 + 5 + 13 + 3 + 1 + 7)) / 20 = 55.70000
Since Peru is the only country where average call duration is greater than the global average, it's the only recommended country.*/

CREATE TABLE Person_1501 (	
    id INT PRIMARY KEY,	
    name VARCHAR(100),	
    phone_number VARCHAR(15)	
);	
	
CREATE TABLE Country_1501 (	
    name VARCHAR(100),	
    country_code VARCHAR(3)	
);	
	
CREATE TABLE Calls_1501 (	
    caller_id INT,	
    callee_id INT,	
    duration INT	
    	
);	
	
INSERT INTO Person_1501 (id, name, phone_number) VALUES	
(3, 'Jonathan', '051-1234567'),	
(12, 'Elvis', '051-7654321'),	
(1, 'Moncef', '212-1234567'),	
(2, 'Maroua', '212-6523651'),	
(7, 'Meir', '972-1234567'),	
(9, 'Rachel', '972-0011100');	
	
INSERT INTO Country_1501 (name, country_code) VALUES	
('Peru', '051'),	
('Israel', '972'),	
('Morocco', '212'),	
('Germany', '049'),	
('Ethiopia', '251');	
		
INSERT INTO Calls_1501 (caller_id, callee_id, duration) VALUES	
(1, 9, 33),	
(2, 9, 4),	
(1, 2, 59),	
(3, 12, 102),	
(3, 12, 330),	
(12, 3, 5),	
(7, 9, 13),	
(7, 1, 3),	
(9, 7, 1),	
(1, 7, 7);	
	
Select * from Person_1501;	
Select * from Country_1501;	
Select * from Calls_1501;	

SELECT 
t1.*, t2.*
FROM
Person_1501 t1
JOIN Country_1501 t2
ON SUBSTRING(t1.phone_number, 1, 3) = t2.country_code
;

WITH t1 AS(
SELECT caller_id AS id, duration AS total
FROM
(SELECT caller_id, duration
FROM Calls_1501
UNION ALL
SELECT callee_id, duration
FROM Calls_1501) a
)
SELECT name AS country
FROM
(SELECT distinct avg(total) OVER(PARTITION BY code) AS avg_call, avg(total) OVER() AS global_avg, c.name
FROM
((SELECT *, coalesce(total,0) AS duration, SUBSTRING(phone_number FROM 1 for 3) AS code
FROM Person_1501 RIGHT JOIN t1
USING (id)) b
join Country_1501 c
ON c.country_code = b.code)) d
WHERE avg_call > global_avg;
