defmodule RecipesBackendWeb.PhotoView do
  use RecipesBackendWeb, :view
  alias RecipesBackend.Recipes.Photo
  alias RecipesBackendWeb.PhotoView

  def render("index.json", %{photo: photo}) do
    %{data: render_many(photo, PhotoView, "photo.json")}
  end

  def render("show.json", %{photo: photo}) do
    %{data: render_one(photo, PhotoView, "photo.json")}
  end

  def render("photo.json", %{photo: photo}) do
    %{
      id: photo.id,
      href: "photos/#{Photo.filename(photo)}",
      caption: photo.caption,
      recipeId: photo.recipe_id
    }
  end
end
