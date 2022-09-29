defmodule RecipesBackend.Recipes.Food do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food" do
    field :name, :string
    has_many :ingredients, RecipesBackend.Recipes.Ingredient

    timestamps()
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:name])
    |> unique_constraint([:name])
    |> validate_required([:name])
  end
end
