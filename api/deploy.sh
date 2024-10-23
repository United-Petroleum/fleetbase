#!/bin/sh

# Exit the script as soon as a command fails
set -e

# Generate App Key
php artisan key:generate

# Create mysql databases if none exists
php artisan mysql:createdb

# Run migrations
php artisan migrate --force

# Run migrations for sandbox too
php artisan sandbox:migrate --force

# Seed database
php artisan fleetbase:seed

# Create permissions, policies, and roles
php artisan fleetbase:create-permissions

# Restart queue
php artisan queue:restart

# Sync scheduler
php artisan schedule-monitor:sync

# Clear cache
php artisan cache:clear

# Initialize registry
php artisan registry:init
