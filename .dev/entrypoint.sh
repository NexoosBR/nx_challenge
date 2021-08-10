#!/usr/bin/env bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /rails-api/tmp/pids/server.pid
rake log:clear
rake db:migrate RAILS_ENV=test
rake db:migrate

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"