/*Q.No.- 175. Combine Two Tables
Description -  Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:
FirstName, LastName, City, State */

CREATE TABLE IF NOT EXISTS Person (
    personId INT,
    firstName VARCHAR(255),
    lastName VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS Address (
    addressId INT,
    personId INT,
    city VARCHAR(255),
    state VARCHAR(255)
);

Truncate table Person;
insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen');
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob');

SELECT 
    *
FROM
    person;

Truncate table Address;
insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York');
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California');

SELECT 
    *
FROM
    address;

SELECT 
    per.firstName, per.lastName, addr.city, addr.state
FROM
    Person per
        LEFT JOIN
    address addr ON per.personId = addr.personId
ORDER BY per.personId;