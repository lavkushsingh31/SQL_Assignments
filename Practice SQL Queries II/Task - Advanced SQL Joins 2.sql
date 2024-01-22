CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary NUMERIC(8,2),
    manager_id INT
);

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO departments (name, manager_id) VALUES
    ('Sales', 1),
    ('Marketing', 2),
    ('Finance', 3),
    ('IT', 4),
    ('Human Resources', 5);

INSERT INTO employees (name, dept_id, salary, manager_id) VALUES
    ('John', 1, 5000.00, 1),
    ('Mary', 1, 6000.00, 1),
    ('Joe', 2, 5500.00, 2),
    ('Sarah', 2, 6500.00, 2),
    ('Tom', 3, 7000.00, 3),
    ('Bob', 3, 8000.00, 3),
    ('Lisa', 4, 4500.00, 4),
    ('Mike', 4, 5500.00, 4),
    ('Jane', 5, 6000.00, 5),
    ('Alex', 5, 7000.00, 5),
    ('David', 1, 5000.00, 1),
    ('James', 1, 6000.00, 1),
    ('Karen', 2, 5500.00, 2),
    ('Rachel', 2, 6500.00, 2),
    ('Tim', 3, 7000.00, 3),
    ('Alice', 3, 8000.00, 3),
    ('Julie', 4, 4500.00, 4),
    ('Peter', 4, 5500.00, 4),
    ('Mark', 5, 6000.00, 5),
    ('Michelle', 5, 7000.00, 5);
	
SELECT *
FROM employees;

SELECT *
FROM departments;

-- How many employees are working in each department?
SELECT d.name, COUNT(e.name) as total_employees
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.id
GROUP BY d.name;

-- Who are the managers of each department?
SELECT d.name, e.name as manager_name
FROM departments d
LEFT JOIN employees e ON d.manager_id = e.id;


--Who are the employees who are reporting to a specific manager?
SELECT e1.id as employee_id, e1.name as employee_name, e2.manager_id, e2.name as manager_name
FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.id
WHERE e2.name = 'Sarah';


-- Which department has the highest-paid employees?
SELECT d.name, e.name, e.salary
FROM employees e
JOIN departments d ON e.dept_id = d.id
WHERE e.salary = (
	SELECT MAX(salary) FROM employees
)


-- What is the average salary of employees in each department?
SELECT d.name, round(AVG(e.salary),2) as avg_salary
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.id
GROUP BY d.name;

-- Which employees are reporting to themselves (self-join)?
SELECT e1.id as employee_id, e1.name as employee_name, e2.manager_id, e2.name as manager_name
FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.id;










DROP TABLE departments;
DROP TABLE employees;
