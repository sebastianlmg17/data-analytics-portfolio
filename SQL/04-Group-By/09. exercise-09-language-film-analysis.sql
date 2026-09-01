# Language Film Analysis Report

## Objective

Calculate the total number of films available in each language.

## Query

```sql
SELECT
    language.language_id,
    language.name,
    COUNT(film.film_id) AS total_films
FROM language

INNER JOIN film
    ON language.language_id = film.language_id

GROUP BY
    language.language_id,
    language.name

ORDER BY total_films DESC;
```

## Concepts

* INNER JOIN
* GROUP BY
* COUNT()
* ORDER BY

## Business Insight

This report helps the Content Management team understand how films are distributed across different languages, supporting catalog planning and localization strategies.

## Skills Demonstrated

* Grouping categorical data
* Counting related records
* Using GROUP BY with COUNT()
* Analyzing content distribution
