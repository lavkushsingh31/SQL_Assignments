-- to find duplicates
SELECT first_name, last_name, email, COUNT(*) as count_value
FROM customer
GROUP BY first_name, last_name, email
HAVING COUNT(*) > 1;


SELECT DISTINCT first_name || ' ' || last_name as fullname
FROM customer;