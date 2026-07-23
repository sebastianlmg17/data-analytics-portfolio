/*============================================================

Exercise 02

Title:
Film Cast Analysis Report

Department:
Content Management

Difficulty:
⭐⭐⭐ Medium

Business Request:

The Content Management team needs to analyze the relationship
between films and actors.

This report provides a detailed view of the actors associated
with each film, helping the company organize and analyze its
content catalog.

Required Information:

- Film Title
- Actor First Name
- Actor Last Name

Results must be ordered by:
- Film Title
- Actor Last Name

Skills Demonstrated:

- INNER JOIN
- Many-to-Many Relationships
- Bridge Tables
- Primary Key and Foreign Key relationships
- ORDER BY with multiple columns

Concepts Learned:

- Understanding many-to-many relationships
- Using intermediate tables to connect entities
- Following relationships through foreign keys
- Combining information from multiple related tables

Database:

MySQL - Sakila

============================================================*/


SELECT
    film.title,
    actor.first_name,
    actor.last_name
FROM film
INNER JOIN film_actor
    ON film.film_id = film_actor.film_id
INNER JOIN actor
    ON film_actor.actor_id = actor.actor_id
ORDER BY
    film.title,
    actor.last_name;


/*
============================================================

Business Insight

This query provides the Content Management team with a detailed
view of the relationship between films and actors.

By connecting the film catalog with actor information through
the bridge table, the company can better organize content data
and support future analysis based on cast information.

============================================================*/
