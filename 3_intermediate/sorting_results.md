# Sorting results

> Sorting functions
>
> - `ORDER BY`: by default it sorts in ascending order; both numerically and alphabetically
> - `ORDER BY field ASC`: sorts in ascending order
> - `ORDER BY field DESC`: sorts in descending order
> - `ORDER BY field1, field2`: sorts multiple fields
> - `ORDER BY field1 ASC, field2 DESC`: sorts field1 in ascending, and field2 in descending order

```sql
-- Order of Execution
FROM a table
WHERE a field meets a condition
SELECT a field
ORDER BY a field
LIMIT 3;
```

```sql
-- Select name from people and sort alphabetically
SELECT name
FROM people
ORDER BY name;

-- Select the title and duration from longest to shortest film
SELECT title, duration
FROM films
ORDER BY duration DESC;

-- Select the release year, duration, and title sorted by release year and duration
SELECT release_year, duration, title
FROM films
ORDER BY release_year, duration;

-- Select the certification, release year, and title sorted by certification and release year
SELECT certification, release_year, title
FROM films
ORDER BY certification ASC, release_year DESC;
```

==================================

> Group By field
> generally it's used with aggregate functions to provide a summary
>
> - `GROUP BY field`

> Group by multiple fields

```sql
-- Order of Execution
FROM a table
WHERE a field meets a condition
GROUP BY a field
SELECT a field
ORDER BY a field
LIMIT 3;
```

```sql
-- Find the release_year and film_count of each year
SELECT release_year, COUNT(title) AS film_count
FROM films
GROUP BY release_year; -- always use GROUP BY with Aggregate functions

-- Find the release_year and average duration of films for each year
SELECT release_year, AVG(duration) AS avg_duration
FROM films
GROUP BY release_year;

-- Find the release_year, country, and max_budget, then group and order by release_year and country
SELECT release_year, country, MAX(budget) AS max_budget
FROM films
GROUP BY release_year, country
ORDER BY release_year, country;

-- Which release_year had the most language diversity?
-- "most language diversity" -> COUNT(DISTINCT language)
-- FROM films
-- GROUP BY release_year
-- SELECT release_year, COUNT(DISTINCT language) AS language_diversity
-- ORDER BY language_diversity in descending order
SELECT release_year, COUNT(DISTINCT language) AS language_diversity
FROM films
GROUP BY release_year
ORDER BY language_diversity DESC;
```

==================================

> Filtering Grouped Data with Aggregate functions?
> `WHERE` will not work!
>
> - `HAVING`:

```sql
SELECT release_year, COUNT(title) AS title_count
FROM films
GROUP BY release_year
HAVING COUNT(title) > 20
```

```sql
-- Order of Execution
FROM a table
WHERE a field meets a condition
GROUP BY a field
HAVING an aggregate function
SELECT a field
ORDER BY a field
LIMIT 3;
```

> `HAVING` vs. `WHERE`
>
> - `WHERE` filters individual records
> - `HAVING` filters grouped records

```sql
-- What films were released in 2000
SELECT title
FROM films
WHERE release_year = 2000;

-- In what years was the average film duration over 2 hours?
SELECT release_year
FROM films
GROUP BY release_year
HAVING AVG(duration) > 120;
```

> Practice

```sql
-- Select the country and distinct count of certification as certification_count
SELECT country, COUNT(DISTINCT certification) AS certification_count
FROM films
-- Group by country
GROUP BY country
-- Filter results to countries with more than 10 different certifications
HAVING COUNT(DISTINCT certification) > 10;

-- Select the country and average_budget from films
SELECT country, AVG(budget) AS average_budget
FROM films
-- Group by country
GROUP BY country
-- Filter to countries with an average_budget of more than one billion
HAVING AVG(budget) > 1000000000
-- Order by descending order of the aggregated budget
ORDER BY average_budget DESC;


-- Write a query that returns the average budget and gross earnings for films each year after 1990 if the average budget is greater than 60M

-- 1. select release_year for each film from films table, filter for records released after 1990, grouped by release_year
SELECT release_year
FROM films
GROUP BY release_year
HAVING release_year > 1990;

-- 2. modify query to include average budget as avg_budget and average gross as avg_gross for results so far
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year;

-- 3. modify the query so that only years with an average budget of > 60M are included
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000

-- 4. Order results from highest average gross and limit to 1
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000
-- Order the results from highest to lowest average gross and limit to one
ORDER BY AVG(gross) DESC
LIMIT 1;
```
