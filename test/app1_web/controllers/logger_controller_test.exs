defmodule App1Web.LoggerControllerTest do
  use App1Web.ConnCase

  alias App1.Hardware

  @create_attrs %{battery_dte: ~D[2010-04-17], in_service_dte: ~D[2010-04-17], last_used_dte: ~D[2010-04-17], manufacture_dte: ~D[2010-04-17], name: "some name", number_trips: 42}
  @update_attrs %{battery_dte: ~D[2011-05-18], in_service_dte: ~D[2011-05-18], last_used_dte: ~D[2011-05-18], manufacture_dte: ~D[2011-05-18], name: "some updated name", number_trips: 43}
  @invalid_attrs %{battery_dte: nil, in_service_dte: nil, last_used_dte: nil, manufacture_dte: nil, name: nil, number_trips: nil}

  def fixture(:logger) do
    {:ok, logger} = Hardware.create_logger(@create_attrs)
    logger
  end

  describe "index" do
    test "lists all logger", %{conn: conn} do
      conn = get conn, logger_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Logger"
    end
  end

  describe "new logger" do
    test "renders form", %{conn: conn} do
      conn = get conn, logger_path(conn, :new)
      assert html_response(conn, 200) =~ "New Logger"
    end
  end

  describe "create logger" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, logger_path(conn, :create), logger: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == logger_path(conn, :show, id)

      conn = get conn, logger_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Logger"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, logger_path(conn, :create), logger: @invalid_attrs
      assert html_response(conn, 200) =~ "New Logger"
    end
  end

  describe "edit logger" do
    setup [:create_logger]

    test "renders form for editing chosen logger", %{conn: conn, logger: logger} do
      conn = get conn, logger_path(conn, :edit, logger)
      assert html_response(conn, 200) =~ "Edit Logger"
    end
  end

  describe "update logger" do
    setup [:create_logger]

    test "redirects when data is valid", %{conn: conn, logger: logger} do
      conn = put conn, logger_path(conn, :update, logger), logger: @update_attrs
      assert redirected_to(conn) == logger_path(conn, :show, logger)

      conn = get conn, logger_path(conn, :show, logger)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, logger: logger} do
      conn = put conn, logger_path(conn, :update, logger), logger: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Logger"
    end
  end

  describe "delete logger" do
    setup [:create_logger]

    test "deletes chosen logger", %{conn: conn, logger: logger} do
      conn = delete conn, logger_path(conn, :delete, logger)
      assert redirected_to(conn) == logger_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, logger_path(conn, :show, logger)
      end
    end
  end

  defp create_logger(_) do
    logger = fixture(:logger)
    {:ok, logger: logger}
  end
end
