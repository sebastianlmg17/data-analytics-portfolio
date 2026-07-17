/*============================================================

Exercise 04

Title:
Store Inventory Catalog

Department:
Inventory

Difficulty:
⭐⭐ Medium

Business Request:
The Inventory department needs a list of all films available
in each store.

Required Information:
- Inventory ID
- Film Title
- Store ID

Results must be ordered by store and, within each store,
alphabetically by film title.

Skills Demonstrated:
- INNER JOIN
- Multi-table relationships
- ORDER BY

Concepts Learned:
- Choosing an appropriate starting table
- Joining transactional and reference tables
- Retrieving inventory information

Database:
MySQL - Sakila

============================================================*/

SELECT
    inventory.inventory_id,
    film.title,
    store.store_id
FROM inventory
INNER JOIN film
    ON inventory.film_id = film.film_id
INNER JOIN store
    ON inventory.store_id = store.store_id
ORDER BY
    store.store_id,
    film.title;

/*
============================================================

Business Insight

This query provides the Inventory department with a complete
catalog of films available in each store, supporting stock
management and operational planning.

============================================================
*/
