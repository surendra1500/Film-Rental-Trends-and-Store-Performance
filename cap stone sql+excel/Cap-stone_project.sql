use mavenmovies


/*
1.1 Analyze the monthly rental trends over the available data period.*/
SELECT DATE_FORMAT(rental_date, '%Y-%b') AS rent_month, COUNT(rental_date) AS rentals
FROM rental
GROUP BY rent_month;

/*
1.2 Determine the peak rental hours in a day based on rental transactions. */
SELECT HOUR(rental_date) AS hour_rented, COUNT(rental_date) AS rentals
FROM rental
GROUP BY hour_rented
ORDER BY rentals DESC;

/*
2.1 Identify the top 10 most rented films.*/
SELECT f.title, COUNT(f.title) AS rents
FROM film f
INNER JOIN inventory i ON i.film_id = f.film_id
INNER JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY f.title
ORDER BY rents DESC
LIMIT 10;

/*
2.2 Determine which film categories have the highest number of rentals.*/
SELECT c.name AS category, COUNT(c.name) AS rents
FROM category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN inventory i ON i.film_id = fc.film_id
INNER JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY category
ORDER BY rents DESC;

/*
3.1 Identify which store generates the highest rental revenue. */
SELECT s.store_id, SUM(p.amount) AS total_revenue
FROM store s
INNER JOIN payment p ON p.staff_id = s.manager_staff_id
GROUP BY s.store_id
ORDER BY total_revenue DESC;

/*
3.2 Determine the distribution of rentals by staff members to assess performance. */
SELECT staff_id, COUNT(rental_id) AS rentals
FROM rental
GROUP BY staff_id;



