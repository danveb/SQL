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