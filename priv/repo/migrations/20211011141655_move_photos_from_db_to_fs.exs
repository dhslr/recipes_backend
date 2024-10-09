defmodule RecipesBackend.Repo.Migrations.MovePhotosFromDbToFs do
  use Ecto.Migration
  alias RecipesBackend.Recipes.Photo
  alias RecipesBackend.Repo

  def change do
    if File.exists?(Photo.photos_dir()) do
      save_all_photos()
    end
  end

  def save_all_photos() do
    photos_dir = Photo.photos_dir()

    Repo.all(Photo)
    |> Enum.map(fn photo ->
      filename = "#{photos_dir}/#{Photo.filename(photo)}"
      File.write!(filename, photo.data)
    end)
  end
end
