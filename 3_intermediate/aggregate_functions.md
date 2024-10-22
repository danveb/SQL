# Intermediate SQL

> Aggregate Functions
> An aggreate function performs a calculation on several values and returns a single value. This is helpful because we can `summarize` data.

> - `COUNT()`: returns the count of any `non-missing` or `not null` values
> - `AVG()`: returns the result of the average calculated
> - `SUM()`: returns the sum of all values
> - `MIN()`: returns the lowest value
> - `MAX()`: returns the highest value

> Non-numerical data
>
> - Numerical fields only: `AVG()`, `SUM()`
> - Various data types: `COUNT()`, `MIN()`, `MAX()`

> Best practice when summarizing?
> Aliasing! Using aggregate functions will require us to use an alias for column (field) name

```sql
-- Query the sum of film durations
SELECT SUM(duration) as total_duration
FROM films

-- Calculate the average duration of all films
SELECT AVG(duration) as average_duration
FROM films;

-- Find the latest release_year
SELECT MAX(release_year) as latest_year
FROM films;

-- Find the duration of the shortest film
SELECT MIN(duration) as shortest_film
FROM films;
```

==================================

> - `ROUND(number_to_round, decimal_places)`: rounds a number to a specified decimal

```sql
-- without round
SELECT AVG(budget) AS avg_budget
FROM films
WHERE release_year >= 2010

-- with round 2 decimals
SELECT ROUND(AVG(budget), 2) AS avg_budget
FROM films
WHERE release_year >= 2010

-- with round to whole number
SELECT ROUND(AVG(budget)) AS avg_budget
FROM films
WHERE release_year >= 2010

-- Calculate the sum of gross from the year 2000 or later
SELECT SUM(gross) AS total_gross
FROM films
WHERE release_year >= 2000

-- Calculate the average gross of films that start with A
SELECT AVG(gross) as avg_gross_A
FROM films
WHERE title LIKE 'A%';

-- Calculate the lowest gross film in 1994
SELECT MIN(gross) AS lowest_gross
FROM films
WHERE release_year = 1994;

-- Calculate the highest gross film released between 2000-2012
SELECT MAX(gross) as highest_gross
FROM films
WHERE release_year BETWEEN 2000 AND 2012;

-- Round the average number of facebook_likes to one decimal place
SELECT ROUND(AVG(facebook_likes), 1) as avg_facebook_likes
FROM reviews;

-- Calculate the average budget rounded to the thousands
SELECT ROUND(AVG(budget), -3) as avg_budget_thousands
FROM films;

```

==================================

> Aliasing and Arithmetic
>
> - `+`
> - `-`
> - `*`
> - `/`: SQL assumes we want an integer back, so best to add decimal places for more precision

> Aggregate functions vs. arithmetic
> Aggregate functions, like `SUM`, perform their operations on the fields `vertically`
> Arithmetic adds up records `horizontally`

> Order of Execution

```sql
-- Order of execution
FROM a table
WHERE something
SELECT something (aliases are defined here)
LIMIT the results
```

```sql
-- Calculate the percentage of people who are no longer alive
SELECT COUNT(deathdate) * 100.0 / COUNT(*) AS percentage_dead
FROM people;

-- Find the number of decades in the films table
SELECT (MAX(release_year) - MIN(release_year)) / 10.0 AS number_of_decades
FROM films;

-- Round duration_hours to two decimal places
SELECT title, ROUND((duration / 60.0),2) AS duration_hours
FROM films;

```
