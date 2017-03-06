require 'net/http'
require 'json'
require_relative 'weather'
require_relative 'alerts'
require 'pry'

puts "What would you like to do? Please choose between alerts, 10 day forecast, sunrise, sunset or current conditions"
answer = gets.chomp
puts "What zip code would you like to look up?"
zip_code = gets.chomp
case answer
  when "alerts"
    alerts = Weather.new.current_alerts(zip_code)
    alerts_to_print = Formatter.new(alerts)
    p alerts_to_print.print_alerts
  when "10 day forecast"
    forecast = Weather.new.ten_day_forecast
  when "sunrise" || "sunset"
    Weather.new.sunrise_sunset
  when "current_conditions"
    Weather.new.get_weather
  end
