defmodule RecipesBackendWeb.VersionControllerTest do
  use RecipesBackendWeb.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  setup [:with_user_token]

  test "get version", %{conn: conn} do
    conn =
      get(conn, Routes.version_path(conn, :get))
      |> doc()

    assert json_response(conn, 200)["data"] == %{"version" => "0.2.2"}
  end
end
