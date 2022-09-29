defmodule RecipesBackendWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  we enable the SQL sandbox, so changes done to the database
  are reverted at the end of every test. If you are using
  PostgreSQL, you can even run database tests asynchronously
  by setting `use RecipesBackendWeb.ConnCase, async: true`, although
  this option is not recommended for other databases.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import RecipesBackendWeb.ConnCase
      import Bureaucrat.Helpers

      alias RecipesBackendWeb.Router.Helpers, as: Routes

      # The default endpoint for testing
      @endpoint RecipesBackendWeb.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(RecipesBackend.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(RecipesBackend.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end

  @doc """
  Setup helper that registers a users and creates a session.

      setup :with_user_token

  It adds the token to the authorization header in the
  test context.
  """
  def with_user_token(%{conn: conn}) do
    user = RecipesBackend.AccountsFixtures.user_fixture()
    put_authorization_header(conn, user)
  end

  @doc """
  Setup helper that registers a users with
  admin privileges and creates a session.

      setup :with_admin_token

  It adds the token to the authorization header in the
  test context.
  """
  def with_admin_token(%{conn: conn}) do
    admin = RecipesBackend.AccountsFixtures.admin_fixture()
    put_authorization_header(conn, admin)
  end

  defp put_authorization_header(conn, user) do
    {:ok, session} = RecipesBackend.Accounts.create_session(%{user_id: user.id, user_agent: "some_agent/1.0"})
    {:ok, conn: Plug.Conn.put_req_header(conn, "authorization", "Token #{session.token}")}
  end
end
