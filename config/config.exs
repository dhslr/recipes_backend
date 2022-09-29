# General application configuration
import Config

config :recipes_backend,
  ecto_repos: [RecipesBackend.Repo]

# Configures the endpoint
config :recipes_backend, RecipesBackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HTPGrlF5RBDMZHT27X87cFd3wAt4aFrz7S5AMxQjMq2ayHt2IxSlGtvHaRM/isCa",
  render_errors: [view: RecipesBackendWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: RecipesBackend.PubSub,
  live_view: [signing_salt: "TgjfV8OA"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :recipes_backend,
  http_client: HTTPoison

config :recipes_backend,
  recipe_scraper: RecipesBackend.RecipeScraper.Chefkoch

config :recipes_backend,
  version: Mix.Project.config[:version]

config :recipes_backend,
  photos_dir: "./photos"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
