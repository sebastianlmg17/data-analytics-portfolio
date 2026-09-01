# Films With Multiple Inventory Copies

## Objective

Identify films that have more than six inventory copies available across the stores.

## Query

```sql
SELECT 
    film.title,
    COUNT(inventory.inventory_id)
FROM film
INNER JOIN inventory
    ON film.film_id = inventory.film_id
GROUP BY film.title
HAVING COUNT(inventory.inventory_id) > 6
ORDER BY COUNT(inventory.inventory_id) DESC;
```

## Concepts

* HAVING clause
* COUNT()
* GROUP BY
* INNER JOIN
* ORDER BY

## Business Insight

This report helps identify films with a high number of physical inventory copies, supporting inventory and distribution decisions.

## Skills Demonstrated

* Filtering groups based on record counts
* Counting inventory records per film
* Combining JOIN operations with aggregation
* Ordering aggregated results
