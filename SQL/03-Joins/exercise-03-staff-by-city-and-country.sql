/*============================================================

Exercise 03

Title:
Staff by City and Country

Department:
Human Resources

Difficulty:
⭐⭐ Medium

Business Request:
The Human Resources department needs to know the city and
country where each staff member works.

Required Information:
- Staff ID
- First Name
- Last Name
- City
- Country

Results must be ordered alphabetically by country and,
within each country, by city.

Skills Demonstrated:
- INNER JOIN
- Multi-table relationships
- ORDER BY

Concepts Learned:
- Traversing multiple related tables
- Understanding hierarchical relationships
- Retrieving location information

Database:
MySQL - Sakila

============================================================*/

SELECT
    staff.staff_id,
    staff.first_name,
    staff.last_name,
    country.country,
    city.city
FROM staff
INNER JOIN address
    ON staff.address_id = address.address_id
INNER JOIN city
    ON address.city_id = city.city_id
INNER JOIN country
    ON city.country_id = country.country_id
ORDER BY
    country.country,
    city.city;

/*
============================================================

Business Insight

This query allows Human Resources to identify the work
location of each staff member, supporting regional planning
and operational reporting.

============================================================
*/
