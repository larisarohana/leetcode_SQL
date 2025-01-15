/*1364. Number of Trusted Contacts of a Customer
Description - 
Write an SQL query to find the following for each invoice_id:

customer_name: The name of the customer the invoice is related to.
price: The price of the invoice.
contacts_cnt: The number of contacts related to the customer.
trusted_contacts_cnt: The number of contacts related to the customer and at the same time they are customers to the shop. (i.e His/Her email exists in the Customers table.) Order the result table by invoice_id.
The query result format is in the following example:


Customers table:
+-------------+---------------+--------------------+
| customer_id | customer_name | email              |
+-------------+---------------+--------------------+
| 1           | Alice         | alice@leetcode.com |
| 2           | Bob           | bob@leetcode.com   |
| 13          | John          | john@leetcode.com  |
| 6           | Alex          | alex@leetcode.com  |
+-------------+---------------+--------------------+
Contacts table:
+-------------+--------------+--------------------+
| user_id     | contact_name | contact_email      |
+-------------+--------------+--------------------+
| 1           | Bob          | bob@leetcode.com   |
| 1           | John         | john@leetcode.com  |
| 1           | Jal          | jal@leetcode.com   |
| 2           | Omar         | omar@leetcode.com  |
| 2           | Meir         | meir@leetcode.com  |
| 6           | Alice        | alice@leetcode.com |
+-------------+--------------+--------------------+
Invoices table:
+------------+-------+---------+
| invoice_id | price | user_id |
+------------+-------+---------+
| 77         | 100   | 1       |
| 88         | 200   | 1       |
| 99         | 300   | 2       |
| 66         | 400   | 2       |
| 55         | 500   | 13      |
| 44         | 60    | 6       |
+------------+-------+---------+
Result table:
+------------+---------------+-------+--------------+----------------------+
| invoice_id | customer_name | price | contacts_cnt | trusted_contacts_cnt |
+------------+---------------+-------+--------------+----------------------+
| 44         | Alex          | 60    | 1            | 1                    |
| 55         | John          | 500   | 0            | 0                    |
| 66         | Bob           | 400   | 2            | 0                    |
| 77         | Alice         | 100   | 3            | 2                    |
| 88         | Alice         | 200   | 3            | 2                    |
| 99         | Bob           | 300   | 2            | 0                    |
+------------+---------------+-------+--------------+----------------------+
Alice has three contacts, two of them are trusted contacts (Bob and John).
Bob has two contacts, none of them is a trusted contact.
Alex has one contact and it is a trusted contact (Alice).
John doesn't have any contacts.*/

CREATE TABLE Customers_1364 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100)
);


CREATE TABLE Contacts_1364 (
    user_id INT,
    contact_name VARCHAR(50),
    contact_email VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES Customers_1364(customer_id)
);

CREATE TABLE Invoices_1364 (
    invoice_id INT PRIMARY KEY,
    price DECIMAL(10, 2),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Customers_1364(customer_id)
);

INSERT INTO Customers_1364 (customer_id, customer_name, email) VALUES
(1, 'Alice', 'alice@leetcode.com'),
(2, 'Bob', 'bob@leetcode.com'),
(13, 'John', 'john@leetcode.com'),
(6, 'Alex', 'alex@leetcode.com');

INSERT INTO Contacts_1364 (user_id, contact_name, contact_email) VALUES
(1, 'Bob', 'bob@leetcode.com'),
(1, 'John', 'john@leetcode.com'),
(1, 'Jal', 'jal@leetcode.com'),
(2, 'Omar', 'omar@leetcode.com'),
(2, 'Meir', 'meir@leetcode.com'),
(6, 'Alice', 'alice@leetcode.com');

INSERT INTO Invoices_1364 (invoice_id, price, user_id) VALUES
(77, 100, 1),
(88, 200, 1),
(99, 300, 2),
(66, 400, 2),
(55, 500, 13),
(44, 60, 6);

Select * from Customers_1364;
Select * from Contacts_1364;
Select * from Invoices_1364;

SELECT t1.invoice_id , t2.customer_name , t1.price
, COUNT(t3.user_id) as contacts_cnt
, SUM(CASE WHEN t3.contact_email IN (SELECT email FROM Customers_1364) THEN 1 ELSE 0 END) AS trusted_contacts_cnt 
FROM Invoices_1364 t1 JOIN Customers_1364 t2 ON (t1.user_id = t2.customer_id)
LEFT JOIN Contacts_1364 t3 ON (t1.user_id = t3.user_id)
GROUP BY t1.invoice_id , t2.customer_name
ORDER BY t1.invoice_id ;
