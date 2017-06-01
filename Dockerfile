FROM ruby:latest

RUN gem install jekyll bundler

WORKDIR /src

EXPOSE 4000

CMD bundle install && \
    jekyll serve --host=0.0.0.0
