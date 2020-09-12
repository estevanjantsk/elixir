FROM elixir:latest

WORKDIR /app

RUN apt-get update \
  && curl -sL https://deb.nodesource.com/setup_13.x | bash \
  && apt-get install -y apt-utils \
  && apt-get install -y nodejs \
  && apt-get install -y build-essential \
  && apt-get install -y inotify-tools \
  && mix local.hex --force \
  && mix local.rebar --force

COPY . .

RUN mix do deps.get, compile

RUN cd ./assets \
  && npm install \
  && ./node_modules/webpack/bin/webpack.js --mode production \
  && cd .. \
  && mix phx.digest

EXPOSE 4000

CMD ["mix", "phx.server"]