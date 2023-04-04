# Use the official Ruby image as the parent image
FROM ruby:3.2.1

# Set the working directory to /app
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the image
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install
RUN gem install rspotify
RUN gem install 'tailwindcss-rails'


# Copy the rest of the application code into the image
COPY . .

# Expose port 3000 for the Rails server
EXPOSE 3000

RUN ruby -v

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
