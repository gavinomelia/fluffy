defmodule Fluffy.ZipController do
  use Phoenix.Controller

  def show(conn, %{"id" => id}) do
    render conn, "show", id: id
  end

end
