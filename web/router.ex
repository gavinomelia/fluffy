defmodule Fluffy.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :fluffy

  get "/", Fluffy.HomeController, :index
  get "/zip/:id", Fluffy.ZipController, :show

end
