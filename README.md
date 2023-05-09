# Podiscover

Find your next podcast.

## Development Setup

### Prerequisites

- Spotify Developer ClientID and Secret from [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/) 
    - Add callback url as `http://localhost:3000/users/auth/spotify/callback`.

- Create .env file and update `SPOTIFY_CLIENT_ID` and `SPOTIFY_SECRET_ID` with your Spotify Developer ClientID and Secret.

- Install Postgresql client for avoiding `pg` gem installation error: `brew install postgresql` for Mac.

- Run the following commands to build the docker image and run the app, then run migrations with bash commands:

```bash
# Build the docker image and run the app -d for detached mode
docker-compose up

# Create database if this is first setup
docker-compose run app bin/rails db:create

# Run migrations
docker-compose run app bin/rails db:migrate

# Precompile assets if needed
# bundle exec rails assets:precompile

# If tailwindcss upgraded and given an error
# bundle exec rake tailwindcss:build
```

You can visit http://localhost:3000 to view the app.

## Status Badges
[![Ruby CI](https://github.com/enderahmetyurt/podiscover/actions/workflows/compile.yml/badge.svg?branch=main)](https://github.com/enderahmetyurt/podiscover/actions/workflows/compile.yml)
