//Second highest salary using max function

SELECT TOP 1 id,
NAME,
Max(salary)
FROM employee
WHERE salary < (SELECT Max(salary)
FROM employee)
GROUP BY id,
NAME,
salary
ORDER BY salary DESC


//Second highest salary using inline query 

SELECT TOP 1 *
FROM   (SELECT DISTINCT TOP 2 salary
        FROM   employee
        ORDER  BY salary DESC) AS t
ORDER  BY t.salary ASC

////Second highest salary using dense_rank function

with tmp_emp as(
select Id,Name,Salary, DENSE_RANK() over(order by salary desc) as Rank
from Employee)
select Id,Name,Salary from tmp_emp where tmp_emp.Rank=2
