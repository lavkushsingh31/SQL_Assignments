SELECT *
FROM film;

SELECT *
FROM film
WHERE rental_duration > 5;

SELECT DISTINCT rental_duration
FROM film;

SELECT *
FROM film
LIMIT 5;

SELECT DISTINCT rental_duration, avg(length) as average_length
FROM film
WHERE rental_duration > 3
GROUP BY rental_duration;


