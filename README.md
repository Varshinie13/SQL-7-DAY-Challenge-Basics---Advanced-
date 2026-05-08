# SQL-7-DAY-Challenge-Basics---Advanced-

🚀 7-Day SQL Portfolio Challenge: From Basics to Automation

📝 Introduction:

This repository is a documented journey of my transition from understanding database foundations to implementing complex relational logic and automated database objects.

In the modern data-driven world, the ability to communicate with databases is essential. Over the course of one week, I built, queried, and optimized two primary database systems:

Hospital_DB: Focusing on structural integrity and schema management (DDL).

ECommerce_DB: Focusing on data analysis, relational reporting, and backend automation (DML, Joins, Triggers).

Each day of this challenge represents a specific technical milestone, designed to simulate real-world data tasks and business scenarios.

🛠️ Tech Stack & Tools:

Language: SQL (Structured Query Language)

Database Engine: MySQL

Documentation: Markdown

Version Control: Git & GitHub

🏗️ The Roadmap at a Glance:

Day 1-2: The Foundation (DDL/DML & Constraints)

Day 3-4: Data Analysis (Clauses & Operators)

Day 5: Relational Logic (Joins & Functions)

Day 6: Advanced Querying (Subqueries & CTEs)

Day 7: Automation & Security (Views & Triggers)


📅 Day 1 & 2: Database Foundation & CRUD Operations

### 🎯 Objectives
- Master Data Definition Language (DDL): `CREATE`, `ALTER`, `RENAME`, `TRUNCATE`, and `DROP`.
- Master Data Manipulation Language (DML): `INSERT`, `UPDATE`, and `DELETE`.
- Implement constraints like `PRIMARY KEY`, `UNIQUE`, `CHECK`, and `REFERENCES`.

### 📂 Projects Covered
1.  **Hospital Management Schema**: Focused on structural changes and table modifications.
2.  **Online Bookstore System**: Focused on relational data, constraints, and data entry.

### 🛠️ Key Learnings
- **Table Relationships:** Linked the `Orders` table to the `Books` table using `BookID`.
- **Data Integrity:** Used `CHECK` constraints to ensure prices and quantities remain positive.
- **Workflow:** Practiced the full lifecycle of a record—from insertion to update and eventual deletion.

  DAY 1 and 2 Queries:

  <img width="960" height="540" alt="Screenshot 2026-05-07 201320" src="https://github.com/user-attachments/assets/e7648059-4672-454f-b58c-4afdd57fbdfe" />


- 🛒 Days 3 ,4 & 5: E-Commerce Data Analysis

## 🎯 Objectives
Transitioning from structural setup to data retrieval. The focus of these two days is mastering how to filter, sort, and limit data using logical operators and SQL clauses.

## 📂 Project Structure:
- `/Day_03_ Clauses & Operators/`: Implementation of Where Clause,Comparison Operators, Arithmatic Operators,Logical Operators, is null/ is not null,in and Not in, between and not between, like and not like
- `/Day_04_ Clauses & Operators/`: Advanced logic using ORDER BY & LIMIT,Aggregate Functions,GROUP BY & HAVING,Window Functions.
- `/Day_05_Automation/`: operation using left join, right join, Inner Join .


## 🛠️ SQL Concepts Applied
- **Filtering Data:** `WHERE` clause with logical operators (`AND`, `OR`, `NOT`).
- **Range & Set Operators:** `BETWEEN` for price ranges and `IN` for category filtering.
- **Pattern Matching:** `LIKE` with wildcards (`%`, `_`) to search for products.
- **Result Sorting:** `ORDER BY` (ASC/DESC) to rank products by price or popularity.
- **Data Constraints:** `LIMIT` to fetch top-performing records.
- Use ORDER BY & LIMIT for ECommerce DB
- Use Aggregate Functions to retrive the total, min, max etc.
- Handle the  GROUP BY & HAVING in the queries.
- Window Functions (Rank, Dense_Rank)

## 📊 Business Questions Solved
In this challenge, I wrote queries to answer:
1. Display unique product names from the Product table.
2. Display product name and price after 10% increase.
3. Display products whose price is NOT between 5,000 and 50,000.
4. Display products whose name does not start with 'S'.
5.  Write SQL queries using aggregate functions on the Sales table:
o    COUNT() → total number of sales records
o    SUM() → total sales amount
o    AVG() → average sale amount
o    MAX() → highest sale amount
o    MIN() → lowest sale amount
6. Management wants a ranking of products based on their prices.



## 📅 Day 5: Joins & Built-in Functions:
- - `/Day_05_Joins/`: Script for relational reporting and string manipulation.
**Focus:** Data Consolidation and Transformation.
- **Multi-Table Joins:** Connecting `Orders`, `Customers`, and `Products` to create a complete business snapshot.
- **Join Types:** Implementation of `INNER JOIN`, `LEFT JOIN`, and `CROSS JOIN`.
- **String & Date Functions:** Using `CONCAT()`, `UPPER()`, and `DATEDIFF()` to clean and format report data.
- **Mathematical Functions:** Using `ROUND()` and `CEIL()` for financial calculations.


  ## 🛠️ Skills Demonstrated
| Feature | Application |
| :--- | :--- |
| **Clauses & Operators** | Perform the operation to fetch the require details from tables. |
| **Clauses & Operators** | Created the Window functions, order by , group by to order the table for insights |
| **Joins** | Combined 3+ tables to generate comprehensive sales reports. |


---
Day 3 , 4 and 5 queries:

&nbsp;

<img width="953" height="502" alt="Screenshot 2026-05-07 201455" src="https://github.com/user-attachments/assets/e4046ae9-51d3-45b8-aae6-1e048a0c6d30" />

&nbsp;


<img width="953" height="498" alt="Screenshot 2026-05-07 201445" src="https://github.com/user-attachments/assets/2fe6a0cf-0bde-400b-ba16-768a7a97d872" />

&nbsp;


<img width="953" height="495" alt="Screenshot 2026-05-07 201415" src="https://github.com/user-attachments/assets/aaf81b4f-65b8-4834-b160-a6cba31980e6" />

&nbsp;

<img width="951" height="500" alt="Screenshot 2026-05-07 201510" src="https://github.com/user-attachments/assets/f91bf799-1e17-4a13-9fb3-9f4fa98d32ef" />

&nbsp;

The final phase of this challenge focuses on connecting fragmented data, nesting logic for complex reporting, and implementing database automation using Triggers.



## 📅 Day 6: Subqueries & CTEs
**Focus:** Nested Logic and Modular Code.
- **Single-row & Multi-row Subqueries:** Filtering data based on results from another query (e.g., finding products with prices above the average).
- **Correlated Subqueries:** Performance-based filtering where the inner query relies on the outer query.
- **Common Table Expressions (CTEs):** Using the `WITH` clause to make complex queries readable and organized.

## 📅 Day 7: Database Objects (Views & Triggers)
**Focus:** Security, Simplification, and Automation.
- **Simple & Complex Views:** Creating virtual tables to hide query complexity and protect sensitive data.
- **Triggers:** Automating actions (e.g., automatically updating stock levels when a new order is inserted).
- **DCL Basics:** Understanding how Views provide a layer of security for end-users.

---

## 🛠️ Skills Demonstrated
| Feature | Application |
| :--- | :--- |
| **Subqueries** | Identified "Top 10%" customers using nested aggregations. |
| **Views** | Created a `DepartmentSalarystates` view for executive reporting. |
| **Triggers** | Built an after Trigger to keep a record every time a new employee is added  |

---

## 📂 Project Structure
- `/Day_06_Subqueries/`: Advanced logic using Single and Multi row Subqueries and nested SELECTs.
- `/Day_07_Automation/`: Implementation of Views and Row-level Triggers.


Day 6 and 7 queries:
<img width="953" height="501" alt="Screenshot 2026-05-07 201647" src="https://github.com/user-attachments/assets/23baf777-196a-43ef-8a4a-6de73dc7f770" />

&nbsp;


<img width="953" height="498" alt="Screenshot 2026-05-07 201639" src="https://github.com/user-attachments/assets/3023e257-b5d7-4259-8409-e5bbaf8a7018" />

&nbsp;


<img width="952" height="498" alt="Screenshot 2026-05-07 201627" src="https://github.com/user-attachments/assets/c7397e22-ddaf-4770-a602-9d73a5ed052d" />

&nbsp;


<img width="953" height="500" alt="Screenshot 2026-05-07 201615" src="https://github.com/user-attachments/assets/c7beead5-bce3-41a2-b2d4-a272576084c6" />

&nbsp;


🏁 Conclusion:

Completing this 7-day challenge has been a journey through the core pillars of Database Management. I have successfully transitioned from understanding how data is stored (DDL) to how data is analyzed and automated (DML, Joins, Subqueries, and Triggers).

Key Takeaways:

Data Integrity: Learned how to use constraints to ensure a database remains "clean" and reliable.

Relational Logic: Mastered the ability to connect multiple tables to uncover business insights that a single table cannot provide.

Optimization: Practiced using CTEs and Views to make complex code readable and maintainable.

Automation: Implemented Triggers to handle repetitive tasks, reducing the margin for human error.

Next Steps:

While this challenge is complete, my SQL journey is just beginning. I plan to build on this foundation by:

Exploring Window Functions for advanced data ranking.

Learning Database Normalization (1NF, 2NF, 3NF) to design more efficient schemas.

Integrating these SQL databases with Python for Data Visualization.

#SQL #Database #MySQL #RelationalDatabase #DataAnalysis#7DayChallenge #CodingChallenge #EntryLevelDataAnalyst 


