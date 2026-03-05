-- row vs range
-- range will consider all the records with same value and execute window function 
-- row will consider only the record even with the same value and  execute the window function

-- unbounding can be any number like 2,3 or any number you you want the frame should be for every record

--frame is a range or rows of records that an individual record can access in a window

-- below 2 examples will explain how row and range works with duplicates present

-- Example:-

select e.*,
first_value(emp_name) over(partition by dept_name order by salary desc) as max_sal_emp,
last_value(emp_name) over(partition by dept_name order by salary desc rows between unbounded preceding and current row) as min_sal_emp 
from employees e where dept_name='HR';

select e.*,
first_value(emp_name) over(partition by dept_name order by salary desc) as max_sal_emp,
last_value(emp_name) over(partition by dept_name order by salary desc range between unbounded preceding and current row) as min_sal_emp 
from employees e where dept_name='HR'; 

-- alternate way to write window function

select e.*,
first_value(emp_name) over w as max_sal_emp,
last_value(emp_name) over w as min_sal_emp 
from employees e where dept_name='HR'
window w as (partition by dept_name order by salary desc range between unbounded preceding and unbounded following);