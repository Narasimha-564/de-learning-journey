# Day 6 — Mar 05, 2026

## ✅ Completed
### Topics Learned
- Correlated Subquery
- Non-Correlated Subquery
- Joins: Inner, Left, Right, Full 

### Resources Used
- Claude AI — concept explanation
- Ankit Bansal YouTube — Joins examples

### LeetCode Solved
- #175 — Combine Two Tables ✅ Final: Beats 98.64% 🏆
  Journey: LEFT JOIN (41.07%) → RIGHT JOIN (98.64%)

## 💡 Key Learnings

### Non-Correlated Subquery
- Inner query runs ONCE independently
- Outer query uses the result
- Faster because inner query executes only one time
- Example:
  SELECT emp_name FROM employees
  WHERE dept_id IN (
    SELECT dept_id FROM departments
    WHERE location = 'Mumbai'
  )
  → Inner query runs once → returns all Mumbai dept_ids
  → Outer query uses that result

### Correlated Subquery
- Inner query runs ONCE FOR EVERY ROW of outer query
- References outer query column inside inner query
- Slower but powerful for row by row comparisons
- Example:
  SELECT emp_name, salary FROM employees e1
  WHERE salary > (
    SELECT AVG(salary) FROM employees e2
    WHERE e2.dept_id = e1.dept_id  ← references outer query
  )
  → For every employee → inner query runs separately
  → Compares each employee salary vs their dept average

## 🔑 Key Differences
| Feature | Non-Correlated | Correlated |
|---------|---------------|------------|
| Runs | Once | Once per outer row |
| Speed | Faster | Slower |
| References outer query | No | Yes |
| Use case | Filter by fixed list | Row by row comparison |

## 🏆 LeetCode #175 — Optimization Journey
- Attempt 1: LEFT JOIN  → Beats 41.07%  ❌ slow
- Attempt 2: RIGHT JOIN → Beats 98.64%  ✅ 🏆
- Lesson: RIGHT JOIN was more efficient for this specific
  table structure — Persons table as right table
  preserved all rows without NULL filtering overhead

## 🎯 Tomorrow
- SELF JOIN, CROSS JOIN
- Correlated subquery practice problems
- LeetCode #181, #182, #183