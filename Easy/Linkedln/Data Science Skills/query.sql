-- Selecting candidate_id column to be returned in the final result.
SELECT candidate_id

--Specifing that we're querying the data from candidates table
FROM candidates

--Filtering the candidates, only selecting those who have any of the skills listed in the parentheses
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')

--This groups the selected data by candidate_id, which means that the count of unique skills will be calculated for each candidate separately
GROUP BY candidate_id

--This line is a filter that is applied after the GROUP BY, will include the candidates who have all three distinct skills
HAVING COUNT(DISTINCT skill) = 3

--Sorting the result by candidate_id in crescending order
ORDER BY candidate_id;