--Week 5 - Wednesday
--Questions

--1. List all customers who live in Texas (use JOINS)?
SELECT*
FROM customer;

SELECT*
FROM address;

SELECT*
FROM city

SELECT customer_id, address
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
WHERE district = 'Texas';


--2. Get all payments above $6.99 with the Customer's Full Name?
SELECT*
FROM payment;

SELECT*
FROM customer;

SELECT first_name, last_name,  SUM(amount)
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
GROUP BY first_name, last_name
HAVING SUM(amount) > 6.99
ORDER BY SUM(amount);


--3. Show all customers names who have made payments over $175(use subqueries)
SELECT*
FROM payment;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount)> 175.00
ORDER BY SUM(amount) DESC;


--4. List all customers that live in Nepal (use the city table)?
SELECT country, customer.customer_id, first_name, last_name
FROM country
INNER JOIN city
ON country.country LIKE 'Nepal'
INNER JOIN address
ON address.city_id = city.city_id
INNER JOIN customer
ON customer.address_id = address.address_id;
	
SELECT first_name, last_name, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

--5. Which staff member had the most transactions?
SELECT*
FROM staff;

SELECT*
FROM rental;

SELECT*
FROM payment;

SELECT first_name, last_name, staff.staff_id, COUNT(staff.staff_id)
FROM staff
FULL JOIN rental
ON staff.staff_id = rental.staff_id
GROUP BY staff.staff_id;

--6. How many movies of each rating are there?
SELECT*
FROM film;

SELECT rating, COUNT(rating) 
FROM film 
GROUP BY rating;

--7.Show all customers who have made a single payment above $6.99 (use Subqueries)?
SELECT first_name, last_name, COUNT(*)
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
GROUP BY first_name, last_name
HAVING COUNT(*) > 6.99
ORDER BY COUNT(*);

--8.How many free rentals did our store give away?
SELECT*
FROM payment;
SELECT customer_id,rental_id, count(amount)
FROM payment
GROUP BY customer_id,rental_id
HAVING count(amount) is NULL
ORDER BY count(amount) DESC;

