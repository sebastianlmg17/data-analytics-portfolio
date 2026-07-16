/*============================================================

Exercise 02

Title:
Film Catalog for Sales

Department:
Sales

Difficulty:
⭐ Easy

Business Request:
The Sales department needs a complete film catalog to prepare
a recommendation campaign.

Required Information:
- Film ID
- Title
- Release Year
- Rental Duration

The list must be ordered alphabetically by film title.

Skills Demonstrated:
- SELECT
- ORDER BY

Concepts Learned:
- Selecting specific columns
- Sorting query results
- Translating a business request into a SQL query

Database:
MySQL - Sakila

============================================================*/

SELECT
    film_id,
    title,
    release_year,
    rental_duration
FROM film
ORDER BY title;

/*
============================================================

Business Insight

This query provides the Sales team with an organized film
catalog, making it easier to review and prepare movie
recommendation campaigns.

============================================================
*/
