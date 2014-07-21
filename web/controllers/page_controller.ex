defmodule Fluffy.PageController do
  use Phoenix.Controller

  def index(conn, _params) do
    render conn, :index
  end

  def now(conn, %{"zip" => zip}) do
    render conn, :now, zip: zip
  end
end
