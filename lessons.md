# SQL LESSONS

- We will be using Postgrel SQL

## Syntax

```

SELECT col_name_1, col_name_2, *
FROM table_name
WHERE col_name = row_value
ORDER_BY col_name_1 DESC, col_name_2
LIMIT 10
```

### SELECT & FROM

- Used to Select columns
- From a table

### SELECT DISTINCT

- Distinct answers the question how many unique values do we have in a column
- It displays values in the column without repeating value.

```
 SELECT DISTINCT(col_name)
 FROM table_name
```

### ORDER BY

- Used to sort results by a chosen column
- ORDER BY DESC sort in descending order
- We use ASC or DESC

### LIMIT

- Limits the number of output

### WHERE

- Used to filter result
  -NB: single quotes only for strings
- Uses:

  ### Derived Columns

  col_name_1 + col_name_2 AS new_col_name

  ### Comparison Operators

  - =, <, >, <=, >=

  ### Logical Operators

  - LIKE => This allows you to perform operations similar to using WHERE and =, but for cases when you might not know exactly what you are looking for.
    - LIKE is case sensitive while ILIKE is case insensitive.
  - IN => This allows you to perform operations similar to using WHERE and =, but for more than one condition.
  - NOT => This is used with IN and LIKE to select all of the rows NOT LIKE or NOT IN a certain condition.
  - AND & BETWEEN => These allow you to combine operations where all combined conditions must be true.

    - value BETWEEN low AND high
      Remember that it is low and high inclusive
    - NB: for time stamps it only covers up to the start of the day 0:00 not 24:00 so that day will be excluded if it is the high. Hence call on the next day of the high as the high . Hope this makes sense LOL. 'with love, from me to FutureMe'

    ```
      WHERE col_name BETWEEN 1 AND 20

      WHERE col_name NOT BETWEEN 1 AND 20
    ```

  - OR => This allows you to combine operations where at least one of the combined conditions must be true.

  ### RegEx

  - Mostly used with LIKE
    % => any character or any number of character
    e.g WHERE any name that start with "C"

  ```
  WHERE name LIKE 'C%'
  ```

  - Underscore is used to replace mission characters

    ```
    WHERE name LIKE D_lali.


    ```

## AGGREGATE Functions

- Only occur in SELECT or HAVING clause
- e.g
  - AVG() return average as float that we can use ROUND() on.
  - COUNT()
  - MAX()
  - MIN()
  - SUM()
- Return a single row and hence before other columns with larger number of row can be called we need the GROUP BY clause

### COUNT

- Answers how many rows are in a column or in a table
- Can be combined with DISTINCT
- It doesn't really matter which column you call it on it will be the same number of rows anyway

```
COUNT(col_name)
COUNT(DISTINCT(col_name))

```

### ROUND

ROUND(value_to_round, number_of_decimal_places)

```
ROUND(AVG(), 4)
```

### GROUP BY

Allows us to aggregate columns per some category
Thus we can get the sum, average etc of object based on their categories

- We choose a categorical column to group by.

  - Categorical columns are non-continuous (NB: they can still be numerical as in Class 1,2,3 for e.g)

- Place directly after
- Usually after a WHERE statement to enable conditional output of results. Remember code here are also executed top to down
- If we are selecting a categorical column, it must appear in the group by state. The column on which the aggregate function is perform does not appear in the group by statement
- We can group by multiple categorical columns. But note that the order in which we group by is important event though the order in which we display or select them does not.
- WHERE cannot be used on the aggregated column that is what we use HAVING for.
- ORDER BY must contain the whole aggregate statement e.g ORDER BY SUM(sales) not ORDER BY SUM(sales).

```
SELECT category_col, AGG(data_col)
FROM table
GROUP BY category_col

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
```

NB: The above reads "sum of amount per customer_id"

### DATE

is Used to convert timestamp to date

### Having

- Enables us to filter after the group by clause have been executed
- Hence it comes after the group by clause

```
-- Which customers have paid more than $100
SELECT customer_id SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100

```

## Joins

- Used to join two or more tables

### AS

Is used to create alias of tables and columns. An alias is an alternative name.

AS is executed at the very end hence cannot be used in WHERE or HAVING

```
SELECT amount AS rental_price
FROM payment AS p
```

NB: postgrel sql also allows us to give an alias without the use of AS. However the use of AS is a better pratice.

```
SELECT amount rental_price
FROM payment p

```

### FULL OUTER JOIN

- It takes the union of both tables thus it takes everything from both tables.
- Is also symmetrical

```
SELECT t1.col , t2.col
FROM table1 AS t1
FULL OUTER JOIN table2 AS t2
ON t1.col = t2.col
```

### FULL OUTER ONLY

-Can be used to return only the data in table 1 and table 2 only using WHERE

```
SELECT t1.col , t2.col
FROM table1 AS t1
FULL OUTER JOIN table2 AS t2
ON t1.col != t2.col
WHERE t1 IS null AND t2 IS null
```

### LEFT OUTER JOIN

- It return all of the first table plus info that are common to both table
- Is not symmetrical and hence table sequence do matter

```
SELECT t1.col , t2.col
FROM table1 AS t1
LEFT OUTER JOIN table2 AS t2
ON t1.col = t2.col
```

### LEFT OUTER ONLY

```
SELECT t1.col , t2.col
FROM table1 AS t1
LEFT OUTER JOIN table2 AS t2
ON t1.col = t2.col
WHERE t2 IS null
```

### RIGHT OUTER JOIN

```
SELECT t1.col , t2.col
FROM table1 AS t1
RIGHT OUTER JOIN table2 AS t2
ON t1.col = t2.col
```

### RIGHT OUTER ONLY

```
SELECT t1.col , t2.col
FROM table1 AS t1
RIGHT OUTER JOIN table2 AS t2
ON t1.col = t2.col
WHERE t1 IS null
```

### UNION

-Concat the result of two select statement together

```
SELECT * FROM t1
UNION
SELECT * FROM t2
```

## Advanced SQL Commands

### Displaying current time information

- Useful when creating our own databases
  Time Data Types

* TIME => Contains only time
* DATE => Contains only date
* TIMESTAMP => Contains date and time
* TIMESTAMPTZ => Contains date, time and timezone

- When creating a database carefully consider what time data type you actually need. Think long term. NB: It is better to have data you don't need than not have data that you need.

### Time Functions and Operations

- TIMEZONE => display current timezone
- NOW() => display current time as a timestamptz
- TIMEOFDAY() => display current timestamp as a string
- CURRENT_TIME() => display current time only as a string
- CURRENT_DATE() => display current date only as a string

```
SHOW TIMEZONE()

SELECT NOW()

SELECT CURRENT_DATE()
```

### EXTRACT()

- Allows us to extract or obtain a sub-component of a date value such as
  - YEAR
  - MONTH
  - DAY
  - WEEK
  - QUARTER

```
EXTRACT(YEAR FROM date_col)
```

### AGE()

Calculates and returns the current from a given timestamp
returns => e.g 13 years 1 month 5 days

```
AGE(date_col)

```

### TO_CHAR()

Is a general function that convert data types to text
Is useful for timestamp formatting

- check documentation for various ways of formatting timestamp

```
TO_CHAR(date_col, 'mm-dd-yy')
```

## Mathematical Functions and Operators

Enable us to do mathematical operations between table

```
SELECT (col1 / col2) * 100 AS percent cost
FROM table
```
