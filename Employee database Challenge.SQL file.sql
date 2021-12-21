--Remove duplicates to include unique employees who are still at the company --

SELECT DISTINCT ON (emp_no)emp_no,
    first_name,		
    last_name,
	titles
INTO unique_titles	
FROM retirements_title		
--WHERE (to_date ='9999-01-01')	
ORDER BY emp_no ASC, to_date DESC;

SELECT* from unique_titles

Drop table unique_titles


-- Employee count by department number
SELECT COUNT(ut.titles), ut.titles
FROM unique_titles as ut
GROUP BY ut.titles
ORDER by count DESC;

--Mentorship Eligibility Table--

SELECT DISTINCT ON (emp_no)e.emp_no,
    e.first_name,		
    e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.titles
INTO mentorship_eligibility	
FROM employees as e	
INNER JOIN titles as t
ON e.emp_no = t.emp_no
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no 
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (t.to_date = '9999-01-01')
ORDER BY emp_no ASC;

Select* from mentorship_eligibility