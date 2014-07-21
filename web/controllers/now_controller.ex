defmodule Fluffy.NowController do
  use Phoenix.Controller

  def index(conn, %{"zip" => zip}) do
    render conn, :index, zip: zip
  end

end
