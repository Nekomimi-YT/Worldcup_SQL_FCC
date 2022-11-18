#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WGOALS OPGOALS
do
 if [[ $YEAR != "year" ]]
  then
    # insert teams into the table
    INSERT_TEAMS=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    INSERT_MORE_TEAMS=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

    # get team-id by team names
    W_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    O_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # insert data into games table
    INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $W_ID, $O_ID, $WGOALS, $OPGOALS)")
  fi
done