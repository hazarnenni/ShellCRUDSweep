# Symfony CRUD Automation

This project sets up a Symfony application and includes a shell script to automate the generation of CRUD operations for entities.

## Prerequisites

- PHP 8.2 or higher
- Composer
- Symfony CLI (optional, for easier development)
- Git Bash (for Windows users)

## Installation

### Step 1: Install PHP 8.2

#### Ubuntu/Linux

Add the PHP repository and install PHP 8.2:

```sh
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php8.2 php8.2-cli php8.2-fpm php8.2-mysql php8.2-xml php8.2-mbstring php8.2-curl php8.2-zip php8.2-gd php8.2-intl php8.2-soap php8.2-bcmath php8.2-opcache
```
Update the default PHP version:
```sh
sudo update-alternatives --set php /usr/bin/php8.2
sudo update-alternatives --set phpize /usr/bin/phpize8.2
sudo update-alternatives --set php-config /usr/bin/php-config8.2
```
#### macOS
Use Homebrew to install PHP 8.2:
```sh
brew install php@8.2
brew link --force --overwrite php@8.2
```
#### Windows

Use the official PHP for Windows binaries:

1- Download PHP from windows.php.net/download.
2- Extract the PHP files to a directory (e.g., C:\php).
3- Add the PHP directory to your PATH environment variable.

### Step 2: Clone the Symfony Project

Use the git clone commande to clone the project.

### Step 3: Install the Maker Bundle
Install the Symfony Maker Bundle to generate entities and CRUD operations:
```sh
composer require symfony/maker-bundle --dev
```
## Shell Script for CRUD Generation
### Step 4: Create the Shell Script
The " generate_crud.sh " script should be placed in the root of your Symfony project directory and made executable:

Make the script executable:
```sh
chmod +x generate_crud.sh
```
## Usage
To generate CRUD operations for an entity, run the script with the entity name as an argument:
```sh
./generate_crud.sh EntityName
```
=> Replace EntityName with the name of your entity (e.g., Product).

## Example
Generate CRUD operations for a Product entity:
```sh
./generate_crud.sh Product
```
This will generate the necessary files and configurations for creating, reading, updating, and deleting Product entities.

## Additional Information
* Symfony Documentation: https://symfony.com/doc/current/index.html
* PHP Documentation: https://www.php.net/docs.php
* Composer Documentation: https://getcomposer.org/doc/
