FROM ruby:3.3-bookworm

WORKDIR /srv/jekyll

COPY Gemfile Gemfile.lock ./
RUN bundle config set --local path /usr/local/bundle \
    && bundle install

COPY . .

RUN bundle exec jekyll build

EXPOSE 4000
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000"]
