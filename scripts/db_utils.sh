#!/bin/bash

# Function to create a MySQL user.
create_user() {
  local DB_NAME=$1
  local DB_USER=$2
  local DB_PASS=$3
  local HOST=${4:-localhost}

  # Check if the user exists on the specified host.
  if ! sudo $MYSQL_CMD -e "SELECT User FROM mysql.user WHERE User = '$DB_USER' AND Host = '$HOST';" | grep -q "$DB_USER"; then
    echo -e "${CYAN}Creating user '$DB_USER'@'$HOST'...${NC}"
    sudo $MYSQL_CMD -e "CREATE USER '$DB_USER'@'$HOST' IDENTIFIED BY '$DB_PASS';"
    sudo $MYSQL_CMD -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'$HOST';"
    echo -e "${GREEN}User '$DB_USER'@'$HOST' created and granted privileges on '$DB_NAME'.${NC}"
  else
    echo -e "${YELLOW}User '$DB_USER'@'$HOST' already exists. Skipping creation.${NC}"
  fi
}

# Function to create a database.
create_database() {
  local DB_NAME=$1
  
  # Check if the database already exists.
  if ! sudo $MYSQL_CMD -e "SHOW DATABASES LIKE '$DB_NAME';" | grep -q "$DB_NAME"; then
    echo -e "${CYAN}Creating database '$DB_NAME'...${NC}"
    sudo $MYSQL_CMD -e "CREATE DATABASE \`$DB_NAME\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
    echo -e "${GREEN}Database '$DB_NAME' created successfully.${NC}"
  else
    echo -e "${YELLOW}Database '$DB_NAME' already exists. Skipping creation.${NC}"
  fi
}