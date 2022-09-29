defmodule RecipesBackendWeb.PhotoControllerTest do
  use RecipesBackendWeb.ConnCase

  alias RecipesBackend.Photos
  alias RecipesBackend.Recipes
  alias RecipesBackend.Recipes.Photo

  setup_all do
    File.mkdir!(Photo.photos_dir())
    on_exit(fn -> File.rm_rf!(Photo.photos_dir()) end)
    :ok
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  setup [:with_user_token]

  describe "create" do
    test "uploading photo data creates photo with caption", %{conn: conn} do
      recipe = recipe_fixture(:recipe)

      upload = %Plug.Upload{path: "test/fixtures/test_image.jpg", filename: "test_image.jpg"}

      conn =
        post(conn, Routes.photo_path(conn, :create), %{
          :upload => upload,
          :recipe_id => recipe.id,
          :caption => "test caption"
        })
        |> doc()

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn =
        get(conn, Routes.photo_path(conn, :show, id))
        |> doc()

      resp = json_response(conn, 200)["data"]

      assert %{
               "id" => id,
               "caption" => "test caption",
               "href" => href
             } = resp

      assert href == "photos/recipe_#{recipe.id}_#{id}.jpg"
    end

    test "photo withouth caption", %{conn: conn} do
      recipe = recipe_fixture(:recipe)

      upload = %Plug.Upload{path: "test/fixtures/test_image.jpg", filename: "test_image.jpg"}

      conn =
        post(conn, Routes.photo_path(conn, :create), %{:upload => upload, :recipe_id => recipe.id})
        |> doc()

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn =
        get(conn, Routes.photo_path(conn, :show, id))
        |> doc()

      assert %{
               "id" => id,
               "href" => href
             } = json_response(conn, 200)["data"]

      assert href == "photos/recipe_#{recipe.id}_#{id}.jpg"
    end
  end

  describe "delete" do
    setup [:create_photo]

    test "deletes the photo by id", %{conn: conn, photo: photo} do
      conn = delete(conn, Routes.photo_path(conn, :delete, photo)) |> doc()

      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.photo_path(conn, :show, photo))
      end
    end
  end

  defp create_photo(_) do
    photo = fixture()
    %{photo: photo}
  end

  defp fixture() do
    recipe = recipe_fixture(:recipe)
    upload = %Plug.Upload{path: "test/fixtures/test_image.jpg", filename: "test_image.jpg"}

    {:ok, photo} =
      Photos.create_photo(%{
        "caption" => "photo caption",
        "recipe_id" => recipe.id,
        "upload" => upload
      })

    photo
  end

  defp recipe_fixture(:recipe) do
    {:ok, recipe} = Recipes.create_recipe(%{title: "test"})
    recipe
  end
end
