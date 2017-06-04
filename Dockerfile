FROM ruby:latest

RUN gem install jekyll bundler execjs

WORKDIR /src

COPY ./Gemfile /src/Gemfile
RUN bundle install

ENV NODE_VERSION 6.10.3

RUN curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" \
  && tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local --strip-components=1 \
  && rm "node-v$NODE_VERSION-linux-x64.tar.xz" \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs

EXPOSE 4000

# CMD bundle exec jekyll serve --host=0.0.0.0
CMD bash
