echo Please provide an element as an argument.
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"



# check if input is an atomic number in the database

if [[ $1 ]]
then
  if [[ $1 > 0 ]]
  then
    INPUT_IS_ATOMIC_NUMBER=$($PSQL "SELECT * FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number FULL JOIN types ON properties.type_id=types.type_id WHERE elements.atomic_number = $1;")
  fi
  INPUT_IS_ATOMIC_SYMBOL=$($PSQL "SELECT * FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number FULL JOIN types ON properties.type_id=types.type_id WHERE elements.symbol = '$1';")
  INPUT_IS_ATOMIC_NAME=$($PSQL "SELECT * FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number FULL JOIN types ON properties.type_id=types.type_id WHERE elements.name = '$1';")
  if [[ -z $INPUT_IS_ATOMIC_NUMBER ]]
  then
    if [[ -z $INPUT_IS_ATOMIC_SYMBOL ]]
    then
      if [[ -z $INPUT_IS_ATOMIC_NAME ]]
      then
        echo I could not find that element in the database.
      else
      echo "$INPUT_IS_ATOMIC_NAME" | sed 's/|/ /g' | while read ATOMIC_NUMBER SYMBOL NAME ATOMIC_NUMBER MASS MELTING BOILING TYPE_ID TYPE_ID TYPE
      do
        echo -e "\nThe element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
      fi
    else
    echo "$INPUT_IS_ATOMIC_SYMBOL" | sed 's/|/ /g' | while read ATOMIC_NUMBER SYMBOL NAME ATOMIC_NUMBER MASS MELTING BOILING TYPE_ID TYPE_ID TYPE
    do
      echo -e "\nThe element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
    fi
  else
  echo "$INPUT_IS_ATOMIC_NUMBER" | sed 's/|/ /g' | while read ATOMIC_NUMBER SYMBOL NAME ATOMIC_NUMBER MASS MELTING BOILING TYPE_ID TYPE_ID TYPE
  do
    echo -e "\nThe element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  done
  fi
fi

  # check if input is a symbol in the database



  # check if input is a name in the database
