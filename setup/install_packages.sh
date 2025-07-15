#!/bin/bash
set -e

echo -e "${CYAN}Updating package lists and installing required packages...${NC}"
sudo apt update
# Recommended in production; skip for quick testing.
# sudo apt upgrade -y
sudo apt install -y apache2 php php-mysql mysql-server

echo -e "${GREEN}Packages installed successfully.${NC}"