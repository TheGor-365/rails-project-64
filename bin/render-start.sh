#!/usr/bin/env bash
# exit on error
set -o errexit

exec foreman start -f Procfile.dev "$@"
