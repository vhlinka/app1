defmodule App1Web.ClientControllerTest do
  use App1Web.ConnCase

  alias App1.Accounts

  @create_attrs %{addr1: "some addr1", addr2: "some addr2", city: "some city", contract_dte: ~D[2010-04-17], name: "some name", state: "some state", zip: "some zip"}
  @update_attrs %{addr1: "some updated addr1", addr2: "some updated addr2", city: "some updated city", contract_dte: ~D[2011-05-18], name: "some updated name", state: "some updated state", zip: "some updated zip"}
  @invalid_attrs %{addr1: nil, addr2: nil, city: nil, contract_dte: nil, name: nil, state: nil, zip: nil}

  def fixture(:client) do
    {:ok, client} = Accounts.create_client(@create_attrs)
    client
  end

  describe "index" do
    test "lists all clients", %{conn: conn} do
      conn = get conn, client_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Clients"
    end
  end

  describe "new client" do
    test "renders form", %{conn: conn} do
      conn = get conn, client_path(conn, :new)
      assert html_response(conn, 200) =~ "New Client"
    end
  end

  describe "create client" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, client_path(conn, :create), client: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == client_path(conn, :show, id)

      conn = get conn, client_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Client"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, client_path(conn, :create), client: @invalid_attrs
      assert html_response(conn, 200) =~ "New Client"
    end
  end

  describe "edit client" do
    setup [:create_client]

    test "renders form for editing chosen client", %{conn: conn, client: client} do
      conn = get conn, client_path(conn, :edit, client)
      assert html_response(conn, 200) =~ "Edit Client"
    end
  end

  describe "update client" do
    setup [:create_client]

    test "redirects when data is valid", %{conn: conn, client: client} do
      conn = put conn, client_path(conn, :update, client), client: @update_attrs
      assert redirected_to(conn) == client_path(conn, :show, client)

      conn = get conn, client_path(conn, :show, client)
      assert html_response(conn, 200) =~ "some updated addr1"
    end

    test "renders errors when data is invalid", %{conn: conn, client: client} do
      conn = put conn, client_path(conn, :update, client), client: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Client"
    end
  end

  describe "delete client" do
    setup [:create_client]

    test "deletes chosen client", %{conn: conn, client: client} do
      conn = delete conn, client_path(conn, :delete, client)
      assert redirected_to(conn) == client_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, client_path(conn, :show, client)
      end
    end
  end

  defp create_client(_) do
    client = fixture(:client)
    {:ok, client: client}
  end
end
