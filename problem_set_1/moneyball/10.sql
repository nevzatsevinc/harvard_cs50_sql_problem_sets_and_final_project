SELECT players.first_name, players.last_name, salaries.salary, performances.HR, salaries.year
FROM "salaries"
JOIN "players" ON salaries.player_id = players.id
JOIN "performances" ON players.id = performances.player_id AND salaries.year = performances.year
ORDER BY players.id, salaries.year DESC, performances.HR DESC, salaries.salary DESC;
