# Categories With Large Catalogs

## Objective

Identify film categories containing more than 60 films.

## Query

```sql
SELECT 
    category.name,
    COUNT(film_category.film_id)
FROM category
INNER JOIN film_category
    ON category.category_id = film_category.category_id
GROUP BY category.category_id, category.name
HAVING COUNT(film_category.film_id) > 60
ORDER BY COUNT(film_category.film_id) DESC;
```

## Concepts

* HAVING clause
* COUNT()
* GROUP BY
* INNER JOIN
* ORDER BY

## Business Insight

This report shows which film categories have the largest catalogs, helping the business understand the breadth of its content offering.

## Skills Demonstrated

* Filtering category groups by size
* Counting films by category
* Grouping joined data
* Ordering aggregated results
