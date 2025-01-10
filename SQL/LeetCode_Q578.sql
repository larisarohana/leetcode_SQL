/*578. Get Highest Answer Rate Question
Description - 
Get the highest answer rate question from a table survey_log with these columns: uid, action, question_id, answer_id, q_num, timestamp.

uid means user id; action has these kind of values: “show”, “answer”, “skip”; answer_id is not null when action column is “answer”, while is null for “show” and “skip”; q_num is the numeral order of the question in current session.

Write a sql query to identify the question which has the highest answer rate.

Example: Input:


+------+-----------+--------------+------------+-----------+------------+
| uid  | action    | question_id  | answer_id  | q_num     | timestamp  |
+------+-----------+--------------+------------+-----------+------------+
| 5    | show      | 285          | null       | 1         | 123        |
| 5    | answer    | 285          | 124124     | 1         | 124        |
| 5    | show      | 369          | null       | 2         | 125        |
| 5    | skip      | 369          | null       | 2         | 126        |
+------+-----------+--------------+------------+-----------+------------+
Output:


+-------------+
| survey_log  |
+-------------+
|    285      |
+-------------+
Explanation: question 285 has answer rate 1/1, while question 369 has 0/1 answer rate, so output 285.

Note: The highest answer rate meaning is: answer number’s ratio in show number in the same question.*/

CREATE TABLE UserActions_578 (
    uid INT,
    action VARCHAR(10),
    question_id INT,
    answer_id INT,
    q_num INT,
    timestamp INT
);

INSERT INTO UserActions_578 (uid, action, question_id, answer_id, q_num, timestamp) VALUES
(5, 'show', 285, NULL, 1, 123),
(5, 'answer', 285, 124124, 1, 124),
(5, 'show', 369, NULL, 2, 125),
(5, 'skip', 369, NULL, 2, 126),
(5, 'show', 115, NULL, 1, 123),
(5, 'answer', 115, 124124, 1, 124),
(5, 'show', 105, NULL, 1, 123),
(5, 'answer', 105, 124124, 1, 124);

SELECT question_id as survey_log  
, answer_count/show_count AS RATIO
FROM (SELECT 
question_id,
SUM(CASE WHEN action = 'answer' THEN 1 ELSE 0 END) answer_count,
SUM(CASE WHEN action = 'show' THEN 1 ELSE 0 END) show_count
FROM UserActions_578
GROUP BY question_id) t1
ORDER BY answer_count/show_count DESC
;




