defmodule RecipesBackend.Recipes.Ingredient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ingredients" do
    field :description, :string
    field :quantity, :float
    field :position, :integer, default: 0
    belongs_to :recipe, RecipesBackend.Recipes.Recipe
    belongs_to :food, RecipesBackend.Recipes.Food

    timestamps()
  end

  @doc false
  def changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, [:description, :quantity, :recipe_id, :food_id, :position])
    |> validate_required([:recipe_id, :food_id])
    |> foreign_key_constraint(:recipe_id)
    |> foreign_key_constraint(:food_id)
  end
end
