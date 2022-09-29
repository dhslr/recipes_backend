defmodule RecipesBackendWeb.SessionController do
  use RecipesBackendWeb, :controller
  alias Plug.BasicAuth
  alias RecipesBackend.Accounts

  action_fallback RecipesBackendWeb.FallbackController

  def create(conn, _) do
    with {:ok, user_agent} <- get_user_agent(conn),
         {email, password} <- BasicAuth.parse_basic_auth(conn),
         {:ok, %{id: user_id}} <- Accounts.verify_user(email, password),
         {:ok, session} <- Accounts.create_session(%{user_id: user_id, user_agent: user_agent}) do
      conn
      |> put_status(:created)
      |> render("show.json", session: session)
    else
      :error -> {:error, :unauthorized}
      res -> res
    end
  end

  defp get_user_agent(conn) do
    case get_req_header(conn, "user-agent") do
      [user_agent] -> {:ok, user_agent}
      _ -> {:error, "User-Agent must be provided"}
    end
  end
end
