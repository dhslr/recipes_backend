defmodule RecipesBackendWeb.ScraperControllerTest do
  use RecipesBackendWeb.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  setup [:with_user_token]

  defp mock_scraper(context) do
    Mox.expect(RecipesBackend.RecipeScraper.Mock, :scrape, fn _ ->
      {:ok,
       %{
         title: "Sample Recipe",
         servings: 4,
         kcal: 4000,
         image_url: "https://sample.org/recipe.jpg",
         ingredients: [
           %{
             name: "Sugar",
             quantity: 123.0,
             description: "g",
             position: 1
           },
           %{name: "Water", position: 2}
         ]
       }}
    end)

    context
  end

  describe "get scraped recipe" do
    setup :mock_scraper

    test "scraping recipe with url", %{conn: conn} do
      conn = get(conn, "/api/scraper/chefkoch", %{"url" => ""}) |> doc()
      resp = json_response(conn, 200)["data"]

      assert %{
               "title" => "Sample Recipe",
               "servings" => 4,
               "kcal" => 4000,
               "imageUrl" => "https://sample.org/recipe.jpg",
               "ingredients" => [
                 %{"name" => "Sugar", "quantity" => 123.0, "description" => "g", "position" => 1},
                 %{"name" => "Water", "position" => 2}
               ]
             } = resp
    end
  end
end
