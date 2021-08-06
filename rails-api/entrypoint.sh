#!/usr/bin/env bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /rails-api/tmp/pids/server.pid
rake db:schema:load

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"