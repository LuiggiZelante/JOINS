SELECT e.last_name,e.department_id,d.department_name
FROM employees e JOIN departments d
ON(e.department_id = d.department_id);

SELECT e.employee_id, e.last_name,j.job_title,d.department_name, l.city,l.state_province, l.country_id
FROM employees e 
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON d.department_id = e.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE last_name = 'King'
ORDER BY e.employee_id;

SELECT e.employee_id,e.last_name,e.salary,e.department_id,d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE (e.salary BETWEEN 10000 AND 15000)
ORDER BY salary;

SELECT e.employee_id,e.last_name,e.salary,e.department_id,d.department_name
FROM employees e INNER JOIN departments d
ON (e.department_id = d.department_id) AND
(e.salary BETWEEN 10000 AND 15000);

SELECT empregado.employee_id "ID empregado",empregado.last_name "Sobrenome empregado",gerente.employee_id "Id gerente",gerente.last_name "Sobrenome gerente"
FROM employees empregado JOIN employees gerente
ON(empregado.manager_id = gerente.employee_id)
WHERE gerente.last_name = 'King'
ORDER BY empregado.employee_id;


CREATE TABLE job_grades(
grade_level VARCHAR2 (2) NOT NULL,
lowest_sal NUMBER (11,2),
highest_sal NUMBER (11,2),
CONSTRAINT job_grade_pk PRIMARY KEY (grade_level));

INSERT INTO job_grades VALUES ('A',1000,2999);
INSERT INTO job_grades VALUES ('B',3000,5999);
INSERT INTO job_grades VALUES ('C',6000,9999);
INSERT INTO job_grades VALUES ('D',10000,14999);
INSERT INTO job_grades VALUES ('E',15000,24999);
INSERT INTO job_grades VALUES ('F',25000,40000);

COMMIT;

SELECT e.employee_id,e.salary,j.grade_level,j.lowest_sal,j.highest_sal
FROM employees e JOIN job_grades j
ON NVL(e.salary,0) BETWEEN j.lowest_sal AND j.highest_sal
ORDER BY e.salary DESC;

SELECT department_id,department_name,location_id, city
FROM departments
NATURAL INNER JOIN locations;

SELECT e.employee_id,e.last_name, d.location_id,department_id,d.department_name
FROM employees e INNER JOIN departments d USING (department_id);

SELECT e.first_name,e.last_name,d.department_id,d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON(e.department_id = d.department_id)
ORDER BY d.department_id;

SELECT e.first_name,e.last_name,d.department_id,d.department_name
FROM employees e RIGHT OUTER JOIN departments d
ON(e.department_id = d.department_id)
ORDER BY d.department_id;

SELECT e.first_name,e.last_name,d.department_id,d.department_name
FROM employees e FULL OUTER JOIN departments d
ON(e.department_id = d.department_id)
ORDER BY d.department_id;

SELECT last_name,department_name
FROM employees CROSS JOIN departments;