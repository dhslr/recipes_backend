defmodule RecipesBackend.Accounts.UserTest do
  use RecipesBackend.DataCase
  alias RecipesBackend.Accounts.User

  @valid_attrs %{email: "foo@bar.com", password: "donttell!"}
  @valid_admin_attrs %{email: "root@bar.com", password: "even more secret!", is_admin: true}

  test "changeset, with valid email and password" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset, lacking email is not valid" do
    changeset = User.changeset(%User{}, %{password: "donttell!"})
    refute changeset.valid?
  end

  test "changeset, with email in wrong format is not valid" do
    changeset = User.changeset(%User{}, Map.put(@valid_attrs, :email, ""))
    refute changeset.valid?

    changeset = User.changeset(%User{}, Map.put(@valid_attrs, :email, "test"))
    refute changeset.valid?

    changeset = User.changeset(%User{}, Map.put(@valid_attrs, :email, "test@"))
    refute changeset.valid?

    changeset = User.changeset(%User{}, Map.put(@valid_attrs, :email, "exmaple.org"))
    refute changeset.valid?
  end

  test "registration_changeset, with valid email and password" do
    changeset = User.registration_changeset(%User{}, @valid_attrs)
    assert changeset.changes.password_hash
    assert changeset.valid?
  end

  test "registration_changeset, with valid admin email and password" do
    changeset = User.registration_changeset(%User{}, @valid_admin_attrs)
    assert changeset.changes.password_hash
    assert changeset.changes.is_admin
    assert changeset.valid?
  end

  test "registration_changeset, password too short" do
    changeset =
      User.registration_changeset(
        %User{},
        Map.put(@valid_attrs, :password, "12345")
      )

    refute changeset.valid?
  end
end
