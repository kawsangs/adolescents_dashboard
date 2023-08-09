#!/bin/bash

# Get the username from the user
username=$1

# Get the password from the user
password=$(echo "$2" | tr -d '\n')

# Get the database name from the user
database_name=$3

# Get the Docker image name from the user
docker_container_id=$4

# Create the user
docker exec -it $docker_container_id psql -U postgres -d $database_name -c "CREATE USER $username;"

# Set the password for the user
docker exec -it $docker_container_id psql -U postgres -d $database_name -c "ALTER USER $username WITH PASSWORD '$password';"

# Grant CONNECT to database
docker exec -it $docker_container_id psql -U postgres -d $database_name -c "GRANT CONNECT ON DATABASE $database_name TO $username;"

# Grant SELECT permission to all tables in the database
docker exec -it $docker_container_id psql -U postgres -d $database_name -c "GRANT SELECT ON ALL TABLES IN SCHEMA public TO $username;"

# How to run: 
# ```
# ./create_postgres_grafana_user_script.sh.sh <username> <password> <database_name> <docker_container_id>
# ```

# In an example:

# ```
# ./create_postgres_grafana_user_script.sh.sh myuser mypassword mydb my_container_id
# ```

# This script will create the user "myuser", set the password to "mypassword", and grant the user select permission to all tables in the database "mydb".
