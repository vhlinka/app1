defmodule App1.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :first_name, :string
      add :last_name, :string
      add :role, :string
      add :password_hash, :string
      add :company_access, :string

      timestamps()
    end

  end
end
