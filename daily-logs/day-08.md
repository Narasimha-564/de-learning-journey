# Day 8 — Mar 14, 2026

## ✅ Completed
### Videos Watched
- Channel: techTFQ YouTube
- Topic: Subqueries — All Types + Correlated Subquery

### Practice
- Practiced all subquery types hands-on in DB Fiddle ✅

## 💡 Key Learnings

### 3 Types of Subqueries

#### Type 1 — Scalar Subquery
- Returns EXACTLY one row and one column (single value)
- Used in SELECT, WHERE, HAVING clause
- If returns more than one row → error!
- Example use: Get each employee's salary vs company average

#### Type 2 — Multiple Row Subquery
- Returns multiple rows but single column
- Used with IN, NOT IN, ANY, ALL operators
- Example use: Get employees who work in specific departments

#### Type 3 — Multiple Column Subquery
- Returns multiple rows AND multiple columns
- Used in FROM clause as derived table
- Or in WHERE with row constructor comparison
- Example use: Find employees matching both dept and salary criteria

#### Type 4 — Correlated Subquery
- Inner query references outer query column
- Runs ONCE PER ROW of outer query
- Cannot run independently on its own
- Example use: Find employees earning above their dept average

## 🔑 Key Differences
| Type | Returns | Used With | Runs |
|------|---------|-----------|------|
| Scalar | 1 row, 1 col | SELECT, WHERE, HAVING | Once |
| Multiple Row | Many rows, 1 col | IN, NOT IN, ANY, ALL | Once |
| Multiple Column | Many rows, many cols | FROM clause | Once |
| Correlated | Varies | WHERE, HAVING | Once per outer row |

## 🛠️ Tools Used
- DB Fiddle → practiced all 4 types hands-on ✅


## 🎯 Tomorrow
- EXISTS / NOT EXISTS
- IN vs NOT IN NULL trap
- LeetCode #584, #550, #196