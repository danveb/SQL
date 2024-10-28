# Joining Data with SQL 

-- > Ex. Schema 
-- TABLE presidents
-- country - VARCHAR
-- continent - VARCHAR
-- president - VARCHAR 

-- TABLE prime_ministers
-- country - VARCHAR
-- continent - VARCHAR 
-- prime_minister - VARCHAR 

-- TABLE prime_minister_terms
-- prim_minister VARCHAR
-- pm_start YEAR 

-- TABLE monarchs 
-- country - VARCHAR
-- continent - VARCHAR 

-- TABLE states 
-- country - VARCHAR 
-- indep_year YEAR 

> In SQL `INNER JOIN` and `LEFT JOIN` make up the two most common joins. 
> `id` field is always the key
> A `key` is a field that uniquely identifies each record in the table

> `INNER JOIN`: looks for records in both tables which match on a given field`

```sql
-- INNER JOIN of presidents and prime_ministers, joining on country
-- Order of execution... 
FROM presidents 
INNER JOIN prime_ministers 
ON presidents.country = prime_ministers.country;
SELECT prime_ministers.country, prime_ministers.continent, prime_minister, president 

-- INNER JOIN with Alias for less code 
FROM presidents AS p1 
INNER JOIN prime_ministers AS p2 
ON p1.country = p2.country; 
SELECT p2.country, p2.continent, prime_minister, president 

-- INNER JOIN with Alias + USING shortcut 
FROM presidents AS p1 
INNER JOIN prime_ministers AS p2 
USING(country); 
SELECT p2.country, p2.continent, prime_minister, president 
```

> Practice 
```sql 
-- Select name fields (with alias) and region 
SELECT cities.name AS city, countries.name AS country, countries.region
FROM cities
-- Inner join to countries
INNER JOIN countries 
-- Match on country codes
ON cities.country_code = countries.code;

-- Select fields with aliases
SELECT c.code AS country_code, c.name, e.year, e.inflation_rate
FROM countries AS c
-- Join to economies (alias e)
INNER JOIN economies AS e
-- Match on code field using table aliases
ON c.code = e.code; 

SELECT c.name AS country, l.name AS language, official
FROM countries AS c
INNER JOIN languages AS l
-- Match using the code column
USING(code);
```