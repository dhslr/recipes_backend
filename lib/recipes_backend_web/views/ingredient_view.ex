defmodule RecipesBackendWeb.IngredientView do
  use RecipesBackendWeb, :view
  alias RecipesBackendWeb.IngredientView

  def render("index.json", %{ingredients: ingredients}) do
    %{data: render_many(ingredients, IngredientView, "ingredient.json")}
  end

  def render("show.json", %{ingredient: ingredient}) do
    %{data: render_one(ingredient, IngredientView, "ingredient.json")}
  end

  def render("ingredient.json", %{ingredient: ingredient}) do
    %{
      name: ingredient.food.name,
      quantity: ingredient.quantity,
      description: ingredient.description,
      position: ingredient.position
    }
  end
end
