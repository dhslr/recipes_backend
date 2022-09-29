defmodule RecipesBackend.Accounts.SessionTest do
  use RecipesBackend.DataCase
  alias RecipesBackend.Accounts.Session


  @valid_attrs %{user_id: "1", user_agent: "some_agent/1.0"}
  @invalid_attrs %{user_agent: "some_agent/1.0"}

  test "changeset with valid attributes" do
    changeset = Session.changeset(%Session{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Session.changeset(%Session{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "create_changeset with valid attributes" do
    changeset = Session.create_changeset(%Session{}, @valid_attrs)
    assert changeset.changes.token
    assert changeset.valid?
  end

  test "create_changeset with invalid attributes" do
    changeset = Session.create_changeset(%Session{}, @invalid_attrs)
    refute changeset.valid?
  end

end
