/*1715. Count Apples and Oranges
Description - 
Write an SQL query to count the number of apples and oranges in all the boxes. If a box contains a chest, you should also include the number of apples and oranges it has.

Return the result table in any order.

The query result format is in the following example:


Boxes table:
+--------+----------+-------------+--------------+
| box_id | chest_id | apple_count | orange_count |
+--------+----------+-------------+--------------+
| 2      | null     | 6           | 15           |
| 18     | 14       | 4           | 15           |
| 19     | 3        | 8           | 4            |
| 12     | 2        | 19          | 20           |
| 20     | 6        | 12          | 9            |
| 8      | 6        | 9           | 9            |
| 3      | 14       | 16          | 7            |
+--------+----------+-------------+--------------+

Chests table:
+----------+-------------+--------------+
| chest_id | apple_count | orange_count |
+----------+-------------+--------------+
| 6        | 5           | 6            |
| 14       | 20          | 10           |
| 2        | 8           | 8            |
| 3        | 19          | 4            |
| 16       | 19          | 19           |
+----------+-------------+--------------+

Result table:
+-------------+--------------+
| apple_count | orange_count |
+-------------+--------------+
| 151         | 123          |
+-------------+--------------+
box 2 has 6 apples and 15 oranges.
box 18 has 4 + 20 (from the chest) = 24 apples and 15 + 10 (from the chest) = 25 oranges.
box 19 has 8 + 19 (from the chest) = 27 apples and 4 + 4 (from the chest) = 8 oranges.
box 12 has 19 + 8 (from the chest) = 27 apples and 20 + 8 (from the chest) = 28 oranges.
box 20 has 12 + 5 (from the chest) = 17 apples and 9 + 6 (from the chest) = 15 oranges.
box 8 has 9 + 5 (from the chest) = 14 apples and 9 + 6 (from the chest) = 15 oranges.
box 3 has 16 + 20 (from the chest) = 36 apples and 7 + 10 (from the chest) = 17 oranges.
Total number of apples = 6 + 24 + 27 + 27 + 17 + 14 + 36 = 151
Total number of oranges = 15 + 25 + 8 + 28 + 15 + 15 + 17 = 123
*/

CREATE TABLE Boxes_1715 (					
    box_id INT PRIMARY KEY,					
    chest_id INT,					
    apple_count INT,					
    orange_count INT					
);					
					
CREATE TABLE Chests_1715 (					
    chest_id INT PRIMARY KEY,					
    apple_count INT,					
    orange_count INT					
);					
					
INSERT INTO Boxes_1715 (box_id, chest_id, apple_count, orange_count) VALUES					
(2, NULL, 6, 15),					
(18, 14, 4, 15),					
(19, 3, 8, 4),					
(12, 2, 19, 20),					
(20, 6, 12, 9),					
(8, 6, 9, 9),					
(3, 14, 16, 7);					
					
INSERT INTO Chests_1715 (chest_id, apple_count, orange_count) VALUES					
(6, 5, 6),					
(14, 20, 10),					
(2, 8, 8),					
(3, 19, 4),					
(16, 19, 19);					
					
Select * from Boxes_1715;					
Select * from Chests_1715;					
		


SELECT chest_id, SUM(apple_count) as apple_count, SUM(orange_count) as orange_count
FROM Boxes_1715  
GROUP BY chest_id
;

SELECT chest_id, SUM(apple_count) as apple_count, SUM(orange_count) as orange_count
FROM Chests_1715
GROUP BY chest_id
;

SELECT SUM(CASE WHEN t2.chest_id IS NULL THEN t1.apple_count
          ELSE t1.apple_count + coalesce(t2.apple_count,0) END) apple_count,
           SUM(CASE WHEN t2.chest_id IS NULL THEN t1.orange_count
          ELSE t1.orange_count + coalesce(t2.orange_count,0) END) orange_count
FROM Boxes_1715 t1
LEFT JOIN Chests_1715 t2
ON t1.chest_id = t2.chest_id;