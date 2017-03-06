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

end
