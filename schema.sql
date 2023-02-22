/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
	id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
	name varchar(100) NOT NULL,
	date_of_birth date NOT NULL,
	escape_attempts INT NOT NULL,
	neutered boolean NOT NULL,
	weight_kg decimal NOT NULL,
	species varchar(50) NOT NULL,
	PRIMARY KEY (id)
);

create table owners (
	owners_id INT primary key generated always as identity,
	full_name varchar(100) ,
	age INT
);
