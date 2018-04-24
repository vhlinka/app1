defmodule App1.Accounts.Location do
  use Ecto.Schema
  import Ecto.Changeset


  schema "locations" do
    field :addr1, :string
    field :addr2, :string
    field :city, :string
    field :contract_dte, :date
    field :name, :string
    field :state, :string
    field :zip, :string

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:name, :contract_dte, :addr1, :addr2, :city, :state, :zip])
    |> validate_required([:name, :contract_dte, :addr1, :addr2, :city, :state, :zip])
  end
end
