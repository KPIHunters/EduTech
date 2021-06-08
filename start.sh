#!/bin/sh
echo "Bundle check..."
bundle check || bundle install
yarn install

echo "Initializing database..."
RAILS_ENV=production bundle exec rake db:create
RAILS_ENV=production bundle exec rake db:recreate

echo "Cleaning tmp folder..."
rm tmp/* -Rf

# enable docker cache
rake dev:cache

echo "Starting server..."
RAILS_ENV=production bundle exec rails s -b 'ssl://0.0.0.0:3000?key=config/ssl/server.key&cert=config/ssl/server.crt'