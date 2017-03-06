require 'httparty'
require 'pry'


class Weather

  def get_weather
    HTTParty.get('http://api.wunderground.com/api/a0fad745509bd909/conditions/settings/q/20011.json')
  end

  def sunrise_sunset
    HTTParty.get('http://api.wunderground.com/api/a0fad745509bd909/astronomy/settings/q/20011.json')
  end

  def ten_day_forecast
    HTTParty.get('http://api.wunderground.com/api/a0fad745509bd909/forecast10day/settings/q/20011.json')
  end

  def current_alerts(zip_code)
    HTTParty.get("http://api.wunderground.com/api/a0fad745509bd909/alerts/settings/q/#{zip_code}.json")
  end

  def multiple_alerts
    

  end

end
