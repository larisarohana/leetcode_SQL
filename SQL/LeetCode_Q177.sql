/*177. Nth Highest Salary
Description - 
Write a SQL query to get the nth highest salary from the Employee table.


+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.


+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+*/

Create table If Not Exists Employee_177 (Id int, Salary int);

Truncate table Employee_177;
insert into Employee_177 (id, salary) values ('1', '100');
insert into Employee_177 (id, salary) values ('2', '200');
insert into Employee_177 (id, salary) values ('3', '300');

-- DELIMITER //
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT DETERMINISTIC
 -- BEGIN
	-- DECLARE N = N;
  RETURN (
      (WITH dns_rnk AS(
      SELECT DISTINCT Salary, DENSE_RANK() OVER(ORDER BY SALARY DESC) denserank
      FROM Employee_177)
      SELECT SALARY FROM dns_rnk WHERE denserank = N)
      );
  -- END
-- DELIMITER ;

WITH dns_rnk AS(
      SELECT Salary, DENSE_RANK() OVER(ORDER BY SALARY DESC) denserank
      FROM Employee_177)
      SELECT SALARY FROM dns_rnk WHERE denserank= 2;
      
      SELECT Salary, DENSE_RANK() OVER(ORDER BY SALARY DESC) denserank
      FROM Employee_177;
      
      Select getNthHighestSalary(2) ;

