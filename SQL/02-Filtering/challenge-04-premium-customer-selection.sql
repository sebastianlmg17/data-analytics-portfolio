/*============================================================

Challenge 04

Title:
Premium Customer Selection

Department:
Marketing

Difficulty:
⭐⭐⭐⭐ Advanced

Business Request:
The Marketing Director is preparing an exclusive campaign
targeting a very specific group of customers.

Required Information:
- Customer ID
- First Name
- Last Name
- Email
- Active Status

Requirements:
- Only active customers.
- Last name must start with "A" or "B".
- Results must be ordered alphabetically by last name and,
  when two customers share the same last name, by first name.

Skills Demonstrated:
- SELECT
- WHERE
- AND
- OR
- LIKE
- ORDER BY

Concepts Learned:
- Combining logical operators
- Grouping conditions with parentheses
- Customer segmentation
- Writing readable SQL queries

Database:
MySQL - Sakila

============================================================*/

SELECT
    customer_id,
    first_name,
    last_name,
    email,
    active
FROM customer
WHERE active = 1
  AND (
        last_name LIKE 'A%'
        OR last_name LIKE 'B%'
      )
ORDER BY last_name, first_name;

/*
============================================================

Business Insight

This query creates a highly targeted customer segment for
a marketing campaign by combining multiple business rules
while ensuring only eligible customers are included.

============================================================
*/
