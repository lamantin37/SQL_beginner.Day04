SELECT generated_date AS missing_date
FROM v_generated_dates
WHERE generated_date BETWEEN '2022-01-01' AND '2022-01-31'
EXCEPT
SELECT visit_date
FROM person_visits
ORDER BY missing_date;
