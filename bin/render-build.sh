#!/usr/bin/env bash
set -e

bundle install
yarn install --frozen-lockfile || true

bundle exec rake assets:precompile
bundle exec rake db:migrate
bundle exec rake db:seed
