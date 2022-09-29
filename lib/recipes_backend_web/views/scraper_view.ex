defmodule RecipesBackendWeb.ScraperView do
  use RecipesBackendWeb, :view
  alias RecipesBackendWeb.ScraperView

  def render("show.json", %{scraped_recipe: scraped_recipe}) do
    %{data: render_one(scraped_recipe, ScraperView, "scraped_recipe.json", as: :scraped_recipe)}
  end

  def render("scraped_recipe.json", %{scraped_recipe: scraped_recipe}) do
    %{
      title: Map.get(scraped_recipe, :title),
      description: Map.get(scraped_recipe, :description),
      servings: Map.get(scraped_recipe, :servings),
      kcal: Map.get(scraped_recipe, :kcal),
      imageUrl: Map.get(scraped_recipe, :image_url),
      ingredients:
        render_many(Map.get(scraped_recipe, :ingredients), ScraperView, "scraped_ingredient.json",
          as: :scraped_ingredient
        )
    }
  end

  def render("scraped_ingredient.json", %{scraped_ingredient: scraped_ingredient}) do
    %{
      name: scraped_ingredient.name,
      position: scraped_ingredient.position,
      quantity: Map.get(scraped_ingredient, :quantity),
      description: Map.get(scraped_ingredient, :description)
    }
  end
end
