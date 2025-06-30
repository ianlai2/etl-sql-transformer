WITH dept_avg AS (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM
        employees
    GROUP BY
        department_id
)
SELECT
    e.name,
    e.salary,
    d.department_name,
    da.avg_salary
FROM
    employees e
    JOIN dept_avg da ON e.department_id = da.department_id
    JOIN departments d ON e.department_id = d.id
WHERE
    e.salary > da.avg_salary
ORDER BY
    d.department_name, e.salary DESC;
