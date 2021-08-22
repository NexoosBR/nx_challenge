FROM ruby:2.7.2-alpine

RUN apk add --update build-base \
    shared-mime-info \
    sqlite-dev \
    tzdata
RUN gem install rails -v '6.1.3'

WORKDIR /var/www/
ADD Gemfile Gemfile.lock /var/www/
RUN bundle install
