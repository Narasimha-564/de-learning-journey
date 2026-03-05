# Day 2 — Feb 25, 2026

## ✅ Completed
### Videos Watched
- Video: techTFQ — Window Functions Part 2 (continuation from Feb 24)
  - Deep dive into Frame Clause
  - ROWS vs RANGE difference
  - How UNBOUNDED PRECEDING & UNBOUNDED FOLLOWING works
  - Alternate ways of writing Window Functions

### LeetCode Solved
- #184 — Department Highest Salary   ✅ Beats 91.99% 🏆
- #185 — Department Top 3 Salaries   ✅ Beats 86.66% 🏆

## 💡 Key Learnings

### ROWS vs RANGE
- ROWS  → physical rows (counts duplicates separately)
- RANGE → logical range (treats duplicate ORDER BY values as same group)

Example:
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
→ counts each row individually even if salary is same

RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
→ groups all rows with same salary value together

### UNBOUNDED Explained
- UNBOUNDED PRECEDING → from the very first row of partition
- UNBOUNDED FOLLOWING → till the very last row of partition
- CURRENT ROW        → stops at current row

### Alternate Ways of Writing Window Functions
- Named Window using WINDOW clause (avoids repetition):

SELECT 
  emp_name,
  salary,
  RANK()       OVER w,
  DENSE_RANK() OVER w,
  ROW_NUMBER() OVER w
FROM employees
WINDOW w AS (PARTITION BY dept_id ORDER BY salary DESC);

## 🏆 LeetCode Performance
| Problem | Title | Result | Beat % |
|---------|-------|--------|--------|
| #184 | Department Highest Salary | ✅ Solved | 91.99% |
| #185 | Department Top 3 Salaries | ✅ Solved | 86.66% |

## ⚠️ Key Gotcha Reinforced
- ROWS vs RANGE only matters when there are DUPLICATE values
  in the ORDER BY column — otherwise both give same result

## 🎯 Tomorrow
- NTILE, CUME_DIST, PERCENT_RANK videos
- LeetCode #177