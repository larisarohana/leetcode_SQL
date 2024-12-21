/*Q.No.- 1126. Active Businesses 
Write an SQL query to find all active businesses.
An active business is a business that has more than one event type with occurences greater than the average occurences of that event type among all businesses.
The query result format is in the following example:
Events table:
+-------------+------------+------------+
| business_id | event_type | occurences |
+-------------+------------+------------+
| 1           | reviews    | 7          |
| 3           | reviews    | 3          |
| 1           | ads        | 11         |
| 2           | ads        | 7          |
| 3           | ads        | 6          |
| 1           | page views | 3          |
| 2           | page views | 12         |
+-------------+------------+------------+

Result table:
+-------------+
| business_id |
+-------------+
| 1           |
+-------------+
Average for 'reviews', 'ads' and 'page views' are (7+3)/2=5, (11+7+6)/3=8, (3+12)/2=7.5 respectively.
Business with id 1 has 7 'reviews' events (more than 5) and 11 'ads' events (more than 8) so it is an active business.
*/

CREATE TABLE Events (
    business_id INT,
    event_type VARCHAR(20),
    occurences INT
);

INSERT INTO Events (business_id, event_type, occurences) VALUES
(1, 'reviews', 7),
(3, 'reviews', 3),
(1, 'ads', 11),
(2, 'ads', 7),
(3, 'ads', 6),
(1, 'page views', 3),
(2, 'page views', 12);

SELECT * FROM Events;

/*1. For each event type average number of occurences
2. get all those businesses/ event type which are greater than avg number of occurences
3. identify business_id more than 1 event type*/

SELECT event_type, ROUND(AVG(occurences),2) as avg_occurence
FROM Events
GROUP BY 1 ;

SELECT business_id
FROM (SELECT t1.business_id, t1.event_type, t1.occurences, t2.avg_occurence
FROM Events t1
LEFT JOIN
(SELECT event_type, ROUND(AVG(occurences),2) as avg_occurence
FROM Events
GROUP BY 1) t2
ON t1.event_type = t2.event_type
WHERE t1.occurences > t2.avg_occurence) main
GROUP BY business_id
HAVING COUNT(event_type)>1;
