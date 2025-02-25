/*178. Rank Scores
Description - 
Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking. Note that after a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no "holes" between ranks.


+----+-------+
| Id | Score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+
For example, given the above Scores table, your query should generate the following report (order by highest score):


+-------+---------+
| score | Rank    |
+-------+---------+
| 4.00  | 1       |
| 4.00  | 1       |
| 3.85  | 2       |
| 3.65  | 3       |
| 3.65  | 3       |
| 3.50  | 4       |
+-------+---------+*/

Create table If Not Exists Scores_178 (id int, score DECIMAL(3,2));

Truncate table Scores_178;
insert into Scores_178 (id, score) values ('1', '3.5');
insert into Scores_178 (id, score) values ('2', '3.65');
insert into Scores_178 (id, score) values ('3', '4.0');
insert into Scores_178 (id, score) values ('4', '3.85');
insert into Scores_178 (id, score) values ('5', '4.0');
insert into Scores_178 (id, score) values ('6', '3.65');

SELECT score
, dense_rank() over(order by score desc) as 'rank'
FROM Scores_178;