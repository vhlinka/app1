defmodule App1.Accounts.Client do
  use Ecto.Schema
  import Ecto.Changeset


  schema "clients" do
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
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :contract_dte, :addr1, :addr2, :city, :state, :zip])
    |> validate_required([:name, :contract_dte, :addr1, :addr2, :city, :state, :zip])
  end
end
