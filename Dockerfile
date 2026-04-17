FROM ruby:3.1-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

WORKDIR /srv/slate

COPY Gemfile Gemfile.lock ./
RUN bundle install

EXPOSE 4567

COPY . /srv/slate

RUN chmod +x /srv/slate/slate.sh

ENTRYPOINT ["/srv/slate/slate.sh"]
CMD ["build"]
