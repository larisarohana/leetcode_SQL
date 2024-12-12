/*Q.No.- 196. Delete Duplicate Emails
Description -  Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.
+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Id is the primary key column for this table. For example, after running your query, the above Person table should have the following rows:
+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+ */

CREATE TABLE IF NOT EXISTS Person_196 (
    Id INT,
    Email VARCHAR(255)
);

Truncate table Person_196;

insert into Person_196 (id, email) values ('1', 'john@example.com');
insert into Person_196 (id, email) values ('2', 'bob@example.com');
insert into Person_196 (id, email) values ('3', 'john@example.com');

SET SQL_SAFE_UPDATES = 0; -- To disable safe mode else Error 1175 will come in MySQL Workbench
DELETE p1.* FROM Person_196 p1
JOIN Person_196 p2
ON p1.email = p2.email
WHERE p1.id > p2.id; 

select * from Person_196;

/*To find dupliate rows*/
SELECT 
    MIN(p2.id), p2.email
FROM
    Person_196 p2
GROUP BY p2.email
HAVING COUNT(p2.email) > 1;

