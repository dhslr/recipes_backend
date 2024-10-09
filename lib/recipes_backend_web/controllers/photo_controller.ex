defmodule RecipesBackendWeb.PhotoController do
  use RecipesBackendWeb, :controller

  action_fallback RecipesBackendWeb.FallbackController
  alias RecipesBackend.Photos
  alias RecipesBackend.Recipes.Photo

  @spec create(any, %{optional(:__struct__) => none, optional(atom | binary) => any}) :: any
  def create(conn, attrs = %{"upload" => %Plug.Upload{}}) do
    with {:ok, %Photo{} = photo} <- Photos.create_photo(attrs) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.photo_path(conn, :show, photo))
      |> render("show.json", photo: photo)
    end
  end

  def show(conn, %{"id" => id}) do
    photo = Photos.get_photo!(id)
    render(conn, "show.json", photo: photo)
  end

  def delete(conn, %{"id" => id}) do
    photo = Photos.get_photo!(id)

    with {:ok, %Photo{}} <- Photos.delete_photo(photo) do
      send_resp(conn, :no_content, "")
    end
  end
end
