FROM ruby:2.5.5-alpine3.10
# ruby:2.5
# RUN apt-get update -qq && apt-get install -y nodejs

RUN apk add --update \
  build-base \
  mariadb-dev \
  sqlite-dev \
  nodejs \
  tzdata \
  postgresql-client
  #\
  #&& rm -rf /var/cache/apk/*

RUN apk add --no-cache  bash
RUN gem install nokogiri

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]