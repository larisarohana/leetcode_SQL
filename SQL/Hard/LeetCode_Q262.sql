/*262. Trips and Users
Description - 
Write a SQL query to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03".

The cancellation rate is computed by dividing the number of canceled (by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day.

Return the result table in any order. Round Cancellation Rate to two decimal points.

The query result format is in the following example:


Trips table:
+----+-----------+-----------+---------+---------------------+------------+
| Id | Client_Id | Driver_Id | City_Id | Status              | Request_at |
+----+-----------+-----------+---------+---------------------+------------+
| 1  | 1         | 10        | 1       | completed           | 2013-10-01 |
| 2  | 2         | 11        | 1       | cancelled_by_driver | 2013-10-01 |
| 3  | 3         | 12        | 6       | completed           | 2013-10-01 |
| 4  | 4         | 13        | 6       | cancelled_by_client | 2013-10-01 |
| 5  | 1         | 10        | 1       | completed           | 2013-10-02 |
| 6  | 2         | 11        | 6       | completed           | 2013-10-02 |
| 7  | 3         | 12        | 6       | completed           | 2013-10-02 |
| 8  | 2         | 12        | 12      | completed           | 2013-10-03 |
| 9  | 3         | 10        | 12      | completed           | 2013-10-03 |
| 10 | 4         | 13        | 12      | cancelled_by_driver | 2013-10-03 |
+----+-----------+-----------+---------+---------------------+------------+

Users table:
+----------+--------+--------+
| Users_Id | Banned | Role   |
+----------+--------+--------+
| 1        | No     | client |
| 2        | Yes    | client |
| 3        | No     | client |
| 4        | No     | client |
| 10       | No     | driver |
| 11       | No     | driver |
| 12       | No     | driver |
| 13       | No     | driver |
+----------+--------+--------+

Result table:
+------------+-------------------+
| Day        | Cancellation Rate |
+------------+-------------------+
| 2013-10-01 | 0.33              |
| 2013-10-02 | 0.00              |
| 2013-10-03 | 0.50              |
+------------+-------------------+

On 2013-10-01:

- There were 4 requests in total, 2 of which were canceled.
- However, the request with Id=2 was made by a banned client (User_Id=2), so it is ignored in the calculation.
- Hence there are 3 unbanned requests in total, 1 of which was canceled.
- The Cancellation Rate is (1 / 3) = 0.33
  On 2013-10-02:
- There were 3 requests in total, 0 of which were canceled.
- The request with Id=6 was made by a banned client, so it is ignored.
- Hence there are 2 unbanned requests in total, 0 of which were canceled.
- The Cancellation Rate is (0 / 2) = 0.00
  On 2013-10-03:
- There were 3 requests in total, 1 of which was canceled.
- The request with Id=8 was made by a banned client, so it is ignored.
- Hence there are 2 unbanned request in total, 1 of which were canceled.
- The Cancellation Rate is (1 / 2) = 0.50*/


Create table If Not Exists Trips_262 (id int, client_id int, driver_id int, city_id int, status ENUM('completed', 'cancelled_by_driver', 'cancelled_by_client'), request_at varchar(50));
Create table If Not Exists Users_262 (users_id int, banned varchar(50), role ENUM('client', 'driver', 'partner'));

Truncate table Trips_262;
insert into Trips_262 (id, client_id, driver_id, city_id, status, request_at) values ('1', '1', '10', '1', 'completed', '2013-10-01');
insert into Trips_262 (id, client_id, driver_id, city_id, status, request_at) values ('2', '2', '11', '1', 'cancelled_by_driver', '2013-10-01');
insert into Trips_262 (id, client_id, driver_id, city_id, status, request_at) values ('3', '3', '12', '6', 'completed', '2013-10-01');
insert into Trips_262 (id, client_id, driver_id, city_id, status, request_at) values ('4', '4', '13', '6', 'cancelled_by_client', '2013-10-01');
insert into Trips_262 (id, client_id, driver_id, city_id, status, request_at) values ('5', '1', '10', '1', 'completed', '2013-10-02');
insert into Trips_262 (id, client_id, driver_id, city_id, status, request_at) values ('6', '2', '11', '6', 'completed', '2013-10-02');
insert into Trips_262 (id, client_id, driver_id, city_id, status, request_at) values ('7', '3', '12', '6', 'completed', '2013-10-02');
insert into Trips_262 (id, client_id, driver_id, city_id, status, request_at) values ('8', '2', '12', '12', 'completed', '2013-10-03');
insert into Trips_262 (id, client_id, driver_id, city_id, status, request_at) values ('9', '3', '10', '12', 'completed', '2013-10-03');
insert into Trips_262 (id, client_id, driver_id, city_id, status, request_at) values ('10', '4', '13', '12', 'cancelled_by_driver', '2013-10-03');

Truncate table Users_262;
insert into Users_262 (users_id, banned, role) values ('1', 'No', 'client');
insert into Users_262 (users_id, banned, role) values ('2', 'Yes', 'client');
insert into Users_262 (users_id, banned, role) values ('3', 'No', 'client');
insert into Users_262 (users_id, banned, role) values ('4', 'No', 'client');
insert into Users_262 (users_id, banned, role) values ('10', 'No', 'driver');
insert into Users_262 (users_id, banned, role) values ('11', 'No', 'driver');
insert into Users_262 (users_id, banned, role) values ('12', 'No', 'driver');
insert into Users_262 (users_id, banned, role) values ('13', 'No', 'driver');

SELECT * FROM Trips_262;
SELECT * FROM Users_262;

-- 1. Get all the clients who are not banned from the users table
SELECT Users_Id FROM Users_262 WHERE Banned = 'Yes';

SELECT *
FROM Trips_262
WHERE Client_Id NOT IN (SELECT Users_Id FROM Users_262 WHERE Banned = 'Yes')
;


-- 2. Get all the Drivers who are not banned from the users table
SELECT *
FROM Trips_262
WHERE Client_Id NOT IN (SELECT Users_Id FROM Users_262 WHERE Banned = 'Yes')
AND Driver_Id NOT IN (SELECT Users_Id FROM Users_262 WHERE Banned = 'Yes');

-- 3. Fetch all records each day between "2013-10-01" and "2013-10-03"
SELECT *
FROM Trips_262
WHERE Client_Id NOT IN (SELECT Users_Id FROM Users_262 WHERE Banned = 'Yes')
AND Driver_Id NOT IN (SELECT Users_Id FROM Users_262 WHERE Banned = 'Yes')
AND Request_at BETWEEN "2013-10-01" AND "2013-10-03";

-- 4. Calculate the the total number of requests with unbanned users on that day

SELECT Request_at as day, COUNT(status)
FROM Trips_262
WHERE Client_Id NOT IN (SELECT Users_Id FROM Users_262 WHERE Banned = 'Yes')
AND Driver_Id NOT IN (SELECT Users_Id FROM Users_262 WHERE Banned = 'Yes')
AND Request_at BETWEEN "2013-10-01" AND "2013-10-03"
GROUP BY Request_at;

-- 5. Calculate the the number of canceled (by client or driver) requests with unbanned users
SELECT Request_at as day, COUNT(status) as total_requests
, SUM(CASE WHEN status = 'cancelled_by_driver' THEN 1
		WHEN status = 'cancelled_by_client' THEN 1
	ELSE 0 END) total_cancelled_requests
FROM Trips_262
WHERE Client_Id NOT IN (SELECT Users_Id FROM Users_262 WHERE Banned = 'Yes')
AND Driver_Id NOT IN (SELECT Users_Id FROM Users_262 WHERE Banned = 'Yes')
AND Request_at BETWEEN "2013-10-01" AND "2013-10-03"
GROUP BY Request_at;

-- 6. Use the above query to fetch the cancellation rate by divividing total_cancelled_requests by total_requests
SELECT Day, 
ROUND((total_cancelled_requests/total_requests),2) as 'Cancellation Rate'
FROM
(SELECT Request_at as day, COUNT(status) as total_requests
, SUM(CASE WHEN status = 'cancelled_by_driver' THEN 1
		WHEN status = 'cancelled_by_client' THEN 1
	ELSE 0 END) total_cancelled_requests
FROM Trips_262
WHERE Client_Id NOT IN (SELECT Users_Id FROM Users_262 WHERE Banned = 'Yes')
AND Driver_Id NOT IN (SELECT Users_Id FROM Users_262 WHERE Banned = 'Yes')
AND Request_at BETWEEN "2013-10-01" AND "2013-10-03"
GROUP BY Request_at) t;