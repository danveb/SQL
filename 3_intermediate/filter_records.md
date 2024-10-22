# Intermediate SQL

> Filtering Records:
>
> - `COUNT()`: counts the number of records with a value in a field; it includes duplicates
> - `DISTINCT`: removes duplicates to return only unique values
> - `LIMIT`: limits how many results we return

```sql
-- Count with alias
SELECT COUNT(birthdate) AS count_birthdates
FROM people;

-- Count with multiple fields
SELECT COUNT(name) AS count_names, COUNT(birthdate) AS count_birthdates
FROM people;

-- Count with * (all fields)
SELECT COUNT(*)
FROM people;

-- Distinct
SELECT DISTINCT language
FROM films;

-- Use COUNT() with DISTINCT
SELECT COUNT(DISTINCT birthdate) AS count_distinct_birthdates
FROM people;

-- Count the distinct countries from the films table
SELECT COUNT(DISTINCT country) as count_distinct_countries
FROM films;
```

> Order of Execution
> SQL is not processed in its written order; it's beneficial to know for debugging and aliasing

```sql
-- Order of execution
FROM a table
WHERE something
SELECT something
LIMIT the results
```

> Debugging SQL code
> We get helpful messages from SQL when we have issues with misspelling, incorrect capitalization or incorrect or missing punctuation.
>
> - comma error: triggers `syntax error`
> - keyword error: triggers `syntax error`

```sql
-- Error when creating a table... how do we query?
-- `release year` instead of release_year
SELECT title, "release year", country
FROM films
LIMIT 3;
```

==================================

> Filtering Numbers:
>
> - `WHERE`: filtering clause

> Comparison Operators

```sql
-- WHERE with comparison operators
SELECT title
FROM films
WHERE release_year > 1960;
WHERE release_year < 1960;
WHERE release_year >= 1960;
WHERE release_year = 1960;

-- WHERE with NOT EQUAL TO operator
-- From films table select a title where release year IS NOT EQUAL TO 1960
SELECT title
FROM films
WHERE release_year <> 1960;

```

> Order of Execution
> SQL is not processed in its written order; it's beneficial to know for debugging and aliasing

```sql
-- Order of execution
FROM a table
WHERE comparison operator
SELECT item
LIMIT the results;
```

```sql
-- Practice queries
-- Select film_id and imdb_score with an imdb_score over 7.0
SELECT film_id, imdb_score
FROM reviews
WHERE imdb_score > 7.0;

-- Select film_id and facebook_likes for ten records with less than 1000 likes
SELECT film_id, facebook_likes
FROM reviews
WHERE facebook_likes < 1000
LIMIT 10;

-- Count the records with at least 100,000 votes
SELECT COUNT(num_votes) as films_over_100K_votes
FROM reviews
WHERE num_votes >= 100000;

-- Count the Spanish-language films
SELECT COUNT(language) AS count_spanish
FROM films
WHERE language = 'Spanish';

```

==================================

> Multiple Criteria
>
> - `OR`: need to satisfy at least 1 condition
> - `AND`: need to satisfy ALL criteria
> - `BETWEEN`: need to satisfy between 2 conditions

```sql
-- Filter films released in 1994 or 1995, and certified PG or R
SELECT *
FROM films
WHERE (release_year = 1994 OR release_year = 1995)
AND (certified = "PG" OR certified = "R");

-- Filter films released between 1994 and 2000
SELECT *
FROM films
WHERE release_year BETWEEN 1994 AND 2000;

-- Select the title and release_year for all German-language films released before 2000
SELECT title, release_year
FROM films
WHERE language = 'German'
AND release_year < 2000;

SELECT title, release_year
FROM films
WHERE (release_year = 1990 OR release_year = 1999)
-- Filter films with language English or Spanish
	AND (language = 'English' OR language = 'Spanish')
-- Filter films with more than $2,000,000 gross
	AND gross > 2000000;

SELECT title, release_year
FROM films
-- Filter films released between 1990 and 2000
WHERE release_year BETWEEN 1990 AND 2000
-- Narrow down your query to films with budgets > $100 million
	AND budget > 100000000;
-- Restrict the query to only Spanish-language films
AND language = 'Spanish';
-- Amend the query to include Spanish or French-language films
		AND (language = 'Spanish' OR language = 'French');
```

==================================

> Filtering Text
>
> - `LIKE`: searches a record that matches a pattern; uses `%` to match zero, one or many characters
> - `NOT LIKE`: searches a record that doesn't match a pattern
> - `IN`: allows us to specify multiple values making it easier and quicker to set numerous `OR` operations

```sql
-- match many characters
SELECT *
FROM people
WHERE name LIKE 'Ade%'; -- matches to "ADEL, ADELAIDE, etc.

-- match a single character
SELECT *
FROM people
WHERE name LIKE 'EV_'; -- matches to "EVE"

-- NOT LIKE
SELECT name
FROM people
WHERE name NOT LIKE 'A.%';

-- Wildcard position
SELECT name
FROM people
WHERE name LIKE '%r'; -- A.J. Langer, Aaron Schneider

-- IN
SELECT title
FROM films
WHERE release_year IN(1920, 1925, 1930);

-- Select the names that start with B
SELECT name
FROM people
WHERE name LIKE 'B%';

SELECT name
FROM people
-- Select the names that have r as the second letter
WHERE name LIKE '_r%';

SELECT name
FROM people
-- Select the names that have r as the second letter
WHERE name LIKE '_r%';

-- Find the title and release_year for all films over two hours in length released in 1990 and 2000
SELECT title, release_year
FROM films
WHERE release_year IN(1990, 2000)
AND duration > 120;

-- Find the title and language of all films in English, Spanish, and French
SELECT title, language
FROM films
WHERE language IN('English', 'Spanish', 'French');

-- Find the title, certification, and language all films certified NC-17 or R that are in English, Italian, or Greek
SELECT title, certification, language
FROM films
WHERE (certification = 'NC-17' OR certification = 'R')
AND language IN('English', 'Italian', 'Greek');

-- Count the unique titles
SELECT COUNT(DISTINCT title) AS nineties_english_films_for_teens
FROM films
-- Filter to release_years to between 1990 and 1999
WHERE release_year BETWEEN 1990 AND 1999
-- Filter to English-language films
	AND language = 'English'
-- Narrow it down to G, PG, and PG-13 certifications
	AND certification IN('G', 'PG', 'PG-13');

```

==================================

> Missing values
>
> - `COUNT(field name)` includes only non-missing values
> - `COUNT(\*) includes missing values
> - `Null` is a missing value, which stems from human error, information not available or just an unknown

> How to use `NULL` in SQL

```sql
-- IS NULL
SELECT name
FROM people
WHERE birthdate IS NULL;

-- IS NOT NULL
SELECT COUNT(name) AS count_birthdates
FROM people
WHERE brithdate IS NOT NULL;
```

> Is there any difference when using `COUNT()` vs. `IS NOT NULL`?
> There's no difference...

> Recap
> `NULL` values are missing values, and they're very common in data
> Use `IS NULL` or `IS NOT NULL` to:
>
> - identify missing values
> - select missing values
> - exclude missing values

```sql
-- List all film titles with missing budgets
SELECT title as no_budget_info
FROM films
WHERE budget IS NULL;

-- Count the number of films we have language data for
SELECT COUNT(language) as count_language_known
FROM films
WHERE language IS NOT NULL;

```
