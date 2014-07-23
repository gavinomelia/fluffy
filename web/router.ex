defmodule Fluffy.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :fluffy

  get "/", Fluffy.HomeController, :index
  get "/now/:zip", Fluffy.NowController, :index

end
