defmodule RecipesBackend.Authentication do
  alias RecipesBackend.Accounts.{Session, User}
  alias RecipesBackend.Repo
  import Phoenix.Controller
  import Plug.Conn
  require Logger

  def init(options), do: options

  def call(conn, _opts) do
    with {:ok, token} <- find_token(conn),
         {:ok, user} <- find_user(token) do
      assign(conn, :current_user, user)
    else
      {:error, reason} -> auth_error!(conn, reason)
    end
  end

  defp find_token(conn) do
    auth_header =
      case get_req_header(conn, "authorization") do
        [header] -> header
        _ -> ""
      end

    case Regex.scan(~r/[Tt]oken\s+(.*)/, auth_header) do
      [[_, token]] -> {:ok, token}
      _ -> {:error, "Token not found"}
    end
  end

  defp find_user(token) do
    case Repo.get_by(Session, token: token) do
      nil -> {:error, "Session not found"}
      session -> user_from_session(session)
    end
  end

  defp user_from_session(session) do
    case Repo.get_by(User, id: session.user_id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end

  defp auth_error!(conn, reason) do
    Logger.info("Authentication error: #{reason}")

    conn
    |> put_status(:unauthorized)
    |> put_view(RecipesBackendWeb.ErrorView)
    |> render("401.json")
    |> halt()
  end
end
