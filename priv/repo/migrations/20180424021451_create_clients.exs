defmodule App1.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :name, :string
      add :contract_dte, :date
      add :addr1, :string
      add :addr2, :string
      add :city, :string
      add :state, :string
      add :zip, :string

      timestamps()
    end

  end
end
