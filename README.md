# Netflix Movies and TV Shows Data Analysis using SQL


## Overview
This project involves a comprehensive analysis of Netflix's movies and TV shows data using SQL. The goal is to extract valuable insights and answer various business questions based on the dataset. The following README provides a detailed account of the project's objectives, business problems, solutions, findings, and conclusions.

## Objectives

- Analyze the distribution of content types (movies vs TV shows).
- Identify the most common ratings for movies and TV shows.
- List and analyze content based on release years, countries, and durations.
- Explore and categorize content based on specific criteria and keywords.

## Dataset

The data for this project is sourced from the Kaggle dataset:

- **Dataset Link:** [Movies Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download)

## Schema

```sql
CREATE TABLE netflix (
	show_id	VARCHAR(5),
	type VARCHAR(10),
	title VARCHAR(110),
	director VARCHAR(250),
	casts VARCHAR(800),
	country	VARCHAR(150),
	date_added VARCHAR(50),
	release_year INT,
	rating VARCHAR(10),
	duration VARCHAR(50),
	listed_in VARCHAR(100),
	description VARCHAR(250)
);
```

## Business Problems and Solutions

### 1. Count the Number of Movies and TV Shows

```sql
SELECT type, COUNT(*) AS total_content
FROM netflix
GROUP BY type;
```

### 2. Find the Most Common Rating for Movies and TV Shows

```sql
SELECT type, rating 
FROM (
	SELECT type, rating, COUNT(*),
	RANK()OVER(PARTITION BY type ORDER BY COUNT(*) DESC) AS ranking
	FROM netflix
	GROUP BY 1,2
) AS t1
WHERE ranking = 1;
```

### 3. List All Movies Released in a Specific Year (e.g., 2020)

```sql
SELECT * FROM netflix
WHERE type = 'Movie'
	AND
 release_year = 2020;
```

### 4. Find the Top 5 Countries with the Most Content on Netflix

```sql
SELECT UNNEST(STRING_TO_ARRAY(country, ',')) AS new_country, 
	COUNT(show_id) as total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
```

### 5. Identify the Longest Movie

```sql
SELECT title, 
SUBSTRING(duration, 1, position('m' in duration)-1)::INT duration
	FROM netflix
		WHERE type = 'Movie'
		AND
		duration IS NOT NULL
	ORDER BY 2 DESC
	LIMIT 1;
```

### 6. Find Content Added in the Last 5 Years

```sql
SELECT *	
FROM netflix
	WHERE 
    TO_DATE(date_added, 'Month, DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'
```

### 7. Find All Movies/TV Shows by Director 'Rajiv Chilaka'

```sql
SELECT *
	FROM netflix 
	WHERE director LIKE '%Rajiv Chilaka%'
```

### 8. Count the Number of Content Items in Each Genre

```sql
SELECT
	UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre,
	COUNT(show_id) AS total_content
	FROM netflix
	GROUP BY 1;
```

### 9. Find each year and the average number of content release in India on netflix. 
return top 5 years with highest avg content release!

```sql
SELECT 
	EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) AS year,
	COUNT(*) AS yearly_content,
	ROUND(
COUNT(*)::numeric/(SELECT COUNT(*) FROM netflix WHERE country = 'India')::numeric * 100, 2) AS avg_content_per_year
	FROM netflix
	WHERE country = 'India'
	GROUP BY 1;
```

### 10. List All Movies that are Documentaries

```sql
SELECT * FROM netflix
WHERE 
	listed_in LIKE '%Documentaries%';
```

### 11. Find All Content Without a Director

```sql
SELECT * FROM netflix
WHERE 
	director IS NULL;
```

### 12. Find How Many Movies Actor 'Salman Khan' Appeared in the Last 12 Years

```sql
SELECT * FROM netflix
WHERE 
 	casts ILIKE '%Salman Khan%'
	 AND
	 release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 12;
```

## Findings and Conclusion

- **Content Distribution:** The dataset contains a diverse range of movies and TV shows with varying ratings and genres.
- **Common Ratings:** Insights into the most common ratings provide an understanding of the content's target audience.
- **Geographical Insights:** The top countries and the average content releases by India highlight regional content distribution.
- **Content Categorization:** Categorizing content based on specific keywords helps in understanding the nature of content available on Netflix.

This analysis provides a comprehensive view of Netflix's content and can help inform content strategy and decision-making.
