INSERT INTO working SELECT 
	employee.employee_id as employee_id,
	project.project_id as project_id,
	'11.11.2021' as start_date
FROM (
		(
			SELECT employee.employee_id
			FROM employee
			WHERE
				employee.firstname = 'Erika' AND 
				employee.lastname = 'Mustermann'
			) as employee CROSS JOIN
		(
			SELECT project_id
			FROM project
			WHERE project.name = 'project2'
		) as project
	);