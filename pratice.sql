-- Find which staff handled the most payment not highest amount
-- SELECT staff-id, COUNT(amount)
-- FROM payment
-- GROUP BY staff-id
-- ORDER BY COUNT(amount) DESC

-- Find the average replacement cost of each rating
-- SELECT rating, ROUND(AVG(replacement_cost),3)
-- FROM film
-- GROUP BY rating


-- Find the top 5 customers id and the total amount the spent
-- SELECT customer_id, SUM(amount)
-- FROM payment
-- GROUP BY customer_id
-- ORDER BY SUM(amount) DESC
-- LIMIT 5