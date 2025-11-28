#!/usr/bin/env ruby
require 'json'
require 'time'

# Sensor Data Generator for Web Display
# This generates sensor data and saves it as JSON for the frontend

class Sensor
  attr_reader :name, :unit
  
  def initialize(name, unit, min_value, max_value)
    @name = name
    @unit = unit
    @min_value = min_value
    @max_value = max_value
  end
  
  def read
    rand(@min_value..@max_value).round(2)
  end
end

class SensorArray
  def initialize
    @sensors = []
  end
  
  def add_sensor(sensor)
    @sensors << sensor
  end
  
  def read_all
    readings = []
    @sensors.each do |sensor|
      value = sensor.read
      readings << {
        name: sensor.name,
        value: value,
        unit: sensor.unit,
        status: analyze_value(sensor.name, value)
      }
    end
    readings
  end
  
  def analyze_value(name, value)
    case name
    when "Temperature"
      if value > 30
        { level: "warning", message: "High temperature detected!" }
      elsif value < 10
        { level: "info", message: "Low temperature detected" }
      else
        { level: "normal", message: "Normal" }
      end
    when "Distance"
      if value < 20
        { level: "alert", message: "Obstacle nearby!" }
      else
        { level: "normal", message: "Clear path" }
      end
    when "Humidity"
      if value > 80
        { level: "info", message: "High humidity" }
      else
        { level: "normal", message: "Normal" }
      end
    when "Pressure"
      if value < 98000
        { level: "info", message: "Low pressure - storm possible" }
      elsif value > 103000
        { level: "info", message: "High pressure - clear weather" }
      else
        { level: "normal", message: "Normal" }
      end
    else
      { level: "normal", message: "Normal" }
    end
  end
  
  def generate_history(count = 10)
    history = []
    count.times do |i|
      history << {
        timestamp: (Time.now - (count - i) * 60).iso8601,
        readings: read_all
      }
    end
    history
  end
end

# Generate sensor data
def generate_data
  sensor_array = SensorArray.new
  
  # Add sensors
  sensor_array.add_sensor(Sensor.new("Temperature", "°C", 5.0, 40.0))
  sensor_array.add_sensor(Sensor.new("Humidity", "%", 20.0, 95.0))
  sensor_array.add_sensor(Sensor.new("Distance", "cm", 5.0, 200.0))
  sensor_array.add_sensor(Sensor.new("Light Level", "lux", 0.0, 1000.0))
  sensor_array.add_sensor(Sensor.new("Battery Voltage", "V", 3.0, 12.6))
  sensor_array.add_sensor(Sensor.new("Pressure", "Pa", 95000.0, 105000.0))
  
  # Generate current reading and history
  data = {
    current: {
      timestamp: Time.now.iso8601,
      readings: sensor_array.read_all
    },
    history: sensor_array.generate_history(10),
    metadata: {
      generated_at: Time.now.iso8601,
      sensor_count: 6,
      project: "Ruby Sensor Data Reader",
      author: "Claire Kimani"
    }
  }
  
  # Save to JSON file
  File.open('sensor_data.json', 'w') do |file|
    file.write(JSON.pretty_generate(data))
  end
  
  puts "✅ Sensor data generated successfully!"
  puts "📄 File: sensor_data.json"
  puts "🕐 Timestamp: #{Time.now}"
end

# Run if executed directly
if __FILE__ == $PROGRAM_NAME
  generate_data
end