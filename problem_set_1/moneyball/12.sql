SELECT players.first_name, players.last_name
FROM players
WHERE players.id IN (
    SELECT players.id
    FROM players
    JOIN salaries ON players.id = salaries.player_id
    JOIN performances ON players.id = performances.player_id
    WHERE salaries.year = 2001 AND performances.year = 2001 AND performances.H > 0
    ORDER BY salaries.salary / performances.H ASC
    LIMIT 10
)
AND players.id IN (
    SELECT players.id
    FROM players
    JOIN salaries ON players.id = salaries.player_id
    JOIN performances ON players.id = performances.player_id
    WHERE salaries.year = 2001 AND performances.year = 2001 AND performances.RBI > 0
    ORDER BY salaries.salary / performances.RBI ASC
    LIMIT 10
)
ORDER BY players.id;
