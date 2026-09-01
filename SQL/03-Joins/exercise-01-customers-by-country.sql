/*============================================================

Exercise 01

Title:
Customers by Country

Department:
Marketing

Difficulty:
⭐ Easy

Business Request:
The Marketing department wants to organize customers by
country to prepare regional campaigns.

Required Information:
- Customer ID
- First Name
- Last Name
- Country

Results must be ordered alphabetically by country and,
within each country, by customer last name.

Skills Demonstrated:
- INNER JOIN
- Multi-table relationships
- ORDER BY

Concepts Learned:
- Joining multiple related tables
- Following foreign key relationships
- Retrieving business information stored across tables

Database:
MySQL - Sakila

============================================================*/

SELECT
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    country.country
FROM customer
INNER JOIN address
    ON customer.address_id = address.address_id
INNER JOIN city
    ON address.city_id = city.city_id
INNER JOIN country
    ON city.country_id = country.country_id
ORDER BY
    country.country,
    customer.last_name;

/*
============================================================

Business Insight

This query provides Marketing with a customer list organized
by country, making it easier to plan regional campaigns and
market-specific communications.

============================================================
*/
