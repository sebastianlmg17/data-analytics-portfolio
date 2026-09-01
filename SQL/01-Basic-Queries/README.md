# SQL Basic Queries Practice — Sakila Database

## Overview

This section contains practical SQL exercises focused on the fundamentals of retrieving data using the MySQL Sakila database.

The objective of these exercises is to build a strong foundation in SQL by learning how to access, select, and organize data from relational databases.

---

## Concepts Covered

Throughout these exercises, the following SQL concepts were practiced:

* SELECT statement
* Retrieving specific columns
* Selecting all columns
* Understanding table structures
* Reading database schemas
* Using aliases
* Basic result organization
* ORDER BY clause

---

## Learning Approach

Each exercise is based on a business scenario.

Before writing the query, the analysis process followed these steps:

1. Identify the information requested by the business.
2. Determine which table contains the required data.
3. Select the necessary columns.
4. Organize the results in a meaningful way.
5. Validate that the output answers the original question.

The focus was on understanding **how to retrieve the correct information from a database before applying more advanced SQL techniques**.

---

# Key Concepts Learned

## SELECT Statement

Used to retrieve information from database tables.

Example use cases:

* Retrieve customer information.
* Display film details.
* Extract specific business data.

Example:

```sql
SELECT
    first_name,
    last_name
FROM customer;
```

---

## Selecting Specific Columns

Instead of retrieving unnecessary information, SQL allows selecting only the columns required for analysis.

Example:

```sql
SELECT
    title,
    release_year,
    rating
FROM film;
```

This improves readability and focuses the analysis on relevant information.

---

## Understanding Database Tables

Before writing a query, it is important to understand:

* What information each table contains.
* Which columns are available.
* How entities are represented in the database.

This step helps create more efficient and accurate queries.

---

## ORDER BY

Used to organize query results according to business requirements.

Common use cases:

* Sort records alphabetically.
* Order numerical values.
* Prioritize relevant information.

Examples:

```sql
ORDER BY last_name ASC;
```

```sql
ORDER BY rental_date DESC;
```

---

## Aliases

Used to give temporary names to columns or tables, improving readability.

Example:

```sql
SELECT
    first_name AS customer_name
FROM customer;
```

---

# Skills Developed

By completing these exercises, I improved my ability to:

* Navigate relational database structures.
* Retrieve relevant information using SQL.
* Select appropriate columns for analysis.
* Understand table contents before querying data.
* Write clear and structured SQL queries.
* Prepare data for further analysis.

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

After completing basic SQL queries, the next focus areas will be:

* Filtering data with WHERE conditions.
* Logical operators.
* Pattern matching.
* JOIN operations.
* Aggregate functions.

The goal is to progressively move from simple data retrieval to advanced data analysis using SQL.
