FROM ruby:2.6.5

RUN gem install bundler

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y yarn nodejs

ENV APP_DIR=/app

RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR

# Cache bundle & yarn install + precompile production
COPY Gemfile* ./
COPY . $APP_DIR
RUN bundle config --global frozen 1
#RUN bundle install --without development test
RUN bundle config set --local without 'development test'
RUN bundle install
RUN yarn install
RUN DB_ADAPTER=nulldb RAILS_ENV=production bundle exec rake DATABASE_URL=mysql2:does_not_exist assets:precompile
#RUN RAILS_ENV=production bundle exec rake DATABASE_URL=mysql:does_not_exist assets:precompile

#RUN rails db:environment:set RAILS_ENV=development
