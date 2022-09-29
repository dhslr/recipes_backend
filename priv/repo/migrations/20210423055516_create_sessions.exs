defmodule RecipesBackend.Repo.Migrations.CreateSessions do
  use Ecto.Migration

  def change do
    create table(:sessions) do
      add :token, :string
      add :user_agent, :string
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:sessions, [:user_id])
  end
end
