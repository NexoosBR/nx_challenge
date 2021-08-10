FROM ruby:2.7

RUN apt-get update -qq
RUN apt-get install -y && dos2unix && git && openssh-server

ENV RAILS_ROOT /var/www/
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

# Authorize SSH Host
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan github.com > /root/.ssh/known_hosts
# Add the keys and set permissions
RUN echo ${ssh_prv_key} > /root/.ssh/id_ed25519 && \
    echo ${ssh_pub_key} > /root/.ssh/id_ed25519.pub && \
    chmod 600 /root/.ssh/id_ed25519 && \
    chmod 600 /root/.ssh/id_ed25519.pub

RUN git clone git@github.com:leandrolasnor/nx_challenge.git .
RUN gem install bundler && bundle install
COPY entrypoint.sh /usr/bin/
RUN dos2unix /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
RUN rake db:reset
EXPOSE 3000