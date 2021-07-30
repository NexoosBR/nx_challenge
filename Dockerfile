FROM ruby:2.7.2-alpine
RUN apk update \
 && apk add --no-cache  \
    build-base  \
    ruby-dev \
    sqlite-dev \
    tzdata \
    sqlite \
    sqlite-libs \
    bash

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock  /tmp/Gemfile.lock
RUN bundle install
COPY . /app

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
