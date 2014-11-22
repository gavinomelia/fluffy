defmodule Fluffy.Router do
  use Phoenix.Router

  scope "/" do
    pipe_through :browser

    # get "/", Fluffy.PageController, :index, as: :pages
    get "/", Fluffy.HomeController, :index
    get "/zip/:id", Fluffy.ZipController, :show
  end

end
