defmodule RecipesBackend.AccountsFixtures do
  alias RecipesBackend.Accounts

  def user_fixture() do
    {:ok, user} =
      Accounts.register_user(%{
        email: "test123@example.org",
        password: "super s3cr3t!"
      })

    user
  end

  def admin_fixture() do
    {:ok, user} =
      Accounts.register_user(%{
        email: "root@example.org",
        password: "more super s3cr3t!",
        is_admin: true
      })

    user
  end
end
