defmodule RecipesBackendWeb.FoodView do
  use RecipesBackendWeb, :view
  alias RecipesBackendWeb.FoodView

  def render("index.json", %{food: food}) do
    %{data: render_many(food, FoodView, "food.json")}
  end

  def render("show.json", %{food: food}) do
    %{data: render_one(food, FoodView, "food.json")}
  end

  def render("food.json", %{food: food}) do
    %{id: food.id, name: food.name}
  end
end
