FROM ruby:2.6
RUN apt-get update -qq && \
    apt-get install -y ruby-bundler nodejs
COPY Gemfile /tmp/
COPY Gemfile.lock /tmp/
RUN cd /tmp && \
    bundle update --bundler && \
    bundle install
COPY . /app
WORKDIR /app
RUN bundle update --bundler && \
    bundle install
ENV PORT=${PORT:-3000}
CMD ["bash", "-c", "rails server -p $PORT"]
