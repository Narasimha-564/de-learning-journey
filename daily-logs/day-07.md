# Day 7 — Mar 13, 2026

## ✅ Completed
### LeetCode Solved
- #181 — Employees Earning More Than Managers ✅ Beats 99.83% 🏆
- #182 — Duplicate Emails                     ✅ Beats 97.50% 🏆
- #183 — Customers Who Never Order            ✅ Beats 95.36% 🏆

## 💡 Key Learnings

### #181 — Employees Earning More Than Managers
Approaches tried:
- Subquery approach  → slower, runs once per outer row
- Self JOIN approach → Beats 99.83% 🏆

Why Self JOIN won:
→ Single scan joining table with itself
→ Query optimizer handles joins better than subqueries
→ Subquery overhead increases with table size

### #182 — Duplicate Emails
Approaches tried and compared:
- DENSE_RANK        → Beats 76.50% ❌
- Self JOIN         → compared
- GROUP BY + HAVING → Beats 97.50% 🏆

Why GROUP BY + HAVING won:
→ DENSE_RANK = window function = more overhead
→ GROUP BY + HAVING = simple aggregation = faster
→ 21% performance difference proven!

Key Lesson:
Not every problem needs a window function
Simple GROUP BY + HAVING beats DENSE_RANK
for duplicate detection

### #183 — Customers Who Never Order
Approach: LEFT JOIN + IS NULL → Beats 95.36% 🏆

Why LEFT JOIN + IS NULL works:
→ LEFT JOIN keeps ALL customers including
  those with no matching order
→ IS NULL filters only non-ordering customers
→ Safer and faster than NOT IN subquery
→ NOT IN breaks silently when NULLs exist

## 🔑 Approach Comparison Summary
| Problem | Slower Approach       | Faster Approach            | Gap    |
|---------|-----------------------|---------------------------|--------|
| #181    | Subquery              | Self JOIN (99.83%) 🏆      | Large  |
| #182    | DENSE_RANK (76.50%)   | GROUP BY+HAVING (97.50%) 🏆| 21%    |
| #183    | NOT IN Subquery       | LEFT JOIN+IS NULL (95.36%)🏆| Safer |

## 🏆 LeetCode Performance
| Problem | Title                              | Beat %   | Approach              |
|---------|------------------------------------|----------|-----------------------|
| #181    | Employees Earning More Than Managers| 99.83% 🏆| Self JOIN             |
| #182    | Duplicate Emails                   | 97.50% 🏆 | GROUP BY + HAVING     |
| #183    | Customers Who Never Order          | 95.36% 🏆 | LEFT JOIN + IS NULL   |

## 🎯 Interview Stories From Today

Story 1 — #181:
"Solved using both subquery and self JOIN —
self JOIN beat 99.83% because the optimizer
handles joins more efficiently than row-by-row subqueries"

Story 2 — #182:
"Tried 3 approaches — DENSE_RANK scored 76.5%,
but simple GROUP BY + HAVING scored 97.5%.
Taught me window functions aren't always the best tool —
sometimes simplest aggregation outperforms complex solution by 21%"

Story 3 — #183:
"Used LEFT JOIN + IS NULL instead of NOT IN subquery —
NOT IN breaks silently when NULLs exist in the subquery result,
LEFT JOIN + IS NULL handles NULLs safely every time"

## 🎯 Tomorrow
- EXISTS / NOT EXISTS concept
- IN vs NOT IN NULL trap
- LeetCode #584, #550, #196