ARG MIX_ENV="prod"

FROM hexpm/elixir:1.14.0-erlang-25.1.1-alpine-3.16.2 AS build

# install build dependencies
RUN apk add --no-cache build-base

# prepare build dir
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# set build ENV
ARG MIX_ENV
ENV MIX_ENV="${MIX_ENV}"

# install mix dependencies
COPY mix.exs mix.lock ./

RUN mix phx.digest

RUN mix deps.get --only $MIX_ENV
RUN mkdir config

COPY config/config.exs config/${MIX_ENV}.exs config/
RUN mix deps.compile

COPY priv priv

# Compile the release
COPY lib lib

RUN mix compile

# Changes to config/runtime.exs don't require recompiling the code
COPY config/runtime.exs config/

COPY rel rel
RUN mix release

# prepare release image
FROM alpine:3.16.2 AS app
RUN apk add --no-cache openssl ncurses-libs libstdc++


ARG MIX_ENV
ENV USER="elixir"

WORKDIR "/home/${USER}/app"
# Creates an unprivileged user to be used exclusively to run the Phoenix app
RUN \
  addgroup \
   -g 1000 \
   -S "${USER}" \
  && adduser \
   -s /bin/sh \
   -u 1000 \
   -G "${USER}" \
   -h "/home/${USER}" \
   -D "${USER}" \
  && su "${USER}"


# Everything from this line onwards will run in the context of the unprivileged user.

COPY --from=build --chown="${USER}":"${USER}" /app/_build/${MIX_ENV}/rel/recipes_backend ./
COPY --chown="${USER}":"${USER}" photos ./photos

USER "${USER}"

# Usage:
#  * build: sudo docker image build -t elixir/recipes_backend .
#  * run:   sudo docker container run --rm -it -p 127.0.0.1:4000:4000 --name recipes_backend elixir/recipes_backend
#  * exec:  sudo docker container exec -it recipes_backend sh
#  * logs:  sudo docker container logs --follow --tail 100 recipes_backend

CMD ["sh", "-c", "/home/${USER}/app/bin/migrate && /home/${USER}/app/bin/server"]

