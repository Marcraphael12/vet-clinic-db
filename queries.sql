-- Queries that provide answers to the questions from all projects.

-- Find all animals whose name ends in "mon".
SELECT * from animals WHERE name like '%mon';

-- List the name of all animals born between 2016 and 2019.
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-12-31';

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

-- List name and escape attempts of animals that weight more than 10.5kg
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

--Find all animals that are neutered.
SELECT name FROM animals where neutered = true;

-- Find all animals not named Gabumon.
SELECT name FROM animals WHERE name != 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT name FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Inside a transaction update the animals table by setting the species column to unspecified
UPDATE animals 
SET species = 'unspecified';

-- roll back the change and verify that the species columns went back to the state before the transaction
SELECT name, species 
FROM animals;
ROLLBACK;

--Inside a transaction Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
UPDATE animals 
SET species = 'digimon' 
WHERE name LIKE '%mon';

--Inside a transaction Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals 
SET species = 'pokemon'
WHERE species = 'unspecified';

-- Inside a transaction delete all records in the animals table, then roll back the transaction.
DELETE 
FROM animals;
ROLLBACK;

-- Inside a transaction Delete all animals born after Jan 1st, 2022.
begin;
delete from animals where date_of_birth > '01-01-2022';

-- Create a savepoint for the transaction.
SAVEPOINT sp1;

-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;

-- Rollback to the savepoint
rollback to SP1

-- Commit transaction
commit
