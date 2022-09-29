defmodule RecipesBackend.Repo.Migrations.CreateIngredientPosition do
  use Ecto.Migration
  alias RecipesBackend.Recipes
  alias RecipesBackend.Recipes.Ingredient
  alias RecipesBackend.Recipes.Recipe

  def change do
    for recipe <- Recipes.list_recipes() do
      update_ingredients_in_recipe(recipe)
    end
  end

  defp update_ingredients_in_recipe(recipe = %Recipe{}) do
    updated_ingredients = recipe.ingredients
    |> Enum.with_index(1)
    |> Enum.map(&update_ingredient/1)
  end

  defp update_ingredient({ingredient, position}) do
    Recipes.update_ingredient(ingredient, %{position: position})
  end

end
