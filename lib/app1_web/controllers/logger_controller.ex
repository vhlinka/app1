defmodule App1Web.LoggerController do
  use App1Web, :controller

  alias App1.Hardware
  alias App1.Hardware.Logger

  # plug :authenticate_user when action in [:index, :show, :new, :show, :create, :edit, :update, :delete]


  def index(conn, _params) do
    logger = Hardware.list_logger()
    render(conn, "index.html", logger: logger)
  end

  def new(conn, _params) do
    changeset = Hardware.change_logger(%Logger{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"logger" => logger_params}) do
    case Hardware.create_logger(logger_params) do
      {:ok, logger} ->
        conn
        |> put_flash(:info, "Logger created successfully.")
        |> redirect(to: logger_path(conn, :show, logger))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    logger = Hardware.get_logger!(id)
    render(conn, "show.html", logger: logger)
  end

  def edit(conn, %{"id" => id}) do
    logger = Hardware.get_logger!(id)
    changeset = Hardware.change_logger(logger)
    render(conn, "edit.html", logger: logger, changeset: changeset)
  end

  def update(conn, %{"id" => id, "logger" => logger_params}) do
    logger = Hardware.get_logger!(id)

    case Hardware.update_logger(logger, logger_params) do
      {:ok, logger} ->
        conn
        |> put_flash(:info, "Logger updated successfully.")
        |> redirect(to: logger_path(conn, :show, logger))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", logger: logger, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    logger = Hardware.get_logger!(id)
    {:ok, _logger} = Hardware.delete_logger(logger)

    conn
    |> put_flash(:info, "Logger deleted successfully.")
    |> redirect(to: logger_path(conn, :index))
  end
end
