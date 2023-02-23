DROP TABLE IF EXISTS customers;
CREATE TABLE customers(
	customer_id SERIAL PRIMARY KEY,
	first_name varchar(40),
	last_name varchar(40)
);
INSERT INTO customers(
	customer_id,
	first_name,
	last_name
)VALUES(
	100,
	'Azlyn',
	'Patterson'
);


DROP TABLE IF EXISTS theaters;
CREATE TABLE theaters(
	theaters_id SERIAL PRIMARY KEY,
	theater_names varchar(30)
);
INSERT INTO theaters(
	theaters_id,
	theater_names
)VALUES(
	1,
	'The Prado Theater'
),(
	2,
	'Bell Tower Cinema'
);


DROP TABLE IF EXISTS movies;
CREATE TABLE movies(
	movies_id SERIAL PRIMARY KEY,
	movie_title varchar(75),
	movie_genre varchar(25),
	theaters_id integer NOT NULL,
	FOREIGN KEY(theaters_id) REFERENCES theaters(theaters_id)
);
INSERT INTO movies(
	movie_title,
	movie_genre,
	theaters_id
)values(
	'Butcher Wish',
	'Horror',
	1
),(
	'Courier Of Crime',
	'Drama',
	2
);

DROP TABLE IF EXISTS tickets;
CREATE TABLE tickets(
	tickets_id SERIAL PRIMARY KEY,
	ticket_amount integer NOT NULL,
	ticket_price FLOAT,
	customer_id integer NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
INSERT INTO tickets(
	tickets_id,
	ticket_amount,
	ticket_price,
	customer_id
)values(
	1,
	2,
	12.99,
	100
)

DROP TABLE IF EXISTS concession_products;
CREATE  TABLE concession_products(
	conces_pord_id SERIAL PRIMARY KEY,
	food varchar(15),
	drinks varchar(15),
	candy varchar(15),
	theaters_id integer NOT NULL,
	FOREIGN key(theaters_id) REFERENCES theaters(theaters_id)
);
INSERT INTO concession_products(
	food,
	drinks,
	candy,
	theaters_id
)values(
	'Pretzel',
	'Sprite',
	'Sour Patch Kids',
	1
);

DROP TABLE IF EXISTS consession_purchases;
CREATE TABLE consession_purchases(
	conces_purch_id SERIAL PRIMARY KEY,
	customer_id integer NOT NULL,
	theaters_id integer NOT NULL,
	FOREIGN key(customer_id) REFERENCES customers(customer_id),
	FOREIGN key(theaters_id) REFERENCES theaters(theaters_id)
);
INSERT INTO consession_purchases(
	customer_id,
	theaters_id
)VALUES(
	100,
	1
)