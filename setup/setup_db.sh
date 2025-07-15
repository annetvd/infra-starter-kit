#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source $SCRIPT_DIR/../scripts/db_utils.sh

INIT_USERS_CODE="0"
INIT_DB_CODE="0"

init_users() {
  create_user "$DBA_NAME" "$DBA_USER" "$DBA_PASS"
  # Uncomment the following line to create user access from a remote IP.
  # create_user "$DBA_NAME" "$DBA_USER" "$DBA_PASS" "$REMOTE_IP"

  create_user "$DBL_NAME" "$DBL_USER" "$DBL_PASS"
  # Uncomment the following line to create user access from a remote IP.
  # create_user "$DBL_NAME" "$DBL_USER" "$DBL_PASS" "$REMOTE_IP"
}

init_db() {
  local DB_NAME=$1

  echo -e "${CYAN}Importing initial $DB_NAME database dump...${NC}"
  if sudo $MYSQL_CMD $DB_NAME < $SCRIPT_DIR/../sql/$DB_NAME.sql; then
    echo -e "${GREEN}Database $DB_NAME imported successfully.${NC}"
  else
    echo -e "${RED}Failed to import $DB_NAME.${NC}" >&2
    return 1;
  fi
}

create_database "$DBA_NAME"
create_database "$DBL_NAME"

if ! init_users; then
  INIT_USERS_CODE="1"
fi

sudo $MYSQL_CMD -e "FLUSH PRIVILEGES;"
echo -e "${GREEN}Databases and users created successfully.${NC}"

# These .sql files drop and recreate their respective databases.
# This makes it safe to re-run this script if it fails.
# However, running these SQL files manually or in another context could result in data loss.

if ! init_db "$DBA_NAME"; then
  INIT_DB_CODE="1"
fi

if ! init_db "$DBL_NAME"; then
  INIT_DB_CODE="1"
fi

if [ "$INIT_USERS_CODE" = "1" ] && [ "$INIT_DB_CODE" = "0" ]; then
  exit 10
elif [ "$INIT_USERS_CODE" = "1" ] && [ "$INIT_DB_CODE" = "1" ]; then
  exit 20
elif [ "$INIT_USERS_CODE" = "0" ] && [ "$INIT_DB_CODE" = "1" ]; then
  exit 30
else 
  exit 0
fi