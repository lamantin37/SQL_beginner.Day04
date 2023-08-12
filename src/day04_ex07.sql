INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT (SELECT COALESCE(MAX(id), 0) FROM person_visits) + 1,
       p.id,
       q1.id,
       TIMESTAMP '2022-01-08'
FROM person p
JOIN (
    SELECT q1.id
    FROM (
        SELECT *
        FROM pizzeria pi
    ) q1
    JOIN (
        SELECT *
        FROM menu m
        WHERE m.price < 800
    ) q2 ON q1.id = q2.pizzeria_id
    EXCEPT
    SELECT pi.id
    FROM pizzeria pi
    JOIN mv_dmitriy_visits_and_eats mdvae ON pi.name = mdvae.name
    ORDER BY 1
    LIMIT 1
) q1 ON TRUE
WHERE p.name = 'Dmitriy';

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

