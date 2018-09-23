with emp_income as (
    select employee_id, department_id,
    case when salary is not null then
        salary
    else
        0
    end
    +
    case when commission is not null then
        commission
    else
        0
    end
    as income
    from employee
),
dep_income as (
    select department_id, sum(income) as income
    from emp_income
    group by department_id
)

select e.employee_id as "Employee ID", emp.last_name || ' ' || emp.first_name as "Name",
case when d.income != 0 then
    round(e.income / d.income * 100.0, 2)
else
    null
end as "Income Percentage, %"
from emp_income e
    inner join dep_income d on e.department_id = d.department_id
    inner join employee emp on e.employee_id = emp.employee_id
order by e.employee_id;
