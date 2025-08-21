#!/usr/bin/env bash
set -e

until bundle exec rails db:version >/dev/null 2>&1; do
  echo "Waiting for database..."
  sleep 2
done

bundle exec rails db:migrate
bundle exec rails db:seed

exec bundle exec puma -C config/puma.rb
