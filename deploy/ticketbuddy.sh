#!/bin/sh
set -e

APP_DIR="/opt/ticketbuddy_payments/qp-easypay"
BRANCH="main"

cd "$APP_DIR"

git fetch origin
git reset --hard origin/$BRANCH
git clean -fd

php artisan optimize:clear
php artisan optimize
