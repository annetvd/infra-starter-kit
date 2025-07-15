#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source $SCRIPT_DIR/../config/.env.sh
source $SCRIPT_DIR/../config/colors.sh

start_services() {
  # Set ServerName as localhost.
  if ! grep -q "^ServerName" /etc/apache2/apache2.conf; then
    echo "ServerName localhost" | sudo tee -a /etc/apache2/apache2.conf > /dev/null
  fi

  if ! sudo service apache2 status | grep -q "active (running)"; then
    sudo service apache2 start
  else
    echo -e "${GREEN}Apache is already running.${NC}"
  fi

  if ! sudo service mysql status | grep -q "active (running)"; then
    sudo service mysql start
  else
    echo -e "${GREEN}MySQL is already running.${NC}"
  fi
  
  echo -e "${YELLOW}[INFO] Skipping both apache2 and MySQL enablement checks (not supported in Codespaces).${NC}"
}

echo -e "${CYAN}Starting server setup...${NC}"

# chmod +x $SCRIPT_DIR/../setup/install_packages.sh
# $SCRIPT_DIR/../setup/install_packages.sh

echo -e "${CYAN}Starting Apache and MySQL services...${NC}"
if start_services; then
  echo -e "${GREEN}Services started successfully.${NC}"
else
  echo -e "${RED}Failed to start services. Please ensure the system is able to start them before continuing.${NC}"
  exit 1
fi

echo -e "${YELLOW}[INFO] To secure your MySQL installation, run the following manually: sudo mysql_secure_installation${NC}"

chmod +x $SCRIPT_DIR/../setup/setup_db.sh
echo -e "${CYAN}Initializing databases setup...${NC}"
if $SCRIPT_DIR/../setup/setup_db.sh; then
  echo -e "${GREEN}Databases setup successfully.${NC}"
else
  code=$?
  if [ "$code" = "10" ]; then
    echo -e "${RED}User creation failed.${NC}" >&2
  elif [ "$code" = "20" ]; then
    echo -e "${RED}Both user creation and database import failed.${NC}" >&2
  elif [ "$code" = "30" ]; then
    echo -e "${RED}Database import failed.${NC}" >&2
  else
    echo -e "${RED}An unexpected error occurred. Database setup did not complete (code $code).${NC}" >&2
  fi
  exit 1
fi

echo -e "${GREEN}Setup completed successfully.${NC}"