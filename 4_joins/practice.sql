-- https://datalemur.com/questions/completed-trades

-- Write a query to retrieve TOP 3 cities with highest
-- number of completed trade orders
-- output city name and number of completed trade orders

-- FROM trades TABLE 
-- JOIN users 
-- ON trades.user_id = users.user_id 
-- SELECT users.city AS city, COUNT(trades.status) AS trade_orders
-- WHERE status = 'Completed'
-- GROUP BY users.city 
-- ORDER BY MAX(trades.quantity) DESC
-- LIMIT only 3 results

SELECT users.city AS city, COUNT(trades.status) AS trade_orders 
FROM trades
JOIN users 
ON trades.user_id = users.user_id 
WHERE status = 'Completed' 
GROUP BY users.city 
ORDER BY MAX(trades.quantity) DESC
LIMIT 3; 

-- Exercise 2: list all books and their authors 
-- Show name of each author together with title of the book they wrote and the year which that book was published 

-- FROM books TABLE 
-- INNER JOIN author 
-- ON books.author_id = author.id
-- SELECT author.name, book.title, book.publish_year 

SELECT author.name, book.title, book.publish_year 
FROM books 
INNER JOIN author 
ON books.author_id = author.id 

-- Exercise 3: list authors and books published after 2005 
-- show the name of each author together with title of the book they wrote and the year in which the book was published. Show only books published after 2005 

-- FROM author TABLE  
-- INNER JOIN books TABLE
-- ON authors.id = books.author_id
-- SELECT author.name, book.title, book.publish_year 
-- WHERE publish_year = 2005; 

SELECT author.name, book.title, book.publish_year 
FROM author 
INNER JOIN book 
ON author.id = book.author_id 
WHERE publish_year = 2005; 