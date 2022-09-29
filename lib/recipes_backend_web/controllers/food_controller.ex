defmodule RecipesBackendWeb.FoodController do
  use RecipesBackendWeb, :controller

  alias RecipesBackend.Recipes
  alias RecipesBackend.Recipes.Food

  action_fallback RecipesBackendWeb.FallbackController

  def index(conn, _params) do
    food = Recipes.list_food()
    render(conn, "index.json", food: food)
  end

  def create(conn, %{"food" => food_params}) do
    with {:ok, %Food{} = food} <- Recipes.create_food(food_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.food_path(conn, :show, food))
      |> render("show.json", food: food)
    end
  end

  def show(conn, %{"id" => id}) do
    food = Recipes.get_food!(id)
    render(conn, "show.json", food: food)
  end

  def update(conn, %{"id" => id, "food" => food_params}) do
    food = Recipes.get_food!(id)

    with {:ok, %Food{} = food} <- Recipes.update_food(food, food_params) do
      render(conn, "show.json", food: food)
    end
  end

  def delete(conn, %{"id" => id}) do
    food = Recipes.get_food!(id)

    with {:ok, %Food{}} <- Recipes.delete_food(food) do
      send_resp(conn, :no_content, "")
    end
  end
end
