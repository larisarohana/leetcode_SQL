/*1693. Daily Leads and Partners
Description - 
Write an SQL query that will, for each date_id and make_name, return the number of distinct lead_id's and distinct partner_id's.

Return the result table in any order.

The query result format is in the following example:


DailySales table:
+-----------+-----------+---------+------------+
| date_id   | make_name | lead_id | partner_id |
+-----------+-----------+---------+------------+
| 2020-12-8 | toyota    | 0       | 1          |
| 2020-12-8 | toyota    | 1       | 0          |
| 2020-12-8 | toyota    | 1       | 2          |
| 2020-12-7 | toyota    | 0       | 2          |
| 2020-12-7 | toyota    | 0       | 1          |
| 2020-12-8 | honda     | 1       | 2          |
| 2020-12-8 | honda     | 2       | 1          |
| 2020-12-7 | honda     | 0       | 1          |
| 2020-12-7 | honda     | 1       | 2          |
| 2020-12-7 | honda     | 2       | 1          |
+-----------+-----------+---------+------------+
Result table:
+-----------+-----------+--------------+-----------------+
| date_id   | make_name | unique_leads | unique_partners |
+-----------+-----------+--------------+-----------------+
| 2020-12-8 | toyota    | 2            | 3               |
| 2020-12-7 | toyota    | 1            | 2               |
| 2020-12-8 | honda     | 2            | 2               |
| 2020-12-7 | honda     | 3            | 2               |
+-----------+-----------+--------------+-----------------+
For 2020-12-8, toyota gets leads = [0, 1] and partners = [0, 1, 2] while honda gets leads = [1, 2] and partners = [1, 2].
For 2020-12-7, toyota gets leads = [0] and partners = [1, 2] while honda gets leads = [0, 1, 2] and partners = [1, 2].*/

Create table If Not Exists DailySales_1693(date_id date, make_name varchar(20), lead_id int, partner_id int);

Truncate table DailySales_1693;
insert into DailySales_1693 (date_id, make_name, lead_id, partner_id) values ('2020-12-8', 'toyota', '0', '1');
insert into DailySales_1693 (date_id, make_name, lead_id, partner_id) values ('2020-12-8', 'toyota', '1', '0');
insert into DailySales_1693 (date_id, make_name, lead_id, partner_id) values ('2020-12-8', 'toyota', '1', '2');
insert into DailySales_1693 (date_id, make_name, lead_id, partner_id) values ('2020-12-7', 'toyota', '0', '2');
insert into DailySales_1693 (date_id, make_name, lead_id, partner_id) values ('2020-12-7', 'toyota', '0', '1');
insert into DailySales_1693 (date_id, make_name, lead_id, partner_id) values ('2020-12-8', 'honda', '1', '2');
insert into DailySales_1693 (date_id, make_name, lead_id, partner_id) values ('2020-12-8', 'honda', '2', '1');
insert into DailySales_1693 (date_id, make_name, lead_id, partner_id) values ('2020-12-7', 'honda', '0', '1');
insert into DailySales_1693 (date_id, make_name, lead_id, partner_id) values ('2020-12-7', 'honda', '1', '2');
insert into DailySales_1693 (date_id, make_name, lead_id, partner_id) values ('2020-12-7', 'honda', '2', '1');

SELECT date_id
, make_name
, count(Distinct lead_id) unique_leads
, count(distinct partner_id) unique_partners
FROM DailySales_1693
GROUP BY 1,2 ;