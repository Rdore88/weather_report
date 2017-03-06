require 'net/http'
require 'json'
require_relative 'weather'
require_relative 'formatter'
require 'pry'

puts "What would you like to do? Please choose between alerts, 10 day forecast, sunrise, sunset or current conditions"
answer = gets.chomp
puts "What zip code would you like to look up?"
zip_code = gets.chomp
case answer
  when "alerts"
    alerts = Weather.new.current_alerts(zip_code)
    alerts_to_print = Formatter.new(alerts)
    puts alerts_to_print.print_alerts
  when "10 day forecast"
    forecast = Weather.new.ten_day_forecast(zip_code)
    forecast_to_print = Formatter.new(forecast)
    puts forecast_to_print.print_forecast
  when "sunrise", "sunset"
    astronomy = Weather.new.sunrise_sunset(zip_code)
    astronomy_to_print = Formatter.new(astronomy)
    puts astronomy_to_print.print_astronomy
  when "current conditions"
    conditions = Weather.new.get_weather(zip_code)
    conditions_to_print = Formatter.new(conditions)
    puts conditions_to_print.print_conditions
  else
    puts "Instrunction not understood"
  end
