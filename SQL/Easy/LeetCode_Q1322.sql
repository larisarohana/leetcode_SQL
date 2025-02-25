/*1322. Ads Performance
Description - 
The query result format is in the following example:


Ads table:
+-------+---------+---------+
| ad_id | user_id | action  |
+-------+---------+---------+
| 1     | 1       | Clicked |
| 2     | 2       | Clicked |
| 3     | 3       | Viewed  |
| 5     | 5       | Ignored |
| 1     | 7       | Ignored |
| 2     | 7       | Viewed  |
| 3     | 5       | Clicked |
| 1     | 4       | Viewed  |
| 2     | 11      | Viewed  |
| 1     | 2       | Clicked |
+-------+---------+---------+
Result table:
+-------+-------+
| ad_id | ctr   |
+-------+-------+
| 1     | 66.67 |
| 3     | 50.00 |
| 2     | 33.33 |
| 5     | 0.00  |
+-------+-------+
for ad_id = 1, ctr = (2/(2+1)) * 100 = 66.67
for ad_id = 2, ctr = (1/(1+2)) * 100 = 33.33
for ad_id = 3, ctr = (1/(1+1)) * 100 = 50.00
for ad_id = 5, ctr = 0.00, Note that ad_id = 5 has no clicks or views.
Note that we don't care about Ignored Ads.
Result table is ordered by the ctr. in case of a tie we order them by ad_id*/

CREATE TABLE Ads_1322 (
    ad_id INT,
    user_id INT,
    action VARCHAR(10)
);

INSERT INTO Ads_1322 (ad_id, user_id, action) VALUES
(1, 1, 'Clicked'),
(2, 2, 'Clicked'),
(3, 3, 'Viewed'),
(5, 5, 'Ignored'),
(1, 7, 'Ignored'),
(2, 7, 'Viewed'),
(3, 5, 'Clicked'),
(1, 4, 'Viewed'),
(2, 11, 'Viewed'),
(1, 2, 'Clicked');

Select t1.ad_id,
ROUND(COALESCE((SUM(CASE WHEN t2.action = 'Clicked' THEN 1 ELSE 0 END) / SUM(CASE WHEN t2.action = 'Clicked' THEN 1
WHEN t2.action = 'Viewed' THEN 1 ELSE 0 END)*100),0.00),2) ctr
from Ads_1322 t1
LEFT JOIN Ads_1322 t2
ON (t1.ad_id = t2.ad_id)
GROUP BY t1.ad_id
ORDER BY t1.ad_id;




