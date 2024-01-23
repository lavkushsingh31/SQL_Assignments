SELECT * 
FROM payment;

SELECT customer_id, COUNT(*) as count_value
FROM payment
GROUP BY customer_id
HAVING COUNT(*) > 40;

SELECT *
FROM film
WHERE length > (
	SELECT AVG(length) FROM film
);

-- Using a subquery in a join
-- Let's say we have a table called products that contains information about products, 
-- including the product_id and the price of each product. We want to find all orders that 
-- include products with a price greater than the average price of all products.

products product_id price
SELECT o.orderid, pr.product_name, pr.price
FROM orders o
INNER JOIN products pr USING product_id
WHERE price > (
	SELECT avg(price) FROM products
)

--Task 1: 
--From the dvdrental.tar menu, get the title, description, and category of the films.
--Hint: Use SQL join to join the film and category data.

SELECT f.title, f.description, ctg.name
FROM film f
INNER JOIN film_category fc USING (film_id)
INNER JOIN category ctg USING (category_id);


--Task 2:
--Get the count of the films based on their category_id.
--Hint: Use aggregation by using sub-queries.

SELECT fc.category_id, COUNT(f.film_id) AS total_films
FROM film f
INNER JOIN film_category fc USING (film_id)
GROUP BY fc.category_id
ORDER BY total_films DESC;


--Task 3:
--Get the average rental_duration of films where the film category is 3.

SELECT fc.category_id, ROUND(AVG(f.rental_duration),2) as avg_rental_duration 
FROM film f
INNER JOIN film_category fc USING (film_id)
GROUP BY fc.category_id
HAVING fc.category_id = 3; 


--Task 4:
--Get the average rent of films grouped by their rating .The output column name must be 
--‘Avg_rent_based_on_rating’ .

SELECT rating, ROUND(AVG(rental_rate),2) as Avg_rent_based_on_rating
FROM film
GROUP BY rating;


--Task 5:
--Get the titles, rating and film_id of films except PG and PG-13 ratings.
SELECT film_id, title, rating
FROM film
WHERE rating NOT IN ('PG', 'PG-13');  --583 rows

--Another way 

SELECT film_id, title, rating
FROM film
EXCEPT 
SELECT film_id, title, rating 
FROM film
WHERE rating IN ('PG', 'PG-13');  --583 rows


