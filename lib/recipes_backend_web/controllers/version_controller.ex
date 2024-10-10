defmodule RecipesBackendWeb.VersionController do
  use RecipesBackendWeb, :controller

  def get(conn, _) do
    version = Application.get_env(:recipes_backend, :version)
    json(conn, %{data: %{version: version}})
  end
end
