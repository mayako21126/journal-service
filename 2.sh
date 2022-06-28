#!/bin/sh
set -ea
echo "Build"

yarn add @strapi/strapi@4.1.11  --unsafe-perm=true --allow-root

yarn run build

echo "Starting your app..."

exec "$@"