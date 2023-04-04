# Podiscover

Find your next podcast.

www.podiscover.me

## Development Setup

### Prerequisites

- Spotify Developer ClientID and Secret from [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/) 
    - Check routes.rb file to add callback url. It seems to be `http://localhost:3000/users/auth/spotify` or `http://localhost:3000/users/callback` couldn't get it work.

- Create .env file and update `SPOTIFY_CLIENT_ID` and `SPOTIFY_SECRET_ID` with your Spotify Developer ClientID and Secret.

- Update Gemfile and Gemfile.lock with Gemfile.lock.docker and Gemfile.docker or run the following commands:

```bash
cp Gemfile Gemfile.github
cp Gemfile.lock Gemfile.lock.github
cp Gemfile.docker Gemfile
cp Gemfile.lock.docker Gemfile.lock
```

- To revert copy the files back:

```bash
cp Gemfile Gemfile.docker
cp Gemfile.lock Gemfile.lock.docker
mv Gemfile.github Gemfile
mv Gemfile.lock.github Gemfile.lock
```

- Run the following commands to build the docker image and run the app, then run migrations and install tailwindcss with bash commands:

```bash
docker-compose up
docker-compose run app bin/rails db:migrate
```

You can visit http://localhost:3000 to view the app.




