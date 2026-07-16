/*============================================================

Challenge 01

Title:
Customer Segmentation for a Marketing Campaign

Department:
Marketing

Difficulty:
⭐⭐⭐ Intermediate

Business Request:
The Marketing department is preparing an exclusive campaign
targeting a very specific customer segment.

Required Information:
- Customer ID
- First Name
- Last Name
- Email
- Active Status

Requirements:
- Only active customers.
- Last name must start with the letter "M".
- Results must be ordered alphabetically by last name and,
  when two customers share the same last name, by first name.

Skills Demonstrated:
- SELECT
- WHERE
- AND
- LIKE
- ORDER BY

Concepts Learned:
- Combining multiple filtering conditions
- Customer segmentation
- Translating business rules into SQL queries

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
  AND last_name LIKE 'M%'
ORDER BY last_name, first_name;

/*
============================================================

Business Insight

This query creates a targeted customer segment that can be
used for personalized marketing campaigns, helping improve
engagement while ensuring only eligible customers are included.

============================================================
*/
