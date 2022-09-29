defmodule RecipesBackend.AuthenticationTest do
  use RecipesBackendWeb.ConnCase

  alias RecipesBackend.Accounts.{Session, User}
  alias RecipesBackend.Authentication
  alias RecipesBackend.Repo

  @valid_token "asdf234"
  @opts Authentication.init([])

  test "finds user by given token", %{conn: conn} do
    user = Repo.insert!(%User{email: "foo@bar.org"})
    Repo.insert!(%Session{token: @valid_token, user_id: user.id})

    conn =
      conn
      |> put_auth_token_in_header(@valid_token)
      |> Authentication.call(@opts)

    refute conn.halted
    assert conn.assigns.current_user.id == user.id
  end

  test "yields unauthenticated when no token is given", %{conn: conn} do
    conn = Authentication.call(conn, @opts)

    assert conn.status == 401
    assert conn.halted
  end

  test "yields unauthenticated when token is invalid", %{conn: conn} do
    conn =
      conn
      |> put_auth_token_in_header("wrong token")
      |> Authentication.call(@opts)

    assert conn.status == 401
    assert conn.halted
  end

  defp put_auth_token_in_header(conn, token) do
    conn
    |> put_req_header("authorization", ~s(Token #{token}))
  end
end
