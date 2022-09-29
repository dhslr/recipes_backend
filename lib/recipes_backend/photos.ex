defmodule RecipesBackend.Photos do
  require Logger
  alias RecipesBackend.Recipes.Photo
  alias RecipesBackend.Repo

  def create_photo(%{"upload" => %Plug.Upload{} = upload} = attrs) do
    with {:ok, %Photo{} = photo} <- create_photo_entry(attrs),
         {:ok, _} <- File.copy(upload.path, "#{filepath(photo)}") do
      {:ok, photo}
    end
  end

  defp create_photo_entry(attrs) do
    %Photo{}
    |> Photo.changeset(attrs)
    |> Repo.insert()
  end

  def get_photo!(id), do: Repo.get!(Photo, id)

  def delete_photo(%Photo{} = photo) do
    File.rm(filepath(photo))
    Repo.delete(photo)
  end

  defp filepath(%Photo{} = photo) do
    path = Path.join(Photo.photos_dir(), Photo.filename(photo))
    Logger.debug("Deleting photo #{path}")
    path
  end

end
