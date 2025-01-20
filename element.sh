echo Please provide an element as an argument.
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"



# check if input is an atomic number in the database
INPUT_IS_ATOMIC_NUMBER=$($PSQL "SELECT * FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number FULL JOIN types ON properties.type_id=types.type_id WHERE elements.atomic_number = $1;")
echo "$INPUT_IS_ATOMIC_NUMBER" | sed -i 's/|/ /g'
echo -e "\n$INPUT_IS_ATOMIC_NUMBER"


# check if input is a symbol in the database



# check if input is a name in the database
