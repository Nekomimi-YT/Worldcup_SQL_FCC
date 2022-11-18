# Build A World Cup Database 
freeCodeCamp Relational Database Certification Challenge #2

For this challenge-project, I wrote a Bash script that enters information from World Cup games into PostgreSQL, then query the database for the requested statistics.

### Part 1: Create the database and insert data
* Create a new PostgreSQL database called worldcup
* Insert data from games.csv via bash script logic (insert_data.sh) into the worldcup database
* Dump to worldcup.sql

### Part 2: Query the database
* Complete the query challenge by translating requests into bash echo commands
```
echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT year, name FROM teams FULL JOIN games ON teams.team_id=games.winner_id WHERE round='Final' ORDER BY year")"
```

```
echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%' ")"
```
