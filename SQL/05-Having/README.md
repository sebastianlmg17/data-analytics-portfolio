# SQL HAVING Practice — Sakila Database

## Overview

This section contains practical SQL exercises focused on filtering aggregated results using the MySQL Sakila database.

The objective is to develop the ability to distinguish between row-level filtering with `WHERE` and group-level filtering with `HAVING`, while combining `HAVING` with `GROUP BY`, aggregate functions, JOINs, and ordering.

---

## Concepts Covered

Throughout these exercises, the following SQL concepts were practiced:

* HAVING clause
* Filtering aggregated results
* GROUP BY with HAVING
* Aggregate functions with HAVING:
  * COUNT()
  * SUM()
  * AVG()
* Combining WHERE and HAVING
* Combining JOIN operations with GROUP BY and HAVING
* Multiple conditions inside HAVING
* Ordering aggregated results
* Understanding business questions behind summarized data

---

## Learning Approach

Each exercise is based on a business scenario and increases progressively in difficulty.

The analysis process follows these steps:

1. Identify what the business wants to measure.
2. Determine the entity that should be used for grouping.
3. Choose the correct aggregation function.
4. Determine whether the condition applies to individual rows or to an aggregated group.
5. Identify whether additional tables are required.
6. Build the query and validate that the result answers the business question.

The focus is not only on learning the syntax of `HAVING`, but on understanding when an aggregated result should be filtered after grouping.

---

# Key Concepts Learned

## HAVING Clause

Used to filter groups after `GROUP BY` has been applied, normally using aggregate functions.

Example:

```sql
SELECT
    customer_id,
    COUNT(rental_id)
FROM rental
GROUP BY customer_id
HAVING COUNT(rental_id) > 35;
```

## WHERE vs HAVING

`WHERE` filters individual rows before grouping.

`HAVING` filters aggregated groups after grouping.

Example structure:

```text
WHERE
  ↓
GROUP BY
  ↓
HAVING
  ↓
ORDER BY
```

This distinction becomes especially important when a query combines row-level filters with conditions on aggregate results.

## HAVING with Aggregate Functions

The exercises use `HAVING` with functions such as:

* `COUNT()` to filter groups by number of records.
* `SUM()` to filter groups by total numeric value.
* `AVG()` to filter groups by average value.

## HAVING with JOINs

Many business questions require joining related tables before grouping and filtering the aggregated results.

Examples include:

* Customers with high total spending.
* Films with many inventory copies.
* Categories with high rental activity.
* Stores with high revenue.

---

# Skills Developed

By completing these exercises, I improved my ability to:

* Filter aggregated results using HAVING.
* Distinguish between WHERE and HAVING.
* Choose the correct aggregate function for a business question.
* Combine JOIN, GROUP BY, HAVING, and ORDER BY in the same query.
* Apply multiple conditions to aggregated groups.
* Translate business questions into analytical SQL queries.
* Validate whether the aggregation and filtering logic matches the requested metric.

---

## Exercise Progression

The exercises progress from simple aggregated filters to more complex combinations:

1. Customer spending with SUM()
2. Film inventory counts with COUNT()
3. Category catalog size with COUNT()
4. Staff payment volume with COUNT()
5. Film rating analysis with AVG()
6. Store revenue with multiple JOINs and SUM()
7. Customer spending with customer-level grouping
8. Customer rental activity with COUNT()
9. Category rental activity across multiple JOINs
10. High-value customers using WHERE plus multiple HAVING conditions

---

## Database Used

**MySQL — Sakila Sample Database**

Sakila is a relational database designed to simulate a DVD rental business environment.

It contains realistic entities such as:

* Customers
* Films
* Actors
* Categories
* Stores
* Rentals
* Payments

---

## Next Steps

After completing HAVING fundamentals, the next focus areas will be:

* More advanced filtering combinations
* Advanced JOIN and aggregation combinations
* Subqueries
* Window functions

The goal is to progress from filtering summarized data to performing deeper analytical analysis using increasingly complex SQL queries.
