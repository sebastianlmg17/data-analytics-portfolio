/*============================================================

Exercise 05

Title:
Store Information for Operations

Department:
Operations

Difficulty:
⭐ Easy

Business Request:
The Operations department is reviewing store information to
verify management and location records.

Required Information:
- Store ID
- Manager Staff ID
- Address ID

The list must be ordered by Store ID.

Skills Demonstrated:
- SELECT
- ORDER BY

Concepts Learned:
- Selecting business-relevant columns
- Ordering results
- Understanding database structure

Database:
MySQL - Sakila

============================================================*/

SELECT
    store_id,
    manager_staff_id,
    address_id
FROM store
ORDER BY store_id;

/*
============================================================

Business Insight

This query provides a structured overview of each store,
helping the Operations department verify store management
and associated locations.

============================================================
*/
