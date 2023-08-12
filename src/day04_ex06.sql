CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
WITH dmitriy_visits AS (
    SELECT pv.*
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id
    WHERE p.name = 'Dmitriy' AND pv.visit_date = '2022-01-08'
),
pizzerias AS (
    SELECT pi.id, pi.name
    FROM pizzeria pi
    JOIN dmitriy_visits dv ON pi.id = dv.pizzeria_id
),
affordable_pizzerias AS (
    SELECT p.name
    FROM pizzerias p
    JOIN menu m ON p.id = m.pizzeria_id
    WHERE m.price < 800
)
SELECT DISTINCT name
FROM affordable_pizzerias;

