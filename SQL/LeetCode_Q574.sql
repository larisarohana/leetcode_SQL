/*574. Winning Candidate
Description - 
Table: Candidate


+-----+---------+
| id  | Name    |
+-----+---------+
| 1   | A       |
| 2   | B       |
| 3   | C       |
| 4   | D       |
| 5   | E       |
+-----+---------+
Table: Vote


+-----+--------------+
| id  | CandidateId  |
+-----+--------------+
| 1   |     2        |
| 2   |     4        |
| 3   |     3        |
| 4   |     2        |
| 5   |     5        |
+-----+--------------+
id is the auto-increment primary key, CandidateId is the id appeared in Candidate table. Write a sql to find the name of the winning candidate, the above example will return the winner B.


+------+
| Name |
+------+
| B    |
+------+
Notes: You may assume there is no tie, in other words there will be at most one winning candidate.*/

CREATE TABLE Candidate_574 (		
    id INT PRIMARY KEY,		
    Name VARCHAR(50)		
);		
		
CREATE TABLE Vote_574 (		
    id INT PRIMARY KEY,		
    CandidateId INT		
);		
		
INSERT INTO Candidate_574 (id, Name) VALUES		
(1, 'A'),		
(2, 'B'),		
(3, 'C'),		
(4, 'D'),		
(5, 'E');		
		
INSERT INTO Vote_574 (id, CandidateId) VALUES		
(1, 2),		
(2, 4),		
(3, 3),		
(4, 2),		
(5, 5);		

		
		
Select * from Candidate_574;		
Select * from Vote_574;		

SELECT name 
from Candidate_574
where ID = (SELECT CandidateId
FROM Vote_574
GROUP BY CandidateId
ORDER by COUNT(CandidateId) DESC
LIMIT 1 );
