/*Q.No.- 597. Friend Requests I: Overall Acceptance Rate
Description - 
In social network like Facebook or Twitter, people send friend requests and accept others’ requests as well. Now given two tables as below: Table: friend_request
| sender_id | send_to_id |request_date|
|-----------|------------|------------|
| 1         | 2          | 2016_06-01 |
| 1         | 3          | 2016_06-01 |
| 1         | 4          | 2016_06-01 |
| 2         | 3          | 2016_06-02 |
| 3         | 4          | 2016-06-09 |
Table: request_accepted
| requester_id | accepter_id |accept_date |
|--------------|-------------|------------|
| 1            | 2           | 2016_06-03 |
| 1            | 3           | 2016-06-08 |
| 2            | 3           | 2016-06-08 |
| 3            | 4           | 2016-06-09 |
| 3            | 4           | 2016-06-10 |
Write a query to find the overall acceptance rate of requests rounded to 2 decimals, which is the number of acceptance divide the number of requests. For the sample data above, your query should return the following result.
|accept_rate|
|-----------|
|       0.80|*/

CREATE TABLE friend_request_597 (
    sender_id INT,
    send_to_id INT,
    request_date DATE,
    PRIMARY KEY (sender_id, send_to_id, request_date)
);

CREATE TABLE request_accepted_597 (
    requester_id INT,
    accepter_id INT,
    accept_date DATE,
    PRIMARY KEY (requester_id, accepter_id, accept_date)
);

INSERT INTO friend_request_597 (sender_id, send_to_id, request_date) VALUES (1, 2, '2016-06-01');
INSERT INTO friend_request_597 (sender_id, send_to_id, request_date) VALUES (1, 3, '2016-06-01');
INSERT INTO friend_request_597 (sender_id, send_to_id, request_date) VALUES (1, 4, '2016-06-01');
INSERT INTO friend_request_597 (sender_id, send_to_id, request_date) VALUES (2, 3, '2016-06-02');
INSERT INTO friend_request_597 (sender_id, send_to_id, request_date) VALUES (3, 4, '2016-06-09');

INSERT INTO request_accepted_597 (requester_id, accepter_id, accept_date) VALUES (1, 2, '2016-06-03');
INSERT INTO request_accepted_597 (requester_id, accepter_id, accept_date) VALUES (1, 3, '2016-06-08');
INSERT INTO request_accepted_597 (requester_id, accepter_id, accept_date) VALUES (2, 3, '2016-06-08');
INSERT INTO request_accepted_597 (requester_id, accepter_id, accept_date) VALUES (3, 4, '2016-06-09');
INSERT INTO request_accepted_597 (requester_id, accepter_id, accept_date) VALUES (3, 4, '2016-06-10');

select * from friend_request_597;
select * from request_accepted_597;

Select DISTINCT COUNT(send_to_id) OVER(PARTITION BY sender_id ), sender_id FROM friend_request_597;

Select DISTINCT COUNT(accepter_id) OVER(PARTITION BY requester_id ), requester_id FROM request_accepted_597;

Select COUNT(DISTINCT sender_id,send_to_id) as requests  FROM friend_request_597;

Select COUNT(DISTINCT requester_id, accepter_id) AS accepts FROM request_accepted_597;

SELECT IFNULL(ROUND(t2.accepts/t1.requests,2),0.00) as accept_rate
FROM 
(Select COUNT(DISTINCT sender_id,send_to_id) as requests  FROM friend_request_597) t1,
(Select COUNT(DISTINCT requester_id, accepter_id) AS accepts FROM request_accepted_597) t2;