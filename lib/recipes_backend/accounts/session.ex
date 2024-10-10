defmodule RecipesBackend.Accounts.Session do
  use Ecto.Schema
  import Ecto.Changeset
  alias RecipesBackend.Accounts.User

  schema "sessions" do
    field :token, :string
    field :user_agent, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(session, attrs) do
    session
    |> cast(attrs, [:user_id, :user_agent])
    |> validate_required([:user_id, :user_agent])
  end

  def create_changeset(session, attrs) do
    session
    |> changeset(attrs)
    |> put_change(:token, SecureRandom.urlsafe_base64())
  end
end
