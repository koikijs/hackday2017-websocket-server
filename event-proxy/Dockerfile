FROM ruby
ENV APP_ROOT /usr/src/app
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT
RUN bundle install --path vendor/bundle
COPY ./ $APP_ROOT

EXPOSE 4567
CMD ["bundle", "exec", "ruby", "app.rb", "-o", "0.0.0.0"]
