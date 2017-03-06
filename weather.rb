require 'httparty'
require 'pry'


class Weather

  def get_weather(zip_code)
    HTTParty.get("http://api.wunderground.com/api/a0fad745509bd909/conditions/settings/q/#{zip_code}.json")
  end

  def sunrise_sunset(zip_code)
    HTTParty.get("http://api.wunderground.com/api/a0fad745509bd909/astronomy/settings/q/#{zip_code}.json")
  end

  def ten_day_forecast(zip_code)
    HTTParty.get("http://api.wunderground.com/api/a0fad745509bd909/forecast10day/settings/q/#{zip_code}.json")
  end

  def current_alerts(zip_code)
    HTTParty.get("http://api.wunderground.com/api/a0fad745509bd909/alerts/settings/q/#{zip_code}.json")
  end

end
