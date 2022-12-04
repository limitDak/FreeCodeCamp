#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#clear all data from tables
echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 
#team id's must be done first as the games table needs them for reference
  #skip first line
  if [[ $WINNER != "winner" ]]
  then
  #get winner team id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    #if not found
    if [[ -z $WINNER_ID ]]
    then
    #insert team
    INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) values('$WINNER')")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi
    #get new winner team id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name ='$WINNER'")
    fi
 

  #get opponent team id
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    #if not found
    if [[ -z $OPPONENT_ID ]]
    then
    #insert team
    INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) values('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
    #get new opponenent team id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name ='$OPPONENT'")
    fi

#now that teams are correctly placed, we can just enter the values as is
#we can assume that the first line has been skipped, so the following values 
#should be good to insert
  
  #insert values
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values('$YEAR','$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
  if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
  then
    echo Inserted game between $WINNER and $OPPONENT
  fi   
fi 
done