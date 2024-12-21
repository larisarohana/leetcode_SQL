

CREATE TABLE Products (
    product_id INT,
    new_price DECIMAL(10, 2),
    change_date DATE
);
INSERT INTO Products (product_id, new_price, change_date) VALUES
(1, 20, '2019-08-14'),
(2, 50, '2019-08-14'),
(1, 30, '2019-08-15'),
(1, 35, '2019-08-16'),
(2, 65, '2019-08-17'),
(3, 20, '2019-08-18');
Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.