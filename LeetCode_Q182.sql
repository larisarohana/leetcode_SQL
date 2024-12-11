/*Q.No.- 182, Duplicate Emails
Description -  Write a SQL query to find all duplicate emails in a table named Person. */

CREATE TABLE Users (
    Id INT PRIMARY KEY,
    Email VARCHAR(255)
);

select * from users;

INSERT INTO Users (Id, Email) VALUES (1, 'a@b.com');
INSERT INTO Users (Id, Email) VALUES (2, 'c@d.com');
INSERT INTO Users (Id, Email) VALUES (3, 'a@b.com');

Select email from users
group by email
having count(email)>1;
