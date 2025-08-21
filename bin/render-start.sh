#!/usr/bin/env bash
set -e
set -euo pipefail
set -x

bundle exec rails db:prepare
bundle exec rails db:seed

exec bundle exec puma -C config/puma.rb
