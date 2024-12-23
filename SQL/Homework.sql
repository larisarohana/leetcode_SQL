-- 1164. Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

CREATE TABLE Products_1164 (
    product_id INT,
    new_price DECIMAL(10, 2),
    change_date DATE
);
INSERT INTO Products_1164 (product_id, new_price, change_date) VALUES
(1, 20, '2019-08-14'),
(2, 50, '2019-08-14'),
(1, 30, '2019-08-15'),
(1, 35, '2019-08-16'),
(2, 65, '2019-08-17'),
(3, 20, '2019-08-18');


SELECT * FROM 
(SELECT product_id, max(change_date) last_change_date
FROM Products_1164 
GROUP BY product_id) p1
where last_change_date <= '2019-08-16';

SELECT product_id , max(change_date) last_change_date
FROM Products_1164 
GROUP BY product_id;
;

SELECT P1.product_id, coalesce(P2.NEW_PRICE,10) as latest_price
FROM (SELECT DISTINCT(product_id) FROM Products_1164) P1
LEFT JOIN
(SELECT t1.* FROM 
Products_1164 t1
JOIN (SELECT product_id, max(change_date) last_change_date
FROM Products_1164 
where change_date <= '2019-08-16'
 GROUP BY product_id) t2
 ON (t1.change_date = t2.last_change_date AND t1.product_id = t2.product_id)) P2
 ON P1.product_id = P2.product_id
;