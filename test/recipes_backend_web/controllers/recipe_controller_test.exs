defmodule RecipesBackendWeb.RecipeControllerTest do
  use RecipesBackendWeb.ConnCase

  alias RecipesBackend.Recipes
  alias RecipesBackend.Recipes.Recipe

  @create_attrs %{
    description: "some description",
    title: "some title",
    kcal: 100,
    servings: 1,
    ingredients: [
      %{
        name: "Lemon",
        quantity: 1.0,
        description: "Piece",
        position: 1
      }
    ]
  }

  @update_attrs %{
    description: "some updated description",
    title: "some updated title",
    kcal: 200,
    servings: 2,
    ingredients: [
      %{
        name: "Lemon",
        quantity: 1.0,
        description: "Piece",
        position: 1
      },
      %{
        name: "Sugar",
        description: "much",
        position: 2
      }
    ]
  }

  @invalid_attrs %{description: nil, title: nil}

  def fixture(:recipe) do
    {:ok, recipe} = Recipes.create_recipe(@create_attrs)
    recipe
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  setup [:with_user_token]

  describe "index" do
    test "lists all recipes", %{conn: conn} do
      conn = get(conn, Routes.recipe_path(conn, :index)) |> doc()

      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create recipe" do
    test "renders recipe when data is valid", %{conn: conn} do
      conn = post(conn, Routes.recipe_path(conn, :create), recipe: @create_attrs) |> doc()
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.recipe_path(conn, :show, id)) |> doc()

      assert %{
               "id" => ^id,
               "description" => "some description",
               "title" => "some title",
               "kcal" => 100,
               "servings" => 1,
               "ingredients" => [
                 %{
                   "name" => "Lemon",
                   "quantity" => 1.0,
                   "description" => "Piece",
                   "position" => 1
                 }
               ]
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.recipe_path(conn, :create), recipe: @invalid_attrs) |> doc()
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update recipe" do
    setup [:create_recipe]

    test "renders recipe when data is valid", %{conn: conn, recipe: %Recipe{id: id} = recipe} do
      conn = put(conn, Routes.recipe_path(conn, :update, recipe), recipe: @update_attrs) |> doc()
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.recipe_path(conn, :show, id)) |> doc()

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "title" => "some updated title",
               "kcal" => 200,
               "servings" => 2,
               "ingredients" => [
                 %{
                   "name" => "Lemon",
                   "quantity" => 1.0,
                   "description" => "Piece",
                   "position" => 1
                 },
                 %{
                   "name" => "Sugar",
                   "description" => "much",
                   "position" => 2
                 }
               ]
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, recipe: recipe} do
      conn = put(conn, Routes.recipe_path(conn, :update, recipe), recipe: @invalid_attrs) |> doc()
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete recipe" do
    setup [:create_recipe]

    test "deletes chosen recipe", %{conn: conn, recipe: recipe} do
      conn = delete(conn, Routes.recipe_path(conn, :delete, recipe)) |> doc()
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.recipe_path(conn, :show, recipe))
      end
    end
  end

  defp create_recipe(_) do
    recipe = fixture(:recipe)
    %{recipe: recipe}
  end
end
