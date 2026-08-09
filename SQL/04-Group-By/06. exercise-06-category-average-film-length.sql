# Category Average Film Length Report

## Objective

Calculate the average film length for each category.

## Query

```sql
SELECT
    category.category_id,
    category.name,
    AVG(film.length) AS average_length
FROM category

INNER JOIN film_category
    ON category.category_id = film_category.category_id

INNER JOIN film
    ON film_category.film_id = film.film_id

GROUP BY
    category.category_id,
    category.name

ORDER BY average_length DESC;
```

## Concepts

* INNER JOIN
* Multiple INNER JOINs
* GROUP BY
* AVG()
* ORDER BY

## Business Insight

This report helps the Content Management team understand which film categories tend to have longer or shorter movies, supporting catalog analysis and content strategy.

## Skills Demonstrated

* Calculating average values
* Aggregating data across multiple tables
* Working with bridge tables
* Analyzing grouped business data
