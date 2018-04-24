defmodule App1.Hardware.Logger do
  use Ecto.Schema
  import Ecto.Changeset


  schema "logger" do
    field :battery_dte, :date
    field :in_service_dte, :date
    field :last_used_dte, :date
    field :manufacture_dte, :date
    field :name, :string
    field :number_trips, :integer

    timestamps()
  end

  @doc false
  def changeset(logger, attrs) do
    logger
    |> cast(attrs, [:name, :manufacture_dte, :battery_dte, :in_service_dte, :number_trips, :last_used_dte])
    |> validate_required([:name, :manufacture_dte, :battery_dte, :in_service_dte, :number_trips, :last_used_dte])
  end
end
