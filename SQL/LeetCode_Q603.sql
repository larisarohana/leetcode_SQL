/*Q.No.- 603. Consecutive Available Seats 
Description - 
everal friends at a cinema ticket office would like to reserve consecutive available seats. Can you help to query all the consecutive available seats order by the seat_id using the following cinema table?
| seat_id | free |
|---------|------|
| 1       | 1    |
| 2       | 0    |
| 3       | 1    |
| 4       | 1    |
| 5       | 1    |
Your query should return the following result for the sample case above.
| seat_id |
|---------|
| 3       |
| 4       |
| 5       |
Note:
The seat_id is an auto increment int, and free is bool (‘1’ means free, and ‘0’ means occupied.). Consecutive available seats are more than 2(inclusive) seats consecutively available.*/

CREATE TABLE seats_603 (
    seat_id INT PRIMARY KEY,
    free INT
);


INSERT INTO seats_603 (seat_id, free) VALUES
(1, 1),
(2, 0),
(3, 1),
(4, 1),
(5, 1),
(6,0),
(7,1),
(8,1),
(9,0),
(10,1),
(11,1),
(12,0),
(13,0),
(14,0),
(15,0);

SELECT 
DISTINCT t1.seat_id 
FROM seats_603 t1
JOIN seats_603 t2
WHERE abs(t1.seat_id-t2.seat_id) = 1
AND t1.free = t2.free
AND t1.free = 1
order by t1.seat_id 
;



