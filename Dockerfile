FROM ruby:2.5.5-alpine3.10
# ruby:2.5
# RUN apt-get update -qq && apt-get install -y nodejs
NAME 'ruby-docker-upload-github'

RUN apk add --update \
  build-base \
  tzdata \
  postgresql-client

# RUN apk add --no-cache  bash
# RUN gem install nokogiri

WORKDIR /export/rails/site_1

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]