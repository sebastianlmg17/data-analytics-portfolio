/*============================================================

Exercise 04

Title:
Customers with Last Name Starting with "S"

Department:
Customer Service

Difficulty:
⭐ Easy

Business Request:
The Customer Service department is investigating several
cases involving customers whose last name starts with the
letter "S".

Required Information:
- Customer ID
- First Name
- Last Name
- Email

Only customers whose last name starts with "S" should be included.

The list must be ordered alphabetically by last name and,
when two customers share the same last name, by first name.

Skills Demonstrated:
- SELECT
- WHERE
- LIKE
- ORDER BY

Concepts Learned:
- Pattern matching with LIKE
- Filtering text values
- Sorting by multiple columns

Database:
MySQL - Sakila

============================================================*/

SELECT
    customer_id,
    first_name,
    last_name,
    email
FROM customer
WHERE last_name LIKE 'S%'
ORDER BY last_name, first_name;

/*
============================================================

Business Insight

This query allows the Customer Service department to quickly
identify customers whose last names start with "S", making
it easier to investigate reported cases.

============================================================
*/
