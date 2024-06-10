#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 EntityName"
    exit 1
fi

ENTITY=$1

# Navigate to the Symfony project directory
cd "$(dirname "$0")"

# Check if Composer is installed
if ! command_exists composer; then
    echo "Error: Composer is not installed. Please install Composer to continue."
    exit 1
fi

# Check if Symfony CLI is installed (optional but recommended)
if ! command_exists symfony; then
    echo "Warning: Symfony CLI is not installed. It is recommended for managing Symfony projects."
fi

# Function to install missing packages
install_missing_packages() {
    MISSING_PACKAGES=()
    REQUIRED_PACKAGES=("doctrine/orm" "symfony/form" "symfony/validator" "symfony/twig-bundle" "symfony/security-csrf")

    for PACKAGE in "${REQUIRED_PACKAGES[@]}"; do
        if ! composer show | grep -q "$PACKAGE"; then
            MISSING_PACKAGES+=("$PACKAGE")
        fi
    done

    if [ ${#MISSING_PACKAGES[@]} -ne 0 ]; then
        echo "Installing missing packages: ${MISSING_PACKAGES[*]}"
        composer require "${MISSING_PACKAGES[@]}"
    else
        echo "All required packages are already installed."
    fi
}

# Install missing packages
install_missing_packages

# Clear the cache (optional)
php bin/console cache:clear --env=dev

# Generate the entity
php bin/console make:entity "$ENTITY"

# Generate the CRUD for the specified entity
php bin/console make:crud "$ENTITY"

# Clear the cache (optional)
php bin/console cache:clear --env=dev

echo "CRUD for $ENTITY has been generated successfully."
