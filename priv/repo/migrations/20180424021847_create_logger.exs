defmodule App1.Repo.Migrations.CreateLogger do
  use Ecto.Migration

  def change do
    create table(:logger) do
      add :name, :string
      add :manufacture_dte, :date
      add :battery_dte, :date
      add :in_service_dte, :date
      add :number_trips, :integer
      add :last_used_dte, :date

      timestamps()
    end

  end
end
