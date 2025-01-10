/*1098. Unpopular Books
Description - 
Write an SQL query that reports the books that have sold less than 10 copies in the last year, excluding books that have been available for less than 1 month from today. Assume today is 2019-06-23.

The query result format is in the following example:


Books table:
+---------+--------------------+----------------+
| book_id | name               | available_from |
+---------+--------------------+----------------+
| 1       | "Kalila And Demna" | 2010-01-01     |
| 2       | "28 Letters"       | 2012-05-12     |
| 3       | "The Hobbit"       | 2019-06-10     |
| 4       | "13 Reasons Why"   | 2019-06-01     |
| 5       | "The Hunger Games" | 2008-09-21     |
+---------+--------------------+----------------+

Orders table:
+----------+---------+----------+---------------+
| order_id | book_id | quantity | dispatch_date |
+----------+---------+----------+---------------+
| 1        | 1       | 2        | 2018-07-26    |
| 2        | 1       | 1        | 2018-11-05    |
| 3        | 3       | 8        | 2019-06-11    |
| 4        | 4       | 6        | 2019-06-05    |
| 5        | 4       | 5        | 2019-06-20    |
| 6        | 5       | 9        | 2009-02-02    |
| 7        | 5       | 8        | 2010-04-13    |
+----------+---------+----------+---------------+

Result table:
+-----------+--------------------+
| book_id   | name               |
+-----------+--------------------+
| 1         | "Kalila And Demna" |
| 2         | "28 Letters"       |
| 5         | "The Hunger Games" |
+-----------+--------------------+*/

CREATE TABLE Books_1098 (
    book_id INT PRIMARY KEY,
    name VARCHAR(255),
    available_from DATE
);

CREATE TABLE Orders_1098 (
    order_id INT PRIMARY KEY,
    book_id INT,
    quantity INT,
    dispatch_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books_1098(book_id)
);



INSERT INTO Books_1098 (book_id, name, available_from) VALUES
(1, 'Kalila And Demna', '2010-01-01'),
(2, '28 Letters', '2012-05-12'),
(3, 'The Hobbit', '2019-06-10'),
(4, '13 Reasons Why', '2019-06-01'),
(5, 'The Hunger Games', '2008-09-21');


INSERT INTO Orders_1098 (order_id, book_id, quantity, dispatch_date) VALUES
(1, 1, 2, '2018-07-26'),
(2, 1, 1, '2018-11-05'),
(3, 3, 8, '2019-06-11'),
(4, 4, 6, '2019-06-05'),
(5, 4, 5, '2019-06-20'),
(6, 5, 9, '2009-02-02'),
(7, 5, 8, '2010-04-13');


Select * from Books_1098;
Select * from Orders_1098;

SELECT t1.book_id, t1. name
FROM Books_1098 t1
LEFT JOIN  (SELECT * FROM 
Orders_1098 WHERE book_id IN (SELECT book_id
        FROM Orders_1098
        WHERE dispatch_date BETWEEN '2018-06-23' AND '2019-06-23'
        GROUP BY book_id)) t2
ON t1.book_id = t2.book_id
WHERE t1.available_from <  DATE_SUB('2019-06-23', INTERVAL 1 MONTH)
GROUP BY book_id
HAVING  COALESCE(SUM(t2.quantity),0) <10  ;

SELECT * FROM 
Orders_1098 WHERE book_id IN (SELECT book_id
        FROM Orders_1098
        WHERE dispatch_date BETWEEN '2018-06-23' AND '2019-06-23'
        GROUP BY book_id)  ;
