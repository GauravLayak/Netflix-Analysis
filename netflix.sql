DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix (
    show_id	TEXT,
	type VARCHAR,
	title TEXT,
	director TEXT,
	casts TEXT,
	country	TEXT,
	date_added	DATE,
	release_year INT,
	rating VARCHAR,
	duration VARCHAR,
	listed_in TEXT,
	description	TEXT,
	Duration_in_Min INT,
	MonthName VARCHAR,
	MonthNo INT
);

SELECT COUNT(*) FROM netflix;
SELECT * FROM netflix;
-- DATA ANALYSIS --

-- Total Tv shows vs Movies
SELECT 
	type, 
	COUNT(*) AS count
FROM netflix
GROUP BY type;

-- Most Common Movie Rating
SELECT 
	rating, 
	COUNT(*) AS count
FROM netflix
GROUP BY rating
ORDER BY count DESC
LIMIT 5;

-- Top 5 countries producing Netflix Content
SELECT 
	country, 
	COUNT(*) AS count
FROM netflix
WHERE country <> 'Unknown'
GROUP BY country
ORDER BY count DESC
LIMIT 5;

-- Most Popular Genres
SELECT 
	listed_in, 
	COUNT(*) AS count
FROM netflix
GROUP BY listed_in
ORDER BY count DESC
LIMIT 5;

-- Trend of Movies releases over the year
SELECT 
	release_year, 
	COUNT(*) AS count
FROM netflix
WHERE release_year IS NOT NULL
GROUP BY release_year
ORDER BY release_year DESC;

-- Get the earliest & latest added Shows
-- Earliest added show: 
SELECT 
	title, 
	date_added
FROM netflix
ORDER BY date_added ASC
LIMIT 1;  

-- Latest added show
SELECT 
	title, 
	date_added
FROM netflix
WHERE date_added IS NOT NULL 
ORDER BY date_added DESC
LIMIT 1;

-- list of all Movies release in 2020
SELECT 
	title, 
	release_year
FROM netflix
WHERE release_year = 2020;

-- Top 5 most frequent directors
SELECT
	director, 
	COUNT(*) AS total_movies
FROM netflix
WHERE director IS NOT NULL AND director <> 'Unknown'
GROUP BY director
ORDER BY total_movies DESC
LIMIT 5;

-- Count of content added each year
SELECT 
	EXTRACT(YEAR FROM date_added) AS year_added, 
	COUNT(*) AS total_count
FROM netflix
WHERE date_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added DESC;

-- find movies with longest duration
SELECT 
	title, 
	duration
FROM netflix
WHERE duration LIKE '% min'
ORDER BY CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) DESC
LIMIT 5;

-- Top 5 Actors with most appearances
SELECT 
	unnest(string_to_array(casts, ', ')) AS actor, 
	COUNT(*) AS appearances
FROM netflix
WHERE casts IS NOT NULL AND casts <> 'Unknown'
GROUP BY actor
ORDER BY appearances DESC
LIMIT 5;

-- find TV shows with more than 5 seasons
SELECT 
	title, 
	duration
FROM netflix
WHERE duration LIKE '% Season%'
AND CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) > 5;

-- Find Most Common Movie Duration
SELECT 
	duration, 
	COUNT(*) AS count
FROM netflix
WHERE duration LIKE '% min'
GROUP BY duration
ORDER BY count DESC
LIMIT 2;

-- END --



























































