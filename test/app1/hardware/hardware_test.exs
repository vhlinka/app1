defmodule App1.HardwareTest do
  use App1.DataCase

  alias App1.Hardware

  describe "logger" do
    alias App1.Hardware.Logger

    @valid_attrs %{battery_dte: ~D[2010-04-17], in_service_dte: ~D[2010-04-17], last_used_dte: ~D[2010-04-17], manufacture_dte: ~D[2010-04-17], name: "some name", number_trips: 42}
    @update_attrs %{battery_dte: ~D[2011-05-18], in_service_dte: ~D[2011-05-18], last_used_dte: ~D[2011-05-18], manufacture_dte: ~D[2011-05-18], name: "some updated name", number_trips: 43}
    @invalid_attrs %{battery_dte: nil, in_service_dte: nil, last_used_dte: nil, manufacture_dte: nil, name: nil, number_trips: nil}

    def logger_fixture(attrs \\ %{}) do
      {:ok, logger} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Hardware.create_logger()

      logger
    end

    test "list_logger/0 returns all logger" do
      logger = logger_fixture()
      assert Hardware.list_logger() == [logger]
    end

    test "get_logger!/1 returns the logger with given id" do
      logger = logger_fixture()
      assert Hardware.get_logger!(logger.id) == logger
    end

    test "create_logger/1 with valid data creates a logger" do
      assert {:ok, %Logger{} = logger} = Hardware.create_logger(@valid_attrs)
      assert logger.battery_dte == ~D[2010-04-17]
      assert logger.in_service_dte == ~D[2010-04-17]
      assert logger.last_used_dte == ~D[2010-04-17]
      assert logger.manufacture_dte == ~D[2010-04-17]
      assert logger.name == "some name"
      assert logger.number_trips == 42
    end

    test "create_logger/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Hardware.create_logger(@invalid_attrs)
    end

    test "update_logger/2 with valid data updates the logger" do
      logger = logger_fixture()
      assert {:ok, logger} = Hardware.update_logger(logger, @update_attrs)
      assert %Logger{} = logger
      assert logger.battery_dte == ~D[2011-05-18]
      assert logger.in_service_dte == ~D[2011-05-18]
      assert logger.last_used_dte == ~D[2011-05-18]
      assert logger.manufacture_dte == ~D[2011-05-18]
      assert logger.name == "some updated name"
      assert logger.number_trips == 43
    end

    test "update_logger/2 with invalid data returns error changeset" do
      logger = logger_fixture()
      assert {:error, %Ecto.Changeset{}} = Hardware.update_logger(logger, @invalid_attrs)
      assert logger == Hardware.get_logger!(logger.id)
    end

    test "delete_logger/1 deletes the logger" do
      logger = logger_fixture()
      assert {:ok, %Logger{}} = Hardware.delete_logger(logger)
      assert_raise Ecto.NoResultsError, fn -> Hardware.get_logger!(logger.id) end
    end

    test "change_logger/1 returns a logger changeset" do
      logger = logger_fixture()
      assert %Ecto.Changeset{} = Hardware.change_logger(logger)
    end
  end
end
