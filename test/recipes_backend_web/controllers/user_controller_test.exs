defmodule RecipesBackendWeb.UserControllerTest do
  use RecipesBackendWeb.ConnCase
  alias RecipesBackend.Accounts.User
  alias RecipesBackend.Repo

  @valid_attrs %{email: "foo@bar.com", password: "s3cr3t"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "as an admin user" do
    setup :with_admin_token

    test "creates user and renders data when request data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @valid_attrs) |> doc()
      body = json_response(conn, 201)
      assert body["data"]["id"]
      assert body["data"]["email"]
      refute body["data"]["password"]
      assert Repo.get_by(User, email: "foo@bar.com")
    end

    test "does not create user and renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs) |> doc()
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "as a normal user" do
    setup :with_user_token

    test "does not create user because user lacks admin privileges", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @valid_attrs) |> doc()
      assert json_response(conn, 403)["errors"] != %{}
    end
  end

  describe "not authenticated" do
    test "does not create user because user is not authenticated", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @valid_attrs)
      assert json_response(conn, 401)["errors"] != %{}
    end
  end
end
