FROM ruby:2.3.0-alpine

RUN apk add --update --no-cache \
      build-base \
      nodejs \
      tzdata \
      libxml2-dev \
      libxslt-dev \
      git \
      imagemagick
RUN bundle config build.nokogiri --use-system-libraries

ENV APP_HOME /usr/src/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

EXPOSE 3000

ENV BUNDLE_PATH /ruby_gems
ADD . $APP_HOME

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
