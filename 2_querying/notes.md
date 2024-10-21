# Querying

> SQL is used in organizations as a complement to other tools such as spreadsheet applications. If data can fit in a spreadsheet and doesn't have many relationships to other data, we can analyze it in a spreadsheet.

> SQL allows queries to be run to find data with complex relationships.

> Query results are called `result set`.

> Keywords: reserved words for operations in SQL
>
> - `SELECT`: indicates which fields should be selected
> - `FROM`: indicates the table in which these fields are located
> - `AS`: uses `aliasing` to rename columns when needed
> - `DISTINCT`: returns a list of `unique` values (no duplicates)
> - `LIMIT`: indicates a limited number of results per query

```sql
-- Examples
-- Select one field
SELECT first_name
FROM table_name;

-- Selecting mulitple fields
SELECT card_num, name --card_num, name fields
FROM patrons;

-- Selecting all fields
SELECT *
FROM patrons;

-- Use aliasing
SELECT name AS first_name, year_hired
FROM employees;

-- Select distinct records
SELECT DISTINCT year_hired
FROM employees;

```

> Views: a view is a virtual table that is the result of a saved SQL `SELECT` statement. This data is not generally stored in the database. Rather, it is the query code that is stored for future use.
>
> - benefit: whenever `view` is accessed, it automatically updates the query results for any updates to the database

```sql
--- Create a view
CREATE VIEW employee_hire_years AS
SELECT id, name, year_hired
FROM employees;

-- Use the view
SELECT id, name
FROM employee_hire_years;

-- Create a view:
CREATE VIEW library_authors AS
SELECT DISTINCT author AS unique_author
FROM books;

-- Select all columns from library_authors "view"
SELECT * FROM library_authors;

-- Limit results to 10
SELECT genre
FROM books
LIMIT 10;

```
