#!/usr/bin/env bash

echo '// Build'

rm -rf var/cache/* var/log/*
mkdir -p config/routings config/services config/services_test
composer --quiet --no-interaction install --optimize-autoloader --classmap-authoritative --ignore-platform-reqs
php bin/console --quiet --env=prod cache:clear
php bin/console --quiet --env=test cache:warm
