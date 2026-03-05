-- nth value
-- 2nd highest paid employee from each department
-- can give any value in a window like 1st,2nd,3rd and so on if it is not there it will return null

select e.*,
first_value(emp_name) over w as max_sal_emp,
last_value(emp_name) over w as min_sal_emp,
nth_value(emp_name,2) over w as sec_sal_emp
from employees e
window w as (partition by dept_name order by salary desc range between unbounded preceding and unbounded following);

-- ntile
-- used to group records into buckets in a window

-- segregrate employees in HR dept based on salary as high mid low salary 


select emp_name,
case when x.bucket ='1' then 'high salary'
	 when x.bucket ='2' then 'mid salary'
	 when x.bucket ='3' then 'low salary' end as salary_level from
     (select *,
      ntile(3) over(order by salary desc) as bucket
      from employees where dept_name = 'HR') x; 
      
   
-- cume_dist(cummulative distribution)
-- value  -> 0 to 1
-- formula = row number(if same highest row number)/total no of rows

-- calculate the employees who are constituting 30% of the data based on salary

select emp_name,salary,(cumm_dist_per||'%') as cumm_dist_per from(
  select *,
  cume_dist() over(order by salary desc) as cumm_dist,
  round(cume_dist() over(order by salary desc)::numeric * 100,2) as cumm_dist_per
  from employees) x
where x.cumm_dist_per <= 30;
  
-- percentage rank
-- value 0 to 1
-- formula current row -1/total number of rows -1

-- find how much percentage of Dorvin salary is higher than others

with per_rank_table as (
select *,
percent_rank() over(order by salary) as percentage_rank,
round(percent_rank() over(order by salary)::numeric*100,2) as per_rank from Employees)
select emp_name,per_rank from per_rank_table where emp_name = 'Dorvin';
