# Retail Sales SQL Analysis

A portfolio project demonstrating SQL proficiency through 15+ queries of increasing complexity on a simulated retail sales dataset. Covers core SQL skills including joins, aggregations, subqueries, window functions, and CTEs.

## Skills Demonstrated
- SQL (SQLite-compatible syntax)
- Data aggregation and grouping
- Window functions (RANK, ROW_NUMBER, LAG, running totals)
- Common Table Expressions (CTEs)
- Joins across multiple tables
- Excel-ready CSV data for quick exploration

## Project Structure

```
retail-sales-sql-analysis/
├── README.md
├── data/
│   └── retail_sales.csv        # Sample dataset (Excel-friendly)
├── schema.sql                  # Table definitions + data import
└── queries.sql                 # 15+ analysis queries with comments
```

## Dataset Overview

The dataset simulates one year of transactions for a fictional retail chain with:
- **4 tables**: customers, products, orders, order_items
- ~200 orders across 5 product categories
- Customers in 4 regions

## How to Run

### Option 1: SQLite (Recommended)
1. Install [SQLite](https://www.sqlite.org/download.html) or use [DB Browser for SQLite](https://sqlitebrowser.org/) (free GUI)
2. Open a terminal in the project folder
3. Run the schema and queries:
```bash
sqlite3 retail.db < schema.sql
sqlite3 retail.db < queries.sql
```

### Option 2: DB Browser for SQLite (No command line)
1. Download and open DB Browser for SQLite
2. Create a new database called `retail.db`
3. Go to **Execute SQL** tab
4. Copy and paste contents of `schema.sql`, click Run
5. Copy and paste contents of `queries.sql`, run queries one section at a time

### Option 3: Explore in Excel
- Open `data/retail_sales.csv` directly in Excel
- Use pivot tables to cross-reference with SQL findings

## Query Index

| # | Query | Concept |
|---|-------|---------|
| 1 | All orders | Basic SELECT |
| 2 | Orders by region | WHERE filter |
| 3 | Revenue by category | GROUP BY + SUM |
| 4 | Top 10 customers | ORDER BY + LIMIT |
| 5 | Orders with customer names | INNER JOIN |
| 6 | Products never ordered | LEFT JOIN + IS NULL |
| 7 | Average order value | Subquery |
| 8 | Monthly revenue trend | DATE functions + GROUP BY |
| 9 | Category revenue share % | Subquery in SELECT |
| 10 | Customer order count + total spend | Multi-table JOIN + aggregate |
| 11 | Revenue rank by category | RANK() window function |
| 12 | Running total of revenue | SUM() OVER window |
| 13 | Month-over-month revenue change | LAG() window function |
| 14 | Top product per category | ROW_NUMBER() + CTE |
| 15 | High-value customer segments | CTE + CASE |
| 16 | 3-month rolling average revenue | AVG() OVER with frame |

## Sample Output

**Query 3 – Revenue by Category:**
```
category       | total_revenue
---------------|---------------
Electronics    | 48320.50
Furniture      | 31205.00
Clothing       | 18740.25
Sports         | 12890.00
Books          |  4210.75
```

**Query 13 – Month-over-Month Change:**
```
month    | revenue   | prev_revenue | change
---------|-----------|--------------|-------
2023-01  | 8420.50   | NULL         | NULL
2023-02  | 9105.25   | 8420.50      | +684.75
2023-03  | 11230.00  | 9105.25      | +2124.75
```

## Notes
- All data is synthetically generated — no real customer information
- Queries use standard SQL with SQLite-compatible functions
- Dates use YYYY-MM-DD format for easy sorting and Excel compatibility