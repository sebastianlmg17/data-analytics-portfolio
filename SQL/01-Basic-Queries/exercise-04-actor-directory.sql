/*============================================================

Exercise 04

Title:
Actor Directory for Inventory

Department:
Inventory

Difficulty:
⭐ Easy

Business Request:
The Inventory department is reviewing the actor catalog to
prepare promotional material.

Required Information:
- Actor ID
- First Name
- Last Name

The list must be ordered alphabetically by last name and,
when two actors share the same last name, by first name.

Skills Demonstrated:
- SELECT
- ORDER BY

Concepts Learned:
- Selecting business-relevant columns
- Sorting by multiple columns
- Translating business requirements into SQL queries

Database:
MySQL - Sakila

============================================================*/

SELECT
    actor_id,
    first_name,
    last_name
FROM actor
ORDER BY last_name, first_name;

/*
============================================================

Business Insight

This query provides an organized actor directory that helps
the Inventory department review and manage promotional content.

============================================================
*/
