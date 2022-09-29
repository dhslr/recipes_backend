defmodule RecipesBackendWeb.ScraperController do
  use RecipesBackendWeb, :controller
  alias RecipesBackend.RecipeScraper

  action_fallback RecipesBackendWeb.FallbackController

  def get(conn, %{"url" => url}) do
    with {:ok, scraped_recipe} <- RecipeScraper.scrape(url) do
      conn
      |> put_status(:ok)
      |> render("show.json", scraped_recipe: scraped_recipe)
    end
  end

end
