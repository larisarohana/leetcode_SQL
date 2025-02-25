/*Q.No.- 1527. Patients With a Condition
Description - 
Write an SQL query to report the patient_id, patient_name all conditions of patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix

Return the result table in any order.

The query result format is in the following example.


Patients
+------------+--------------+--------------+
| patient_id | patient_name | conditions   |
+------------+--------------+--------------+
| 1          | Daniel       | YFEV COUGH   |
| 2          | Alice        |              |
| 3          | Bob          | DIAB100 MYOP |
| 4          | George       | ACNE DIAB100 |
| 5          | Alain        | DIAB201      |
+------------+--------------+--------------+

Result table:
+------------+--------------+--------------+
| patient_id | patient_name | conditions   |
+------------+--------------+--------------+
| 3          | Bob          | DIAB100 MYOP |
| 4          | George       | ACNE DIAB100 |
+------------+--------------+--------------+
Bob and George both have a condition that starts with DIAB1.*/

Create table If Not Exists Patients_1527 (patient_id int, patient_name varchar(30), conditions varchar(100));

Truncate table Patients_1527;

insert into Patients_1527 (patient_id, patient_name, conditions) values ('1', 'Daniel', 'YFEV COUGH');
insert into Patients_1527 (patient_id, patient_name, conditions) values ('2', 'Alice', '');
insert into Patients_1527 (patient_id, patient_name, conditions) values ('3', 'Bob', 'DIAB100 MYOP');
insert into Patients_1527 (patient_id, patient_name, conditions) values ('4', 'George', 'ACNE DIAB100');
insert into Patients_1527 (patient_id, patient_name, conditions) values ('5', 'Alain', 'DIAB201');

SELECT * FROM Patients_1527 WHERE conditions LIKE ('%DIAB1%');

SELECT * FROM PATIENTS WHERE
CONDITIONS LIKE '% DIAB1%' OR
CONDITIONS LIKE 'DIAB1%';
