# SQL Filtering Practice — Sakila Database

## Overview

This section contains practical SQL exercises focused on filtering and retrieving specific data using the MySQL Sakila database.

The objective of these exercises is to develop the ability to extract relevant information from datasets by applying conditions, comparisons, logical operators, and sorting techniques based on real business requirements.

---

## Concepts Covered

Throughout these exercises, the following SQL concepts were practiced:

* WHERE clause
* Comparison operators
* Logical operators (`AND`, `OR`, `NOT`)
* Filtering numerical values
* Filtering text values
* LIKE operator
* Pattern matching
* Filtering dates
* ORDER BY clause
* Limiting and organizing query results

---

## Learning Approach

Each exercise is based on a business scenario.

Before writing the query, the analysis process followed these steps:

1. Identify the business requirement.
2. Determine which information needs to be retrieved.
3. Identify the conditions required to filter the data.
4. Choose the correct filtering operators.
5. Validate that the results match the requested criteria.

The focus was not only on writing conditions, but on understanding **how business questions are translated into SQL filters**.

---

# Key Concepts Learned

## WHERE Clause

Used to filter records based on specific conditions.

Example use cases:

* Retrieve customers from a specific country.
* Find films with a specific rating.
* Identify payments above a certain amount.

---

## Comparison Operators

Used to compare values and create filtering conditions.

Common operators:

* `=`
* `>`
* `<`
* `>=`
* `<=`
* `<>`

Example use cases:

* Find payments greater than a specific amount.
* Retrieve customers with a specific identifier.
* Filter films by duration.

---

## Logical Operators

Used to combine multiple conditions.

### AND

Returns records that satisfy all conditions.

Example:

```sql
WHERE rating = 'PG'
AND rental_duration > 5
```

### OR

Returns records that satisfy at least one condition.

Example:

```sql
WHERE rating = 'PG'
OR rating = 'G'
```

### NOT

Used to exclude specific conditions.

Example:

```sql
WHERE NOT rating = 'NC-17'
```

---

## LIKE Operator

Used for pattern matching in text fields.

Example use cases:

* Find customers whose names start with a specific letter.
* Search films containing certain words.
* Filter text-based information.

Examples:

```sql
WHERE first_name LIKE 'A%'
```

```sql
WHERE title LIKE '%LOVE%'
```

---

## ORDER BY

Used to organize query results.

Common use cases:

* Sort values from highest to lowest.
* Order names alphabetically.
* Prioritize business results.

Example:

```sql
ORDER BY amount DESC
```

---

# Skills Developed

By completing these exercises, I improved my ability to:

* Translate business requirements into SQL conditions.
* Extract relevant information from large datasets.
* Apply multiple filtering criteria.
* Combine logical operators effectively.
* Organize query results for analysis.
* Build queries focused on business questions.

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

After completing filtering fundamentals, the next focus areas will be:

* JOIN operations
* Aggregate functions:

  * COUNT()
  * SUM()
  * AVG()
  * MIN()
  * MAX()
* GROUP BY
* HAVING

The goal is to progress from retrieving specific records to performing deeper data analysis using SQL.
