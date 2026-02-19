#!/bin/sh
set -e

APP_DIR="/opt/ezeepluspay.sandbox/qp-easypay"
BRANCH="main"

cd "$APP_DIR"

echo "📥 Fetching latest code"
git fetch origin
git reset --hard origin/$BRANCH
git clean -fd

echo "🧹 Clearing Laravel caches"
php artisan optimize:clear
rm -rf storage/framework/views/*

echo "⚡ Optimizing"
php artisan optimize

