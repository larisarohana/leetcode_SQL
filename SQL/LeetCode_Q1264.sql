/*1264. Page Recommendations
Description - 
Write an SQL query to recommend pages to the user with user_id = 1 using the pages that your friends liked. It should not recommend pages you already liked.

Return result table in any order without duplicates.

The query result format is in the following example:


Friendship table:
+----------+----------+
| user1_id | user2_id |
+----------+----------+
| 1        | 2        |
| 1        | 3        |
| 1        | 4        |
| 2        | 3        |
| 2        | 4        |
| 2        | 5        |
| 6        | 1        |
+----------+----------+

Likes table:
+---------+---------+
| user_id | page_id |
+---------+---------+
| 1       | 88      |
| 2       | 23      |
| 3       | 24      |
| 4       | 56      |
| 5       | 11      |
| 6       | 33      |
| 2       | 77      |
| 3       | 77      |
| 6       | 88      |
+---------+---------+

Result table:
+------------------+
| recommended_page |
+------------------+
| 23               |
| 24               |
| 56               |
| 33               |
| 77               |
+------------------+
User one is friend with users 2, 3, 4 and 6.
Suggested pages are 23 from user 2, 24 from user 3, 56 from user 3 and 33 from user 6.
Page 77 is suggested from both user 2 and user 3.
Page 88 is not suggested because user 1 already likes it.*/

CREATE TABLE Friendship_1264 (
    user1_id INT,
    user2_id INT,
    PRIMARY KEY (user1_id, user2_id)
);

CREATE TABLE Likes_1264 (
    user_id INT,
    page_id INT,
    PRIMARY KEY (user_id, page_id)
);


INSERT INTO Friendship_1264 (user1_id, user2_id) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 3),
(2, 4),
(2, 5),
(6, 1);


INSERT INTO Likes_1264 (user_id, page_id) VALUES
(1, 88),
(2, 23),
(3, 24),
(4, 56),
(5, 11),
(6, 33),
(2, 77),
(3, 77),
(6, 88);


Select * from Friendship_1264;
Select * from Likes_1264;

-- 1. find all the friedns of user_id =1 
SELECT * FROM Friendship_1264
where  (user1_id =1 or user2_id= 1);

SELECT 
(CASE WHEN user1_id = 1 THEN user2_id
ELSE user1_id END )user1_friends
FROM (SELECT * FROM Friendship_1264
where  (user1_id =1 or user2_id= 1)) t1;

-- 2. Use the above friends-list to find all the distinct page recommendations
SELECT distinct page_id as recommended_page 
FROM Likes_1264 t2
JOIN (SELECT 
(CASE WHEN user1_id = 1 THEN user2_id
ELSE user1_id END )user1_friends
FROM (SELECT * FROM Friendship_1264
where  (user1_id =1 or user2_id= 1)) t1) t3
ON t2.user_id = t3.user1_friends;

-- 3. Now we have to exlcude the page recommendated by user_id 1 themself
SELECT distinct page_id as recommended_page 
FROM Likes_1264 t2
JOIN (SELECT 
(CASE WHEN user1_id = 1 THEN user2_id
ELSE user1_id END )user1_friends
FROM (SELECT * FROM Friendship_1264
where  (user1_id =1 or user2_id= 1)) t1) t3
ON t2.user_id = t3.user1_friends
WHERE page_id NOT IN
        (SELECT page_id
        FROM Likes_1264
        WHERE user_id=1);



