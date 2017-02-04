FROM ruby
ENV APP_ROOT /usr/src/app
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT
RUN bundle install --path vendor/bundle

COPY . $APP_ROOT

EXPOSE 8888
CMD ["bundle", "exec", "ruby", "websocket-server.rb"]
