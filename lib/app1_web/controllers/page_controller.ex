defmodule App1Web.PageController do
  use App1Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
