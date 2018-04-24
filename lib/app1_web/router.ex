defmodule App1Web.Router do
  use App1Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug App1Web.Auth, repo: App1.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", App1Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/logger", LoggerController
    resources "/locations", LocationController
    resources "/clients", ClientController
    resources "/users", UserController

  end

  # Other scopes may use custom stacks.
  # scope "/api", App1Web do
  #   pipe_through :api
  # end
end
