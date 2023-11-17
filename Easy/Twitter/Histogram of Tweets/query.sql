-- This line is selecting two columns to be returned in the final result, i'm renaming tweet_count to represent the number of tweets a user has made.
-- Count(user_id) is the number of users that have made that many tweets, and its renamed to user_numb
SELECT tweet_count AS tweet_bucket, COUNT(user_id) AS users_num

--Beggining of a Subquery, the result will be used as the data source for the outer query.
FROM (
    
    --We're selecting the user_id and the count of tweet_id for each user, it represents the number of tweets each user has made.
    SELECT user_id, COUNT(tweet_id) AS tweet_count
    
    --This specifies that we're querying data from the tweets table
    FROM tweets
    
    --This line filters the tweets, only selecting those where the year of tweet_data is 2022
    WHERE EXTRACT(YEAR FROM tweet_date) = 2022
    
    --This groups the selected data by user_id, which means that the count of tweet_id will be calculated for each user separately
    GROUP BY user_id -- Closing the subquery and giving it a alias
) AS user_tweets

-- This groups the result of the subquery by tweet_count, which means that the count of user_id will be calculated for each group of users who made the same number of tweets
GROUP BY tweet_count

-- This group the final result by tweet_count, which means the output will be sorted by the number of tweets a user has made
ORDER BY tweet_count;