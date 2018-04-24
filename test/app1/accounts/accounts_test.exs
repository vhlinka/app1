defmodule App1.AccountsTest do
  use App1.DataCase

  alias App1.Accounts

  describe "clients" do
    alias App1.Accounts.Client

    @valid_attrs %{addr1: "some addr1", addr2: "some addr2", city: "some city", contract_dte: ~D[2010-04-17], name: "some name", state: "some state", zip: "some zip"}
    @update_attrs %{addr1: "some updated addr1", addr2: "some updated addr2", city: "some updated city", contract_dte: ~D[2011-05-18], name: "some updated name", state: "some updated state", zip: "some updated zip"}
    @invalid_attrs %{addr1: nil, addr2: nil, city: nil, contract_dte: nil, name: nil, state: nil, zip: nil}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_client()

      client
    end

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Accounts.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Accounts.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = Accounts.create_client(@valid_attrs)
      assert client.addr1 == "some addr1"
      assert client.addr2 == "some addr2"
      assert client.city == "some city"
      assert client.contract_dte == ~D[2010-04-17]
      assert client.name == "some name"
      assert client.state == "some state"
      assert client.zip == "some zip"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, client} = Accounts.update_client(client, @update_attrs)
      assert %Client{} = client
      assert client.addr1 == "some updated addr1"
      assert client.addr2 == "some updated addr2"
      assert client.city == "some updated city"
      assert client.contract_dte == ~D[2011-05-18]
      assert client.name == "some updated name"
      assert client.state == "some updated state"
      assert client.zip == "some updated zip"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_client(client, @invalid_attrs)
      assert client == Accounts.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Accounts.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Accounts.change_client(client)
    end
  end

  describe "locations" do
    alias App1.Accounts.Location

    @valid_attrs %{addr1: "some addr1", addr2: "some addr2", city: "some city", contract_dte: ~D[2010-04-17], name: "some name", state: "some state", zip: "some zip"}
    @update_attrs %{addr1: "some updated addr1", addr2: "some updated addr2", city: "some updated city", contract_dte: ~D[2011-05-18], name: "some updated name", state: "some updated state", zip: "some updated zip"}
    @invalid_attrs %{addr1: nil, addr2: nil, city: nil, contract_dte: nil, name: nil, state: nil, zip: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_location()

      location
    end

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Accounts.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Accounts.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      assert {:ok, %Location{} = location} = Accounts.create_location(@valid_attrs)
      assert location.addr1 == "some addr1"
      assert location.addr2 == "some addr2"
      assert location.city == "some city"
      assert location.contract_dte == ~D[2010-04-17]
      assert location.name == "some name"
      assert location.state == "some state"
      assert location.zip == "some zip"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      assert {:ok, location} = Accounts.update_location(location, @update_attrs)
      assert %Location{} = location
      assert location.addr1 == "some updated addr1"
      assert location.addr2 == "some updated addr2"
      assert location.city == "some updated city"
      assert location.contract_dte == ~D[2011-05-18]
      assert location.name == "some updated name"
      assert location.state == "some updated state"
      assert location.zip == "some updated zip"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_location(location, @invalid_attrs)
      assert location == Accounts.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Accounts.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Accounts.change_location(location)
    end
  end
end
