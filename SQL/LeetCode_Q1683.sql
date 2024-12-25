/*1683. Invalid Tweets
Description - 
Write an SQL query to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

Return the result table in any order.

The query result format is in the following example:


Tweets table:
+----------+----------------------------------+
| tweet_id | content                          |
+----------+----------------------------------+
| 1        | Vote for Biden                   |
| 2        | Let us make America great again! |
+----------+----------------------------------+

Result table:
+----------+
| tweet_id |
+----------+
| 2        |
+----------+
Tweet 1 has length = 14. It is a valid tweet.
Tweet 2 has length = 32. It is an invalid tweet.*/

Create table If Not Exists Tweets_1683(tweet_id int, content varchar(50));

Truncate table Tweets_1683;
insert into Tweets_1683 (tweet_id, content) values ('1', 'Vote for Biden');
insert into Tweets_1683 (tweet_id, content) values ('2', 'Let us make America great again!');

SELECT tweet_id 
FROM Tweets_1683
WHERE LENGTH(content)>15;
