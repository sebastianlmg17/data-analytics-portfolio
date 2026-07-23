# Films Without Inventory Report

## Objective

Identify films that exist in the catalog but do not have any inventory records assigned.

## Query

```sql
SELECT
    film.film_id,
    film.title,
    film.release_year,
    film.rental_duration
FROM film

LEFT JOIN inventory
    ON film.film_id = inventory.film_id

WHERE inventory.inventory_id IS NULL

ORDER BY film.title;
