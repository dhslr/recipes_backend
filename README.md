# RecipesBackend

To start your Phoenix server locally:

  * Setup the project with `mix setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Build with docker
This project contains a `Dockerfile` to build and deploy the application in a docker container.

## Build the image

```sh
docker build . --tag recipes_backend:0.0.1
```
## Run the image

Before you run the image, make sure to pass the required environment configuration variables. You can create a `.env` file with the following content:

```sh
DATABASE_URL=ecto://<username>:<password>@<hostname>/<db_name>
SECRET_KEY_BASE=<key generated with mix phx.gen.secret>
```

Replace the values matching your environment. Then run

```sh
docker run -p 4000:4000 --env-file=.env --rm recipes_backend:0.0.1 bin/recipes_backend start
```

For more information check the phoenix [deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Docker-compose
You can also use `docker-compose` which automatically respects the `.env` file.

```sh
docker-compose up -d
docker-compose  run --rm app bin/recipes_backend eval "RecipesBackend.Release.migrate"
```

## Backup

```sh
docker-compose run --rm -e PGPASSWORD="postgres" db /usr/bin/pg_dump -h db --no-owner -U postgres recipes --no-password > dump.sql
```

```sh
docker-compose run --rm -e PGPASSWORD="postgres" db /usr/bin/psql -h db -U postgres recipes < dump.sql
```

## API Docs
API docs can be found in [API](./API.md). The docs are generated when

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
