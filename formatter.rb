require 'httparty'
require 'pry'


class Formatter

  def initialize(weather_object)
    @weather_object = weather_object
  end

  def print_alerts
    if @weather_object["alerts"].empty?
      return "There are no current weather allerts"
    else
      alerts = @weather_object["alerts"].map {|el| el["description"]}
      return alerts
    end
  end

  def print_conditions
    current_location = @weather_object["current_observation"]["observation_location"]["full"]
    weather = @weather_object["current_observation"]["weather"]
    temp = @weather_object["current_observation"]["temp_f"]
    feels_like = @weather_object["current_observation"]["feelslike_f"]
    wind = @weather_object["current_observation"]["wind_string"]
    return "For #{current_location}, the weather is #{weather}  with a temperature of #{temp} wind #{wind} making it feel like #{feels_like}."
  end

  def print_astronomy
    sunrise_hour = @weather_object["sun_phase"]["sunrise"]["hour"]
    sunrise_minute = @weather_object["sun_phase"]["sunrise"]["minute"]
    sunset_hour = @weather_object["sun_phase"]["sunset"]["hour"]
    sunset_minute = @weather_object["sun_phase"]["sunset"]["minute"]
    return "Sunrise is at #{sunrise_hour}:#{sunrise_minute} and the sun will set at #{sunset_hour}:#{sunset_minute}"
  end

  def print_forecast
    forecast = @weather_object["forecast"]["txt_forecast"]["forecastday"].map { |el| {el["title"] => el["fcttext"]}}
    return forecast
  end

end
