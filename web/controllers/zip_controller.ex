defmodule Fluffy.ZipController do
  use Phoenix.Controller

  plug :action

  def show(conn, %{"id" => id}) do
    { address, temp, summary, forecast, temperatureMax, temperatureMin, precipProbability } = weather_for(id)
    render conn, "show.html", address: address, temperature: temp, summary: summary,
           forecast: forecast, temperatureMax: temperatureMax, temperatureMin: temperatureMin,
           precipProbability: precipProbability
  end


  defp geocode(zip) do
    { :ok, parsed } = call_geocoding(zip) |> JSON.decode
    first_result = parsed["results"] |> List.first
    loc = first_result["geometry"]["location"]
    address = first_result["formatted_address"]
    lat_lng = ~s(#{loc["lat"]},#{loc["lng"]})
    { address, lat_lng }
  end

  defp weather_for(zip) do
    { address, lat_lng } = geocode(zip)
    { :ok, parsed } = call_forecast_io(lat_lng) |> JSON.decode
    current = parsed["currently"]
    daily = parsed["daily"]

    key = daily["data"]
    first_key = List.first(key)
    { address, current["temperature"], current["summary"], parsed["hourly"]["summary"], first_key["temperatureMax"], first_key["temperatureMin"], first_key["precipProbability"] }
  end

  defp call_forecast_io(lat_lng) do
    get_response_body("https://api.forecast.io/forecast/7768b533541101aa661ff471f89c5dce/#{lat_lng}")
  end

  defp call_geocoding(zip) do
    get_response_body("https://maps.googleapis.com/maps/api/geocode/json?address=#{zip}&key=AIzaSyCnw9k4-E-OXJImTlrCsiz7Vlt5j9PK_ig")
  end

  defp get_response_body(url) do
    { :ok, %HTTPoison.Response{status_code: 200, body: body} } = HTTPoison.get(url)
    body
  end

end
