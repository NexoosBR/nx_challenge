FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y dos2unix 
ENV RAILS_ROOT /var/www/
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT
COPY Gemfile /$RAILS_ROOT/Gemfile
COPY Gemfile.lock /$RAILS_ROOT/Gemfile.lock
RUN gem install bundler && bundle install
COPY . /$RAILS_ROOT
COPY entrypoint.sh /usr/bin/
RUN dos2unix /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000