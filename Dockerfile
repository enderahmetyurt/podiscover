ARG RUBY_VERSION=3.2.2
# Use the official Ruby image as the parent image
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base

# Set the working directory to /app
WORKDIR /app

# Set production environment this values will be overwritten at with docker-compose.yml
ARG BUNDLE_WITHOUT
ENV BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true" \
    BUNDLE_WITHOUT="${BUNDLE_WITHOUT}"

# Throw-away build stage to reduce size of final image
FROM base as build

# Install libvips for Active Storage preview support
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    git \
    pkg-config \
    libpq-dev \
    postgresql-client \
    nodejs

# Copy the Gemfile and Gemfile.lock into the image
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

# Copy the rest of the application code into the image
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Precompiling assets for container without requiring secret RAILS_MASTER_KEY
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec bin/rails assets:precompile
RUN bundle exec rake tailwindcss:build

FROM base

# Install packages needed for deployment
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y postgresql-client nodejs && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Copy built artifacts: gems, application
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /app /app

# Expose port 3000 for the Rails server
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
