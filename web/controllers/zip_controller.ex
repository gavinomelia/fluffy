defmodule Fluffy.ZipController do
  use Phoenix.Controller

  plug :action

  @coordinates %{
    "27592" => "35.5957,-78.7314",
    "06030" => "41.7278,-72.8403",
    "02110" => "42.3581,-71.0636",
    "73301" => "30.2500,-97.7500",
    "29928" => "32.2163,-80.7526"
  }

  def show(conn, %{"id" => id}) do
    { temp, summary, forecast, temperatureMax, temperatureMin, precipProbability } = weather_for(id)
    render conn, "show", id: id, temperature: temp, summary: summary, forecast: forecast, temperatureMax: temperatureMax, temperatureMin: temperatureMin, precipProbability: precipProbability
  end


  defp weather_for(zip) do
    { :ok, parsed } = call_forecast_io(zip) |> JSON.decode
    current = parsed["currently"]
    daily = parsed["daily"]

    key = daily["data"]
    first_key = List.first(key)
    { current["temperature"], current["summary"], parsed["hourly"]["summary"], first_key["temperatureMax"], first_key["temperatureMin"], first_key["precipProbability"] }
  end

  defp call_forecast_io(zip) do
    get_response_body("https://api.forecast.io/forecast/7768b533541101aa661ff471f89c5dce/#{@coordinates[zip]}")
  end

  defp get_response_body(url) do
    { :ok, %HTTPoison.Response{status_code: 200, body: body} } = HTTPoison.get(url)
    body
  end

end
