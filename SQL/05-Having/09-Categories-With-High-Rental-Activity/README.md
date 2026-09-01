# Categories With High Rental Activity

## Objective

Identify film categories with more than 1,000 rental transactions associated with their films.

## Query

```sql
SELECT 
    category.name,
    COUNT(rental.rental_id)
FROM category
INNER JOIN film_category
    ON category.category_id = film_category.category_id
INNER JOIN inventory
    ON film_category.film_id = inventory.film_id
INNER JOIN rental
    ON inventory.inventory_id = rental.inventory_id
GROUP BY category.category_id, category.name
HAVING COUNT(rental.rental_id) > 1000
ORDER BY COUNT(rental.rental_id) DESC;
```

## Concepts

* HAVING clause
* COUNT()
* GROUP BY
* Multiple INNER JOIN operations
* ORDER BY

## Business Insight

This report identifies categories with high rental activity and helps evaluate which types of content generate the greatest customer demand.

## Skills Demonstrated

* Tracing relationships across multiple tables
* Counting rental transactions by category
* Filtering aggregated results with HAVING
* Ordering categories by rental activity
