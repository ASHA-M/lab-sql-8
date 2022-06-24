USE sakila;

#Write a query to display for each store its store ID, city, and country.

SELECT store_id, city, country
FROM store AS st #1
INNER JOIN address AS ad # 2
ON st.address_id = ad.address_id # 1=2
INNER JOIN city AS ci # 3
ON ad.city_id = ci.city_id # 2=3
INNER JOIN country AS co # 4
ON co.country_id = ci.country_id; # 3=4


#Write a query to display how much business, in dollars, each store brought in.

SELECT sta.store_id, sum(amount)  #each time you write sum/count of second column and no function for first column use GROUP BY
FROM payment AS pay
INNER JOIN staff AS sta
ON pay.staff_id = sta.staff_id
INNER JOIN store AS sto
ON sta.store_id = sto.store_id
GROUP BY sta.store_id;


#Which film categories are longest?

SELECT name, AVG(length)
FROM film AS fi	
LEFT JOIN film_category AS ficat
ON fi.film_id = ficat.film_id
LEFT JOIN category AS cat
ON ficat.category_id = cat.category_id
GROUP BY name
ORDER BY AVG(length) DESC;

#Display the most frequently rented movies in descending order.

SELECT title, count(*)
FROM  film AS fi
INNER JOIN inventory AS inv
ON fi.film_id = inv.film_id
INNER JOIN rental AS ren
ON inv.inventory_id = ren.inventory_id
GROUP BY title
ORDER BY count(*) DESC;

#List the top five genres in gross revenue in descending order.

SELECT name, sum(amount)
FROM  category AS cat
INNER JOIN film_category AS ficat
on ficat.category_id = cat.category_id
INNER jOIN film AS fi
ON fi.film_id = ficat.film_id
INNER JOIN inventory AS inv
ON fi.film_id = inv.film_id
INNER JOIN rental AS ren
ON inv.inventory_id = ren.inventory_id
INNER JOIN payment AS pay
ON pay.rental_id = ren.rental_id
GROUP BY name
ORDER BY sum(amount) DESC
limit 5;


#Is "Academy Dinosaur" available for rent from Store 1?
SELECT st.store_id, title
FROM store AS st
inner join inventory AS inv
on st.store_id = inv.store_id
inner join film AS fi
on fi.film_id = inv.film_id
where st.store_id = 1 AND title = 'ACADEMY DINOSAUR';


#Get all pairs of actors that worked together.

SELECT * FROM film_actor AS a
INNER JOIN film_actor AS b
ON (a.actor_id <> b.actor_id) AND (a.film_id = b.film_id);

