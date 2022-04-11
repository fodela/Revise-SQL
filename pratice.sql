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

-- HAVING

-- What customer_ids have 40 or more transaction payments
SELECT customer_id, COUNT(*)
FROM payment
GROUP BY customer_id
HAVING COUNT(*) >= 40
 
-- Customer_ids that have spent more than $100 with our staff_id member 2
SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 100 