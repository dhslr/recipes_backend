use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :recipes_backend, RecipesBackend.Repo,
  username: "recipes",
  password: "recipes",
  database: "recipes_backend_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :recipes_backend, RecipesBackendWeb.Endpoint,
  http: [port: 4002],
  server: false

config :recipes_backend,
  http_client: RecipesBackend.HttpClient.Mock

config :recipes_backend,
  recipe_scraper: RecipesBackend.RecipeScraper.Mock

# Print only warnings and errors during test
config :logger, level: :warn

config :recipes_backend,
  photos_dir: "__testing_photos_dir"
