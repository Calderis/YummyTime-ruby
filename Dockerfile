FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /YummyTime
WORKDIR /YummyTime
ADD Gemfile /YummyTime/Gemfile
ADD Gemfile.lock /YummyTime/Gemfile.lock
RUN bundle install
ADD . /YummyTime