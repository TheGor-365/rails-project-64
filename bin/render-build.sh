#!/usr/bin/env bash
set -e

bundle install
yarn install --frozen-lockfile || true
bundle exec rails assets:precompile
