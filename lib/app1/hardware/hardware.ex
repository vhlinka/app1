defmodule App1.Hardware do
  @moduledoc """
  The Hardware context.
  """

  import Ecto.Query, warn: false
  alias App1.Repo

  alias App1.Hardware.Logger

  @doc """
  Returns the list of logger.

  ## Examples

      iex> list_logger()
      [%Logger{}, ...]

  """
  def list_logger do
    Repo.all(Logger)
  end

  @doc """
  Gets a single logger.

  Raises `Ecto.NoResultsError` if the Logger does not exist.

  ## Examples

      iex> get_logger!(123)
      %Logger{}

      iex> get_logger!(456)
      ** (Ecto.NoResultsError)

  """
  def get_logger!(id), do: Repo.get!(Logger, id)

  @doc """
  Creates a logger.

  ## Examples

      iex> create_logger(%{field: value})
      {:ok, %Logger{}}

      iex> create_logger(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_logger(attrs \\ %{}) do
    %Logger{}
    |> Logger.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a logger.

  ## Examples

      iex> update_logger(logger, %{field: new_value})
      {:ok, %Logger{}}

      iex> update_logger(logger, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_logger(%Logger{} = logger, attrs) do
    logger
    |> Logger.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Logger.

  ## Examples

      iex> delete_logger(logger)
      {:ok, %Logger{}}

      iex> delete_logger(logger)
      {:error, %Ecto.Changeset{}}

  """
  def delete_logger(%Logger{} = logger) do
    Repo.delete(logger)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking logger changes.

  ## Examples

      iex> change_logger(logger)
      %Ecto.Changeset{source: %Logger{}}

  """
  def change_logger(%Logger{} = logger) do
    Logger.changeset(logger, %{})
  end
end
