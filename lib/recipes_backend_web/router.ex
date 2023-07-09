defmodule RecipesBackendWeb.Router do
  use RecipesBackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug RecipesBackend.Authentication
  end

  pipeline :browser do
    plug(:accepts, ["html"])
    # TODO maybe add plugs here like in oders
  end

  pipeline :no_auth do
    plug :accepts, ["json"]
  end

  scope "/api", RecipesBackendWeb do
    pipe_through :no_auth
    resources "/sessions", SessionController, only: [:create]
  end

  scope "/api", RecipesBackendWeb do
    pipe_through :api

    resources "/food", FoodController, except: [:new, :edit]
    resources "/photos", PhotoController, except: [:new, :edit, :update, :index]
    resources "/recipes", RecipeController, except: [:new, :edit]
    get "/scraper/chefkoch", ScraperController, :get
    resources "/users", UserController, only: [:create]
    get "/version", VersionController, :get
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: RecipesBackendWeb.Telemetry
    end
  end
end
