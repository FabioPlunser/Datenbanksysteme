1a)
	CREATE DATABASE sheet05_company_example;

1b)
	CREATE TABLE IF NOT EXISTS employee(
		employee_id UUID NOT NULL DEFAULT gen_random_uuid(),
		firstname VARCHAR(255) NOT NULL,
		lastname VARCHAR(255) NOT NULL,
		main_location VARCHAR(255) NOT NULL,
		PRIMARY KEY(employee_id)
	);
	CREATE TABLE IF NOT EXISTS project(
		project_id UUID NOT NULL DEFAULT gen_random_uuid(),
		name VARCHAR(255) NOT NULL,
		main_location VARCHAR(255) NOT NULL,
		PRIMARY KEY(project_id)
	);
	CREATE TABLE IF NOT EXISTS working(
		employee_id UUID NOT NULL,
		project_id UUID NOT NULL,
		start_date DATE DEFAULT now() NOT NULL,
		PRIMARY KEY(employee_id, project_id),
		FOREIGN KEY(employee_id) REFERENCES employee(employee_id),
		FOREIGN KEY(project_id) REFERENCES project(project_id)
	);

1c)
	INSERT INTO employee(firstname, lastname, main_location) VALUES
		   ('Erika', 'Mustermann', 'UIBK'),
		   ('Moritz', 'Mustermann', 'Uni Salzburg'),
		   ('Peter', 'Mustermann', 'New York'),
		   ('Max', 'Mustermann', 'Uni Graz');
	INSERT INTO project(name, main_location) VALUES
		   ('project2', 'UIBK'),
		   ('project Mayhem', 'New York'),
		   ('project5', 'TU Wien');

1d)
	INSERT INTO working SELECT 
		employee.employee_id as employee_id,
		project.project_id as project_id,
		'11.11.2021' as start_date
	FROM (
			(
				SELECT employee.employee_id
				FROM employee
				WHERE
					employee.firstname = 'Erika' AND 
					employee.lastname = 'Mustermann'
				) as employee CROSS JOIN
			(
				SELECT project_id
				FROM project
				WHERE project.name = 'project2'
			) as project
		);

2a)
	SELECT DISTINCT
		film.title AS title, film.length AS length
	FROM film
	JOIN film_actor
		ON film.film_id = film_actor.film_id
	JOIN actor
		ON actor.actor_id = film_actor.actor_id
	WHERE
		actor.first_name ILIKE 'Audrey'
	
2b)
	SELECT 
		film.title AS title,
		category.name AS category,
	FROM category
	JOIN film_category
		 ON category.category_id = film_category.category_id
	JOIN film
		 ON film_category.film_id = film.film_id
	WHERE
		(
			category.name ILIKE 'Documentary' OR
			category.name ILIKE 'Comedy'
		) AND 
		film.replacement_cost < 10

2c)
	SELECT
		CONCAT(customer.first_name, ' ', customer.last_name) as name
	FROM customer 
		JOIN address ON customer.address_id = address.address_id
		JOIN city ON address.city_id = city.city_id
		JOIN country ON city.country_id = country.country_id;
	WHERE
		country.country ILIKE '%land'

2d)
	SELECT
		customer.last_name AS last_name,
		rental.return_date AS return_date
	FROM rental
	JOIN customer
		 ON customer.customer_id = rental.customer_id
	JOIN staff
		 ON staff.staff_id = rental.staff_id
	WHERE
		staff.last_name ILIKE 'Stephens' AND
		rental.rental_date = '2005-05-24'

2e)
TODO:
	SELECT DISTINCT
		customer.email AS email
	FROM customer
	JOIN rental
		 ON rental.customer_id = customer.customer_id
	JOIN staff
		 ON staff.staff_id = rental.staff_id

2f)
	SELECT
		CONCAT(customer.first_name, ' ', customer.last_name) as customer_name,
		CONCAT(staff.first_name, ' ', staff.last_name) as staff_name,
		CNT(payment.amount) AS total_amount
	FROM payment
	JOIN customer
		 ON customer.customer_id = payment.customer_id
	JOIN staff
		 ON staff.staff_id = payment.staff_id
	ORDER BY total_amount
	GROUP BY staff.staff_id, customer.customer_id
	LIMIT 1

2g)
	SELECT
		COUNT(DISTINCT film.rating) as different_ratings
	FROM film
	WHERE 'Deleted Scenes' IN film.special_features
	GROUP BY film.film_id

2h)
	SELECT
		COUNT(inner.film_id) as returned_friday_13
	FROM (
		SELECT
			EXTRACT(DAY FROM rental.return_date) as daz,
			EXTRACT(DOW FROM rental.return_date) as dow,
			film.film_id
		FROM rental
		JOIN inventory
			 ON rental.inventory_id = inventory.inventory_id
		JOIN film
			 ON inventory.film_id = film.film_id
		) as inner
	WHERE inner.daz = 13 AND inner.dow = 5
	GROUP BY film.film_id

2i)
	SELECT
		language.name AS name
	FROM language
	LEFT JOIN film
		 ON film.language_id = language.language_id
	WHERE film.film_id IS NULL
	ORDER BY language.name
