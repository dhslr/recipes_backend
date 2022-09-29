defmodule RecipesBackend.Repo do
  use Ecto.Repo,
    otp_app: :recipes_backend,
    adapter: Ecto.Adapters.Postgres
end
