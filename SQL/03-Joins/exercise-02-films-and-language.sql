/*============================================================

Exercise 02

Title:
Films and Their Language

Department:
Content Management

Difficulty:
⭐ Easy

Business Request:
The Content department needs a list of all films together
with the language in which each film is available.

Required Information:
- Film ID
- Film Title
- Language

Results must be ordered alphabetically by film title.

Skills Demonstrated:
- INNER JOIN
- ORDER BY

Concepts Learned:
- Joining two related tables
- Retrieving descriptive information from a lookup table
- Understanding foreign key relationships

Database:
MySQL - Sakila

============================================================*/

SELECT
    film.film_id,
    film.title,
    language.name
FROM film
INNER JOIN language
    ON film.language_id = language.language_id
ORDER BY
    film.title;

/*
============================================================

Business Insight

This query helps the Content department identify the language
assigned to each film, making catalog management easier.

============================================================
*/
