/*1661. Average Time of Process per Machine
Description - 
There is a factory website that has several machines each running the same number of processes. Write an SQL query to find the average time each machine takes to complete a process.

The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.

The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.

The query result format is in the following example:


Activity table:
+------------+------------+---------------+-----------+
| machine_id | process_id | activity_type | timestamp |
+------------+------------+---------------+-----------+
| 0          | 0          | start         | 0.712     |
| 0          | 0          | end           | 1.520     |
| 0          | 1          | start         | 3.140     |
| 0          | 1          | end           | 4.120     |
| 1          | 0          | start         | 0.550     |
| 1          | 0          | end           | 1.550     |
| 1          | 1          | start         | 0.430     |
| 1          | 1          | end           | 1.420     |
| 2          | 0          | start         | 4.100     |
| 2          | 0          | end           | 4.512     |
| 2          | 1          | start         | 2.500     |
| 2          | 1          | end           | 5.000     |
+------------+------------+---------------+-----------+

Result table:
+------------+-----------------+
| machine_id | processing_time |
+------------+-----------------+
| 0          | 0.894           |
| 1          | 0.995           |
| 2          | 1.456           |
+------------+-----------------+

There are 3 machines running 2 processes each.
Machine 0's average time is ((1.520 - 0.712) + (4.120 - 3.140)) / 2 = 0.894
Machine 1's average time is ((1.550 - 0.550) + (1.420 - 0.430)) / 2 = 0.995
Machine 2's average time is ((4.512 - 4.100) + (5.000 - 2.500)) / 2 = 1.456*/

Create table If Not Exists Activity_1661 (machine_id int, process_id int, activity_type ENUM('start', 'end'), timestamp float);

Truncate table Activity_1661;
insert into Activity_1661 (machine_id, process_id, activity_type, timestamp) values ('0', '0', 'start', '0.712');
insert into Activity_1661 (machine_id, process_id, activity_type, timestamp) values ('0', '0', 'end', '1.52');
insert into Activity_1661 (machine_id, process_id, activity_type, timestamp) values ('0', '1', 'start', '3.14');
insert into Activity_1661 (machine_id, process_id, activity_type, timestamp) values ('0', '1', 'end', '4.12');
insert into Activity_1661 (machine_id, process_id, activity_type, timestamp) values ('1', '0', 'start', '0.55');
insert into Activity_1661 (machine_id, process_id, activity_type, timestamp) values ('1', '0', 'end', '1.55');
insert into Activity_1661 (machine_id, process_id, activity_type, timestamp) values ('1', '1', 'start', '0.43');
insert into Activity_1661 (machine_id, process_id, activity_type, timestamp) values ('1', '1', 'end', '1.42');
insert into Activity_1661 (machine_id, process_id, activity_type, timestamp) values ('2', '0', 'start', '4.1');
insert into Activity_1661 (machine_id, process_id, activity_type, timestamp) values ('2', '0', 'end', '4.512');
insert into Activity_1661 (machine_id, process_id, activity_type, timestamp) values ('2', '1', 'start', '2.5');
insert into Activity_1661 (machine_id, process_id, activity_type, timestamp) values ('2', '1', 'end', '5');

SELECT 
t1.machine_id
 , ROUND(AVG(t1.timestamp-t2.timestamp),3)processing_time
FROM Activity_1661 t1
, Activity_1661 t2
WHERE t1.machine_id = t2.machine_id
AND t1.process_id = t2.process_id
AND t1.activity_type != t2.activity_type
AND t1.timestamp > t2.timestamp
 GROUP BY machine_id
;