FROM ruby:2.3.0-slim

RUN apt-get update && apt-get install -y --no-install-recommends build-essential nodejs imagemagick && rm -rf /var/lib/apt/lists/*

ENV APP_HOME /usr/src/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

EXPOSE 3000

ENV BUNDLE_PATH /ruby_gems
ADD . $APP_HOME

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
