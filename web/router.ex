defmodule Fluffy.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
  end

  scope "/" do
    pipe_through :browser

    get "/", Fluffy.HomeController, :index
    get "/zip/:id", Fluffy.ZipController, :show
  end

end
