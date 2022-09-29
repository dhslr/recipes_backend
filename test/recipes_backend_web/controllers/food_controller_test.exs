defmodule RecipesBackendWeb.FoodControllerTest do
  use RecipesBackendWeb.ConnCase

  alias RecipesBackend.Recipes
  alias RecipesBackend.Recipes.Food

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:food) do
    {:ok, food} = Recipes.create_food(@create_attrs)
    food
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  setup [:with_user_token]

  describe "index" do
    test "lists all food", %{conn: conn} do
      conn =
        get(conn, Routes.food_path(conn, :index))
        |> doc()

      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create food" do
    test "renders food when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.food_path(conn, :create), food: @create_attrs)
        |> doc()

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn =
        get(conn, Routes.food_path(conn, :show, id))
        |> doc()

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.food_path(conn, :create), food: @invalid_attrs)
        |> doc()

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update food" do
    setup [:create_food]

    test "renders food when data is valid", %{conn: conn, food: %Food{id: id} = food} do
      conn =
        put(conn, Routes.food_path(conn, :update, food), food: @update_attrs)
        |> doc()

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn =
        get(conn, Routes.food_path(conn, :show, id))
        |> doc()

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, food: food} do
      conn = put(conn, Routes.food_path(conn, :update, food), food: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete food" do
    setup [:create_food]

    test "deletes chosen food", %{conn: conn, food: food} do
      conn =
        delete(conn, Routes.food_path(conn, :delete, food))
        |> doc()

      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.food_path(conn, :show, food))
      end
    end
  end

  defp create_food(_) do
    food = fixture(:food)
    %{food: food}
  end
end
