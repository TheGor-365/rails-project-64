#!/usr/bin/env bash
# exit on error
set -o errexit

rails server -b 0.0.0.0 -p $PORT
