--Create table--
CREATE TABLE netflix (
	show_id	VARCHAR(5),
	type VARCHAR(10),
	title VARCHAR(110),
	director VARCHAR(250),
	casts VARCHAR(800),
	country	VARCHAR(150),
	date_added	VARCHAR(50),
	release_year INT,
	rating VARCHAR(10),
	duration VARCHAR(50),
	listed_in VARCHAR(100),
	description VARCHAR(250)
);

SELECT * FROM netflix;

SELECT DISTINCT type FROM netflix;

--Business Problems--

--1. Count the number of Movies and TV shows--
SELECT type, COUNT(*) AS total_content
FROM netflix
GROUP BY type;

--2. Find the most common rating for movies and TV shows--
SELECT type, rating 
FROM (
	SELECT type, rating, COUNT(*),
	RANK()OVER(PARTITION BY type ORDER BY COUNT(*) DESC) AS ranking
	FROM netflix
	GROUP BY 1,2
) AS t1
WHERE ranking = 1;

--3. List all movies releases in a specific year (e.g. 2020)--
SELECT * FROM netflix
WHERE type = 'Movie'
	AND
 release_year = 2020;

--4. Find the top 5 countries with the most content on netflix--
SELECT UNNEST(STRING_TO_ARRAY(country, ',')) AS new_country, 
	COUNT(show_id) as total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

--5. Identify the longest movie--
SELECT title, 
SUBSTRING(duration, 1, position('m' in duration)-1)::INT duration
	FROM netflix
		WHERE type = 'Movie'
		AND
		duration IS NOT NULL
	ORDER BY 2 DESC
	LIMIT 1;

--6. Find Content added in the last 5 years--
SELECT *	
FROM netflix
	WHERE 
    TO_DATE(date_added, 'Month, DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'

--7. Find all the movies/ TV Shows by director 'Rajiv Chilaka'--
SELECT *
	FROM netflix 
	WHERE director LIKE '%Rajiv Chilaka%'

--8. Count the number of content items in each genre--
SELECT
	UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre,
	COUNT(show_id) AS total_content
	FROM netflix
	GROUP BY 1;

--9. Find each year and the average numbers of content release in India on netflix. Return top 5 year with highest avg. content release--
SELECT 
	EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) AS year,
	COUNT(*) AS yearly_content,
	ROUND(
COUNT(*)::numeric/(SELECT COUNT(*) FROM netflix WHERE country = 'India')::numeric * 100, 2) AS avg_content_per_year
	FROM netflix
	WHERE country = 'India'
	GROUP BY 1;

--10. List all the movies that are Documentaries--
SELECT * FROM netflix
WHERE 
	listed_in LIKE '%Documentaries%';

--11. Find all content without a director--
SELECT * FROM netflix
WHERE 
	director IS NULL;

--12. Find how many movies actor 'Salman Khan' appeared in last 12 years--
SELECT * FROM netflix
WHERE 
 	casts ILIKE '%Salman Khan%'
	 AND
	 release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 12;

--END OF PROJECT--




































































