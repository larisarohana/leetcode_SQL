/*585. Investments in 2016
Description - 
Write a query to print the sum of all total investment values in 2016 (TIV_2016), to a scale of 2 decimal places, for all policy holders who meet the following criteria:

Have the same TIV_2015 value as one or more other policyholders.
Are not located in the same city as any other policyholder (i.e.: the (latitude, longitude) attribute pairs must be unique). Input Format: The insurance table is described as follows:

| Column Name | Type          |
|-------------|---------------|
| PID         | INTEGER(11)   |
| TIV_2015    | NUMERIC(15,2) |
| TIV_2016    | NUMERIC(15,2) |
| LAT         | NUMERIC(5,2)  |
| LON         | NUMERIC(5,2)  |
where PID is the policyholder’s policy ID, TIV_2015 is the total investment value in 2015, TIV_2016 is the total investment value in 2016, LAT is the latitude of the policy holder’s city, and LON is the longitude of the policy holder’s city.

Sample Input

| PID | TIV_2015 | TIV_2016 | LAT | LON |
|-----|----------|----------|-----|-----|
| 1   | 10       | 5        | 10  | 10  |
| 2   | 20       | 20       | 20  | 20  |
| 3   | 10       | 30       | 20  | 20  |
| 4   | 10       | 40       | 40  | 40  |
Sample Output


| TIV_2016 |
|----------|
| 45.00    |
Explanation


The first record in the table, like the last record, meets both of the two criteria.
The TIV_2015 value '10' is as the same as the third and forth record, and its location unique.

The second record does not meet any of the two criteria. Its TIV_2015 is not like any other policyholders.

And its location is the same with the third record, which makes the third record fail, too.

So, the result is the sum of TIV_2016 of the first and last record, which is 45.*/

Create Table If Not Exists Insurance_585 (pid int, tiv_2015 float, tiv_2016 float, lat float, lon float);

Truncate table Insurance_585;
insert into Insurance_585 (pid, tiv_2015, tiv_2016, lat, lon) values ('1', '10', '5', '10', '10');
insert into Insurance_585 (pid, tiv_2015, tiv_2016, lat, lon) values ('2', '20', '20', '20', '20');
insert into Insurance_585 (pid, tiv_2015, tiv_2016, lat, lon) values ('3', '10', '30', '20', '20');
insert into Insurance_585 (pid, tiv_2015, tiv_2016, lat, lon) values ('4', '10', '40', '40', '40');


SELECT ROUND(SUM(tiv_2016),2) as 
tiv_2016
FROM Insurance_585
WHERE tiv_2015 IN (SELECT tiv_2015 
					FROM Insurance_585
                    GROUP BY tiv_2015
                    HAVING count(pid)>1)
AND (lat,lon) IN ( SELECT lat,lon
					FROM Insurance_585
                    GROUP BY lat,lon
					HAVING count(concat(lat,lon))=1
					)
                    ;
                    
SELECT tiv_2015 , count(pid)
					FROM Insurance_585
                    GROUP BY tiv_2015
					HAVING count(pid)>1
                    ;
 SELECT lat,lon
					FROM Insurance_585
                    GROUP BY lat,lon
					HAVING count(concat(lat,lon))=1
                    ;                   
