/*569. Median Employee Salary
Description - 
The Employee table holds all employees. The employee table has three columns: Employee Id, Company Name, and Salary.


+-----+------------+--------+
|Id   | Company    | Salary |
+-----+------------+--------+
|1    | A          | 2341   |
|2    | A          | 341    |
|3    | A          | 15     |
|4    | A          | 15314  |
|5    | A          | 451    |
|6    | A          | 513    |
|7    | B          | 15     |
|8    | B          | 13     |
|9    | B          | 1154   |
|10   | B          | 1345   |
|11   | B          | 1221   |
|12   | B          | 234    |
|13   | C          | 2345   |
|14   | C          | 2645   |
|15   | C          | 2645   |
|16   | C          | 2652   |
|17   | C          | 65     |
+-----+------------+--------+
Write a SQL query to find the median salary of each company. Bonus points if you can solve it without using any built-in SQL functions.


+-----+------------+--------+
|Id   | Company    | Salary |
+-----+------------+--------+
|5    | A          | 451    |
|6    | A          | 513    |
|12   | B          | 234    |
|9    | B          | 1154   |
|14   | C          | 2645   |
+-----+------------+--------+*/

CREATE TABLE CompanySalaries_569 (						
    Id INT PRIMARY KEY,						
    Company VARCHAR(50),						
    Salary INT						
);						
						
INSERT INTO CompanySalaries_569 (Id, Company, Salary)						
VALUES						
(1, 'A', 2341),						
(2, 'A', 341),						
(3, 'A', 15),						
(4, 'A', 15314),						
(5, 'A', 451),						
(6, 'A', 513),						
(7, 'B', 15),						
(8, 'B', 13),						
(9, 'B', 1154),						
(10, 'B', 1345),						
(11, 'B', 1221),						
(12, 'B', 234),						
(13, 'C', 2345),						
(14, 'C', 2645),						
(15, 'C', 2645),						
(16, 'C', 2652),						
(17, 'C', 65);						
						
Select * from CompanySalaries_569;						
						
Select * from CompanySalaries_569 order by company,salary;						
						
/*SOLUTION USING BUILT-IN FUNCTION*/
-- 1. Get the row_number of salary grouped by company and total rwos fro each company 
SELECT *
,row_number() over (partition by company order by company,salary) as rn,							
 count(*) over (partition by company) as cn							
 from CompanySalaries_569 order by company,salary;

-- 2. To get all those rows who are between cn/2 and (cn/2)+1 
SELECT id,company,salary							
FROM							
(SELECT *
,row_number() over (partition by company order by company,salary) as rn,							
 count(*) over (partition by company) as cn							
 from CompanySalaries_569 order by company,salary)it							
 WHERE rn BETWEEN (cn/2) AND (cn/2)+1	;	
 
 /*SOLUTION WITHOUT BUILT - IN FUNCTION*/
SELECT * 
FROM CompanySalaries_569	
WHERE company = 'A'
LIMIT SELECT (case when count(*)%2=1 THEN 1
		ELSE 2 END) FROM CompanySalaries_569 where company='A'
OFFSET (SELECT (case when count(*)%2=1 THEN count(*)/2 
				ELSE ((count(*)/2)-1) END) FROM CompanySalaries_569 where company='A')
ORDER BY company,salary
        ;
        										        
(SELECT (case when count(*)%2=1 then 1 -- IF ITS ODD NUMBER OF RECORDS THEN FETCH ONLY 1 RECORD IN THE MIDDLE
		ELSE 2 END) FROM CompanySalaries_569 where company='A'); -- IF TS EVEN NUMBER OF RECORDS THEN FETCH THE MIDDLE 2 RECORDS
 


