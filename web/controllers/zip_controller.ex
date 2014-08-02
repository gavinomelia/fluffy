defmodule Fluffy.ZipController do
  use Phoenix.Controller

  @coordinates %{
    "27592" => "35.5957,-78.7314",
    "06030" => "41.7278,-72.8403",
    "02110" => "42.3581,-71.0636",
    "73301" => "30.2500,-97.7500"
  }

  def show(conn, %{"id" => id}) do
    { temp, summary, forecast } = weather_for(id)
    render conn, "show", id: id, temperature: temp, summary: summary, forecast: forecast
  end


  defp weather_for(zip) do
    { :ok, parsed } = call_forecast_io(zip) |> JSON.decode
    current = parsed["currently"]
    { current["temperature"], current["summary"], parsed["hourly"]["summary"] }
  end

  defp call_forecast_io(zip) do
    HTTPotion.get("https://api.forecast.io/forecast/7768b533541101aa661ff471f89c5dce/#{@coordinates[zip]}").body
  end

end
