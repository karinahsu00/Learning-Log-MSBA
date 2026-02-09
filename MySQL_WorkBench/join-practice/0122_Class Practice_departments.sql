SELECT * FROM ex.departments;
USE ex;
-- inner join

SELECT *
FROM employees e JOIN departments d -- INNER JOIN is the same as JOIN
ON e.department_number = d.department_number;

SELECT *
FROM employees e LEFT JOIN departments d 
ON e.department_number = d.department_number;

-- right join, show all departments even without employees
SELECT *
FROM employees e RIGHT JOIN departments d 
ON e.department_number = d.department_number;

-- use union for full outer join
SELECT *
FROM employees e LEFT JOIN departments d 
ON e.department_number = d.department_number
UNION
SELECT *
FROM employees e RIGHT JOIN departments d 
ON e.department_number = d.department_number;