defmodule RecipesBackend.Accounts do
  alias RecipesBackend.Accounts.Session
  alias RecipesBackend.Accounts.User
  alias RecipesBackend.Repo

  require Logger

  @doc """
  Registers a new user.

  ## Examples

      iex> register_user(%{email: "foo@bar.email", password: "supers3cret!"})
      {:ok, %User{}}

      iex> register_user(%{password: "supers3cret!"})
      {:error, %Ecto.Changeset{}}

  """
  def register_user(%{} = user_attrs) do
    %User{}
    |> User.registration_changeset(user_attrs)
    |> Repo.insert()
  end

  def verify_user(email, password) do
    Logger.info("Verfiy user '#{email}'")
    user = get_user_by_email(email)
    if is_nil(user) do
      Logger.info("User with '#{email}' not found!")
    end

    case Argon2.check_pass(user, password) do
      {:error, err} -> handle_user_verification_failed(err)
      _ -> {:ok, %{id: user.id}}
    end
  end

  @doc """
  Fetches a single result from the query.
  Returns nil if no result was found. Raises if more than one entry.

  """
  def get_user_by_email(email) do
    Repo.get_by(User, email: email)
  end

  @doc """
  Creates a new session.

  ## Examples

      iex> create_session({user_id: 1, user_agent: "some_agent/1.0"}
      {:ok, %Session{}}

      iex> create_session({user_id: 1}
      {:error, %Ecto.Changeset{}}

  """
  def create_session(%{} = session_attrs) do
    %Session{}
    |> Session.create_changeset(session_attrs)
    |> Repo.insert_or_update()
  end

  defp handle_user_verification_failed(err) do
    Logger.info("Failed to authenticate user: '#{err}'")
    {:error, :unauthorized}
  end
end
