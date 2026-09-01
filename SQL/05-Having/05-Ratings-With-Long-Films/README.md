# Ratings With Long Average Films

## Objective

Identify film ratings whose average film length is greater than 110 minutes.

## Query

```sql
SELECT 
    film.rating,
    AVG(film.length)
FROM film
GROUP BY film.rating
HAVING AVG(film.length) > 110
ORDER BY AVG(film.length) DESC;
```

## Concepts

* HAVING clause
* AVG()
* GROUP BY
* ORDER BY

## Business Insight

This report helps compare content length across film ratings and identify ratings associated with longer average productions.

## Skills Demonstrated

* Filtering groups using AVG()
* Comparing aggregated metrics between categories
* Grouping films by rating
* Ordering aggregated results
