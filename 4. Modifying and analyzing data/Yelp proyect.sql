-- Part one: Profiling data

/*
Q1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000
ii. Business table = 10000 
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000

*/

SELECT COUNT(*)
FROM [TABLE]

/*
Q2. Find the total distinct records by either the foreign key or primary key for each table.
If two foreign keys are listed in the table, please specify which foreign key.

- i. Business = 10000 distinct records for primary key ‘id’ of Business table
-- ii. Hours = 1562 distinct records for foreign key ‘business_id’
-- iii. Category = 2643 distinct records for foreign key ‘business_id’
-- iv. Attribute = 1115 distinct records for foreign key ‘id’
-- v. Review = 10000 distinct records for primary key ‘id’, 9581 user_id foreign key, 8090 business_id foreign key
-- vi. Checkin = 493 distinct records for foreign key ‘buisness_id’
-- vii. Photo = 10000 distinct records for primary key ‘id’, 6493 buisness_id foreign key
-- viii. Tip = 537 distinct records for foreign key ‘user_id’, 3979 buisness_id foreign key
-- ix. User = 10000 distinct records for primary key ‘id’
-- x. Friend = 11 distinct records for foreign key ‘user_id’
-- xi. Elite_years = 2780 distinct records for foreign key ‘user id’

*/

-- Q3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

-- NO 

SELECT *
FROM user
WHERE
      id IS NULL OR
      name IS NULL OR
      review_count IS NULL OR
      yelping_since IS NULL OR
      useful IS NULL OR
      funny IS NULL OR
      cool IS NULL OR
      fans IS NULL OR
      average_stars IS NULL OR
      compliment_hot IS NULL OR
      compliment_more IS NULL OR
      compliment_profile IS NULL OR
      compliment_cute IS NULL OR
      compliment_list IS NULL OR
      compliment_note IS NULL OR
      compliment_plain IS NULL OR
      compliment_cool IS NULL OR
      compliment_funny IS NULL OR
      compliment_writer IS NULL OR
      compliment_photos IS NULL

/*
Q4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min: 1		max: 5		avg: 3.70

*/

SELECT 
    MIN(Stars),
    MAX(Stars),
    AVG(Stars
FROM Review

-- 5. List the cities with the most reviews in descending order