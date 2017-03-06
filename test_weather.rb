require "minitest/autorun"
require "minitest/pride"
require "minitest/focus"
require "webmock/minitest"
require 'pry'
require_relative 'weather'


class WeatherTest < Minitest::Test

  def test_weather_exists
    assert Weather
  end

  def test_get_weather
    stub_request(:get, 'http://api.wunderground.com/api/a0fad745509bd909/conditions/settings/q/20011.json')
  .to_return(body: File.read("./stubbed_requests/conditions_20011.json"), headers: { 'Content-Type' => "application/json" })
  assert_equal "38.947712", Weather.new.get_weather["current_observation"]["observation_location"]["latitude"]
  end


  def test_sunrise_sunset
    stub_request(:get, 'http://api.wunderground.com/api/a0fad745509bd909/astronomy/settings/q/20011.json')
  .to_return(body: File.read("./stubbed_requests/astronomy_20011.json"), headers: { 'Content-Type' => "application/json" })
  assert_equal  "18", Weather.new.sunrise_sunset["sun_phase"]["sunset"]["hour"]
  end

  def test_10_day_forecast
    stub_request(:get, 'http://api.wunderground.com/api/a0fad745509bd909/forecast10day/settings/q/20011.json')
  .to_return(body: File.read("./stubbed_requests/forecast_20011.json"), headers: { 'Content-Type' => "application/json" })
  assert_equal "Monday", Weather.new.ten_day_forecast["forecast"]["txt_forecast"]["forecastday"][0]["title"]
  end

  def test_current_alerts
    stub_request(:get, 'http://api.wunderground.com/api/a0fad745509bd909/alerts/settings/q/20011.json')
  .to_return(body: File.read("./stubbed_requests/current_alerts_20011.json"), headers: { 'Content-Type' => "application/json" })
  assert_equal [], Weather.new.current_alerts["alerts"]
  end

end
