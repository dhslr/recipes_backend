defmodule RecipesBackendWeb.RecipeView do
  use RecipesBackendWeb, :view
  alias RecipesBackendWeb.RecipeView
  alias RecipesBackendWeb.IngredientView
  alias RecipesBackendWeb.PhotoView

  def render("index.json", %{recipes: recipes}) do
    %{data: render_many(recipes, RecipeView, "recipe.json")}
  end

  def render("show.json", %{recipe: recipe}) do
    %{data: render_one(recipe, RecipeView, "recipe.json")}
  end

  def render("recipe.json", %{recipe: recipe}) do
    %{
      id: recipe.id,
      title: recipe.title,
      description: recipe.description,
      kcal: recipe.kcal,
      servings: recipe.servings,
      ingredients: render_many(recipe.ingredients, IngredientView, "ingredient.json"),
      photos: render_many(recipe.photos, PhotoView, "photo.json")
    }
  end
end
