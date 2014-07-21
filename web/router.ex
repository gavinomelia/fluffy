defmodule Fluffy.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :fluffy

  get "/", Fluffy.PageController, :index, as: :page
  get "/now/:zip", Fluffy.NowController, :index, as: :zip

end
