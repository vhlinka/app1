defmodule App1.Security.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :company_access, :string
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :role, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :first_name, :last_name, :role, :password_hash, :company_access])
    |> validate_required([:username, :company_access])
    |> validate_length(:username, min: 6, max: 20)
  end

  def registration_changeset(user, attrs) do
    user
    |> changeset(attrs)
    |> cast(attrs, ~w(password_hash), [])
    |> validate_length(:password_hash, min: 6, max: 100)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password_hash: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end

end
