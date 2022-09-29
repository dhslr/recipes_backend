defmodule RecipesBackendWeb.RecipeController do
  @moduledoc """
    RecipeController recipe CRUD operations.
  """
  use RecipesBackendWeb, :controller

  alias RecipesBackend.Recipes
  alias RecipesBackend.Recipes.Recipe

  action_fallback RecipesBackendWeb.FallbackController

  @doc """
    List all recipes
  """
  def index(conn, _params) do
    recipes = Recipes.list_recipes()
    render(conn, "index.json", recipes: recipes)
  end

  @doc """
    Creates a new recipe and the given ingredients
  """
  def create(conn, %{"recipe" => recipe_params}) do
    with {:ok, %Recipe{} = recipe} <- Recipes.create_recipe(recipe_params) do
      create_ingredients_for_recipe(Map.get(recipe_params, "ingredients", []), recipe.id)

      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.recipe_path(conn, :show, recipe))
      |> render("show.json", recipe: recipe)
    end
  end

  defp create_ingredients_for_recipe(ingredients, recipe_id) do
    for ingredient <- ingredients do
      {:ok, food} = Recipes.get_or_create_food(ingredient["name"])

      Recipes.create_ingredient(%{
        food_id: food.id,
        recipe_id: recipe_id,
        quantity: ingredient["quantity"],
        position: ingredient["position"],
        description: ingredient["description"]
      })
    end
  end

  @doc """
    Show single recipe
  """
  def show(conn, %{"id" => id}) do
    recipe = Recipes.get_recipe!(id)
    render(conn, "show.json", recipe: recipe)
  end

  @doc """
    Update an existing recipe
  """
  def update(conn, %{"id" => id, "recipe" => recipe_params}) do
    recipe = Recipes.get_recipe!(id)
    for ingredient <- recipe.ingredients, do: Recipes.delete_ingredient(ingredient)
    create_ingredients_for_recipe(Map.get(recipe_params, "ingredients", []), recipe.id)

    with {:ok, %Recipe{} = recipe} <- Recipes.update_recipe(recipe, recipe_params) do
      render(conn, "show.json", recipe: recipe)
    end
  end

  @doc """
    Delete recipe
  """
  def delete(conn, %{"id" => id}) do
    recipe = Recipes.get_recipe!(id)

    with {:ok, %Recipe{}} <- Recipes.delete_recipe(recipe) do
      send_resp(conn, :no_content, "")
    end
  end
end
