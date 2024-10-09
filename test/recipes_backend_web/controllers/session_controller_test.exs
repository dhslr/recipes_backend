defmodule RecipesBackendWeb.SessionControllerTest do
  use RecipesBackendWeb.ConnCase
  alias Plug.BasicAuth
  alias RecipesBackend.Accounts.Session
  alias RecipesBackend.Accounts.User
  alias RecipesBackend.Accounts
  alias RecipesBackend.Repo

  @user %{email: "foo@bar.com", password: "s3cr3t"}
  @user_agent "some_agent/1.0"

  setup %{conn: conn} do
    changeset = User.registration_changeset(%User{}, @user)
    user = Repo.insert!(changeset)
    {:ok, conn: put_req_header(conn, "accept", "application/json"), user: user}
  end

  describe "authenticated and with user-agent" do
    setup [:authenticated, :user_agent]

    test "creates and renders resource when data is valid", %{conn: conn} do
      conn =
        conn
        |> post(Routes.session_path(conn, :create))
        |> doc

      assert token = json_response(conn, 201)["data"]["token"]
      assert Repo.get_by(Session, token: token)
    end

    test "overrides old session when session already exists", %{conn: conn, user: user} do
      Accounts.create_session(%{user_id: user.id, user_agent: @user_agent})

      conn =
        conn
        |> post(Routes.session_path(conn, :create))

      assert token = json_response(conn, 201)["data"]["token"]
      assert Repo.get_by(Session, token: token)
    end
  end

  describe "user agent is missing" do
    setup [:authenticated]

    test "does not create resource and renders error when user agent is missing", %{conn: conn} do
      conn =
        conn
        |> post(Routes.session_path(conn, :create))
        |> doc

      assert json_response(conn, 400)["errors"] != %{}
    end
  end

  describe "missing or wrong authentication" do
    setup [:user_agent]

    test "does not create resource and renders errors when password is wrong", %{conn: conn} do
      conn =
        conn
        |> put_req_header("authorization", BasicAuth.encode_basic_auth(@user.email, "wrong pass"))
        |> post(Routes.session_path(conn, :create))
        |> doc

      assert json_response(conn, 401)["errors"] != %{}
    end

    test "does not create resource and renders errors when credentials are missing", %{conn: conn} do
      conn = post(conn, Routes.session_path(conn, :create)) |> doc
      assert json_response(conn, 401)["errors"] != %{}
    end
  end

  defp user_agent(%{conn: conn}),
    do: %{conn: put_req_header(conn, "user-agent", @user_agent)}

  defp authenticated(%{conn: conn}),
    do: %{
      conn:
        put_req_header(
          conn,
          "authorization",
          BasicAuth.encode_basic_auth(@user.email, @user.password)
        )
    }
end
