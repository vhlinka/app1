defmodule App1Web.SessionController do
  use App1Web, :controller

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"username" => user, "password_hash" => pass}}) do
    case App1Web.Auth.login_by_username_and_pass(conn, user, pass, repo: App1.Repo) do
      {:ok, conn} ->
          conn
          |> put_flash(:info, "Welcome back!")
          |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
          conn
          |> put_flash(:error, "invalid username/password")
          |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> App1Web.Auth.logout()
    |> redirect(to: page_path(conn, :index))
  end
end
