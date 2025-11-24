#!/usr/bin/env ruby

# Sensor Data Reader - A Simple Ruby Program for Robotics Learning
# This simulates reading data from multiple sensors like those found in robots

class Sensor
  attr_reader :name, :unit
  
  def initialize(name, unit, min_value, max_value)
    @name = name
    @unit = unit
    @min_value = min_value
    @max_value = max_value
  end
  
  def read
    # Simulate sensor reading with random values
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
    readings = {}
    @sensors.each do |sensor|
      readings[sensor.name] = {
        value: sensor.read,
        unit: sensor.unit
      }
    end
    readings
  end
  
  def display_readings(readings)
    puts "\n" + "=" * 50
    puts "SENSOR READINGS - #{Time.now.strftime('%Y-%m-%d %H:%M:%S')}"
    puts "=" * 50
    
    readings.each do |name, data|
      puts "#{name.ljust(20)}: #{data[:value]} #{data[:unit]}"
    end
    
    puts "=" * 50
  end
  
  def analyze_readings(readings)
    puts "\n--- ANALYSIS ---"
    
    # Temperature check
    temp = readings["Temperature"][:value]
    if temp > 30
      puts "⚠️  WARNING: High temperature detected!"
    elsif temp < 10
      puts "❄️  INFO: Low temperature detected"
    else
      puts "✅ Temperature: Normal"
    end
    
    # Distance check (for obstacle detection)
    distance = readings["Distance"][:value]
    if distance < 20
      puts "🚨 ALERT: Obstacle detected nearby!"
    else
      puts "✅ Distance: Clear path"
    end
    
    # Humidity check
    humidity = readings["Humidity"][:value]
    if humidity > 80
      puts "💧 INFO: High humidity environment"
    else
      puts "✅ Humidity: Normal"
    end
  end
end

# Main Program
def main
  puts "\n🤖 ROBOTIC SENSOR DATA READER"
  puts "Simulating sensor readings for robotics applications\n"
  
  # Create sensor array
  sensor_array = SensorArray.new
  
  # Add different types of sensors (like those in a robot)
  sensor_array.add_sensor(Sensor.new("Temperature", "°C", 5.0, 40.0))
  sensor_array.add_sensor(Sensor.new("Humidity", "%", 20.0, 95.0))
  sensor_array.add_sensor(Sensor.new("Distance", "cm", 5.0, 200.0))
  sensor_array.add_sensor(Sensor.new("Light Level", "lux", 0.0, 1000.0))
  sensor_array.add_sensor(Sensor.new("Battery Voltage", "V", 3.0, 12.6))
  
  # Ask user how many readings to take
  print "How many sensor readings do you want? (1-10): "
  count = gets.chomp.to_i
  count = [[count, 1].max, 10].min  # Ensure between 1 and 10
  
  # Take multiple readings
  count.times do |i|
    puts "\n>>> Reading ##{i + 1}"
    readings = sensor_array.read_all
    sensor_array.display_readings(readings)
    sensor_array.analyze_readings(readings)
    
    if i < count - 1
      print "\nPress Enter for next reading..."
      gets
    end
  end
  
  puts "\n✅ Sensor reading complete!"
  puts "In a real robot, this data would be used for:"
  puts "  • Navigation (distance sensors)"
  puts "  • Environmental monitoring (temp/humidity)"
  puts "  • Power management (battery voltage)"
  puts "  • Decision making (all sensor fusion)"
end

# Run the program
if __FILE__ == $PROGRAM_NAME
  main
end