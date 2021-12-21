--Get data for 1st export which includes duplicates ---

SELECT employees.emp_no,
    employees.first_name,		
    employees.last_name,
	titles.titles,
	titles.from_date,
	titles.to_date
INTO retirements_title	
FROM employees		
INNER JOIN titles 
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')	
ORDER BY emp_no ASC;

SElECT* from retirements_title

--Only use to refresh table --
Drop Table retirements_title




