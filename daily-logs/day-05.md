# Day 5 — Mar 03, 2026

## ✅ LeetCode Solved
- #178 — Rank Scores          ✅ Beats 95.55% 🏆
- #180 — Consecutive Numbers  ✅ Beats 96.58% 🏆

## 💡 Key Learnings

### #178 — Rank Scores
- Classic DENSE_RANK problem
- ORDER BY score DESC to rank highest first
- DENSE_RANK handles duplicate scores correctly

### #180 — Consecutive Numbers
- Used both LAG and LEAD with CASE approach
- LAG(num, 1)  → looks at previous row
- LEAD(num, 1) → looks at next row
- CASE checks current row against both directions
- Checks if current number appears consecutively
  in both forward and backward direction

## 🔑 Pattern Recognized
- Used both LAG and LEAD together in same query
- CASE statement validates consecutive in both directions
- Much cleaner than SELF JOIN 3 times approach

## 🎯 Next
- SQL Joins deep dive — INNER, LEFT, RIGHT, FULL OUTER
- SELF JOIN, CROSS JOIN
- LeetCode #175, #181, #182, #183