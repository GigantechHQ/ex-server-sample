# Set the Docker image you want to base your image off.
# I chose this one because it has Elixir preinstalled.
FROM trenpixster/elixir:1.4.1

# Install other stable dependencies that don't change often

# Compile app
RUN mkdir /app
WORKDIR /app

# Install Elixir Deps
ADD mix.* ./
RUN MIX_ENV=prod mix local.rebar
RUN MIX_ENV=prod mix local.hex --force
RUN MIX_ENV=prod mix deps.get

# Install app
ADD . .
RUN MIX_ENV=prod mix release

# Exposes this port from the docker container to the host machine
EXPOSE 4000

# The command to run when this image starts up
CMD MIX_ENV=prod _build/prod/rel/ggtserver/bin/ggtserver foreground
