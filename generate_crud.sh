#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 EntityName"
    exit 1
fi

ENTITY=$1

# Navigate to the Symfony project directory
cd "$(dirname "$0")"

# Install missing packages
composer require orm symfony/form symfony/validator --no-update

# Update dependencies
composer update

# Clear the cache (optional)
php bin/console cache:clear --env=dev

# Generate the entity
php bin/console make:entity $ENTITY

# Generate the CRUD for the specified entity
php bin/console make:crud $ENTITY

# Clear the cache (optional)
php bin/console cache:clear --env=dev

echo "CRUD for $ENTITY has been generated successfully."
