# Actor Filmography Analysis Report

## Objective

Calculate the total number of films in which each actor has appeared.

## Query

```sql
SELECT
    actor.actor_id,
    actor.first_name,
    actor.last_name,
    COUNT(film_actor.film_id) AS total_films
FROM actor

INNER JOIN film_actor
    ON actor.actor_id = film_actor.actor_id

GROUP BY
    actor.actor_id,
    actor.first_name,
    actor.last_name

ORDER BY total_films DESC;
```

## Concepts

* INNER JOIN
* GROUP BY
* COUNT()
* ORDER BY

## Business Insight

This report helps the Casting team identify the actors with the largest filmographies within the catalog, supporting casting analysis and content management.

## Skills Demonstrated

* Working with bridge tables
* Counting many-to-many relationships
* Aggregating data using GROUP BY
* Ranking entities based on activity
