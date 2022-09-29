defmodule RecipesBackendWeb.UserController do
  use RecipesBackendWeb, :controller

  action_fallback RecipesBackendWeb.FallbackController
  alias RecipesBackend.Accounts.User
  alias RecipesBackend.Repo

  def create(conn, %{"user" => user_params}) do
    user = conn.assigns.current_user
    if user.is_admin do
      changeset = User.changeset(%User{}, user_params)

      with {:ok, user} <- Repo.insert(changeset) do
        conn
        |> put_status(:created)
        |> render("show.json", user: user)
      end
    else
      {:error, :forbidden}
    end
  end
end
