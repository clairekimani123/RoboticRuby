# AI Prompt Journal - Ruby Sensor Data Reader

## Date: 28/11/2025
**Student:** Claire Kimani  
**Technology:** Ruby Programming Language  
**Project:** Sensor Data Reader for Robotics

---

## Prompt #1: Technology Overview
**Prompt:**
```
What is Ruby programming language? Give me a beginner-friendly overview 
with one real-world use case in robotics or hardware.
```

**AI Response Summary:**
Ruby is a dynamic, object-oriented programming language created by Yukihiro Matsumoto in 1995. It's known for being beginner-friendly with readable syntax. In robotics, Ruby is used through frameworks like Artoo to control hardware including Arduino boards, drones, and Raspberry Pi devices. It's particularly good for rapid prototyping and scripting robot behaviors.

**My Evaluation:**
✅ Helpful - Gave me confidence Ruby is suitable for robotics  
✅ Clear explanation of what Ruby is  
✅ Real-world robotics example provided

---

## Prompt #2: Installation on Linux
**Prompt:**
```
What do I need to install to start using Ruby on Linux? 
Give me the exact commands for Ubuntu/Debian-based systems.
```

**AI Response Summary:**
For Ubuntu/Debian Linux:
1. Update package list: `sudo apt update`
2. Install Ruby: `sudo apt install ruby-full`
3. Verify: `ruby --version` and `gem --version`

**My Evaluation:**
✅ Simple and direct commands  
✅ Worked on my system without issues  
✅ Included verification steps

**Installation Result:**
- Ruby version installed:ruby 3.2.3 
- Time taken: ~5 minutes

---

## Prompt #3: Project Structure
**Prompt:**
```
I want to create a Ruby program that simulates reading sensor data 
(temperature, distance, humidity) like in a robot. What's a good 
structure for this program? Should I use classes?
```

**AI Response Summary:**
Recommended using object-oriented approach with:
- `Sensor` class to represent individual sensors
- `SensorArray` class to manage multiple sensors
- Methods for reading, displaying, and analyzing data
- Simulation using Ruby's `rand()` for realistic sensor values

**My Evaluation:**
✅ Clear architecture recommendation  
✅ OOP approach makes code organized  
✅ Good for learning Ruby fundamentals

---

## Prompt #4: Code Implementation
**Prompt:**
```
Create a complete Ruby program for sensor data reading with:
- Multiple sensor types (temperature, humidity, distance, light, battery)
- Random value generation within realistic ranges
- Display formatted output
- Basic analysis (warnings for unusual values)
- User interaction (choose number of readings)
```

**AI Response Summary:**
Received complete working code with:
- Sensor class with name, unit, min/max values
- SensorArray class for managing multiple sensors
- Methods for reading, displaying, and analyzing
- User input for number of readings
- Formatted output with timestamps

**My Evaluation:**
✅ Code ran immediately without errors  
✅ Well-commented and readable  
✅ Includes realistic sensor ranges  
✅ Analysis feature adds intelligence  

**Improvements Made:**
- Added a vue CDN to vew my sensor cards on the website.

---

## Prompt #5: Common Errors
**Prompt:**
```
What are the most common errors beginners face when starting 
with Ruby, especially with this type of program?
```

**AI Response Summary:**
Common issues include:
1. Syntax errors (missing `end` keywords)
2. File permissions (need to make .rb files executable)
3. Input handling (using `.to_i` for integer conversion)
4. Random number generation (understanding `rand()`)

**My Evaluation:**
✅ Covered issues I might actually face  
✅ Preventive knowledge helpful  

---

## Prompt #6: Robotics Context
**Prompt:**
```
How does this sensor reading concept apply to real robotics? 
What would be different with actual hardware?
```

**AI Response Summary:**
In real robotics:
- Would use libraries like `serialport` gem to read from Arduino/sensors
- Data comes from actual GPIO pins or serial connections
- Need error handling for disconnected sensors
- Timing becomes critical (sensor polling rates)
- Data filtering needed (noise reduction)

**My Evaluation:**
✅ Bridges learning project to real applications  
✅ Shows path to next learning steps  

---

## Prompt #7: Enhancement Ideas
**Prompt:**
```
What are simple ways to enhance this sensor reader program 
that a beginner could implement?
```

**AI Response Summary:**
Suggested enhancements:
- Save readings to CSV file
- Calculate averages over time
- Add more sensor types
- Create data visualization
- Add timestamp logging

**My Evaluation:**
✅ Realistic additions  
✅ Good for future learning  
⚠️ Some too complex for this week's timeline

---

## Prompt #8: Understanding Instance Variables (@)
**Date:** Tuesday, November 25, 2025

**Prompt:**
```
In the Ruby code, I see @name, @unit, @sensors with @ symbols. 
What does the @ symbol mean? Why do we use it? Give me a simple example.
```

**AI Response Summary:**
The @ symbol creates instance variables in Ruby. Unlike regular variables that only exist in one method, instance variables belong to the entire object and can be accessed by any method in the class. Example: @name in a Sensor object persists so that both initialize and read methods can use it.

**What I Learned:**
- @ makes variables belong to the object, not just one method
- Without @, variables disappear when the method ends
- Each object has its own instance variables (temp_sensor's @name is different from humidity_sensor's @name)
- This is why sensor data persists and can be used across methods

**My Evaluation:**
✅ Very clear explanation with examples
✅ The Robot analogy helped me understand
✅ Now I understand why we need @ in our sensor code

**Test I Did:**
Created test_instance_var.rb and ran it - saw how @age and @name persist across methods!


## Prompt #9: Adding a New Sensor Type
**Date:** Wednesday, November 26, 2025

**Prompt:**
```
I want to add a new sensor type called 'Pressure' that measures 
in 'Pa' (Pascals) from 95000 to 105000. Show me exactly what 
line to add to the code.
```

**AI Response Summary:**
Add this line after the Battery Voltage sensor:
```ruby
sensor_array.add_sensor(Sensor.new("Pressure", "Pa", 95000.0, 105000.0))
```
The values 95000-105000 Pa represent realistic atmospheric pressure range. Also learned how to add pressure analysis to the analyze_readings method.

**What I Learned:**
- Adding new sensors is just one line of code
- The Sensor class is reusable for any sensor type
- Just need to provide: name, unit, min value, max value
- Pressure values are based on real atmospheric pressure
- Can also add custom analysis for the new sensor

**What I Tried:**
✅ Added the pressure sensor line
✅ Ran the program - saw 6 sensors now!
✅ Added pressure analysis (optional enhancement)
✅ Tested multiple times - works perfectly

**My Evaluation:**
✅ Super easy to add new sensors
✅ Understood the pattern for extending the code
✅ Learned about real-world pressure values
✅ Shows power of object-oriented programming

**Screenshot:** [Take a screenshot of your output showing the Pressure sensor]

## Prompt #10: Web Integration Decision
**Date:** Wednesday, November 26, 2025 - Evening

**Prompt:**
```
I need to add a web frontend to my Ruby sensor project so I can have 
a live link for GitHub Pages. Should I use Vue.js? How do I integrate 
Ruby backend with Vue frontend?
```

**AI Response Summary:**
Suggested creating a hybrid approach:
- Ruby generates sensor data and saves to JSON
- Vue.js reads the JSON and displays in browser
- Can host on GitHub Pages for free live link
- Keeps project simple but impressive

**My Evaluation:**
✅ Solves the live link requirement
✅ Shows full-stack thinking
✅ Still demonstrates Ruby as main technology
✅ Vue adds professional polish

---

## Prompt #11: JSON Data Generation
**Prompt:**
```
How do I modify my Ruby sensor code to output data as JSON 
that a web frontend can read?
```

**AI Response Summary:**
Created `generate_sensor_data.rb` that:
- Uses Ruby's JSON library
- Structures data with current readings and history
- Saves to `sensor_data.json` file
- Includes metadata about the project

**What I Learned:**
- Ruby's `require 'json'` for JSON handling
- `JSON.pretty_generate()` for formatted output
- File I/O with `File.open()`
- Data structure design for frontend consumption

---

## Prompt #12: Vue.js Dashboard Creation
**Prompt:**
```
Create a Vue.js dashboard that reads sensor_data.json and displays 
it beautifully with cards for each sensor, color-coded status, and 
a refresh button.
```

**AI Response Summary:**
Built complete HTML page with:
- Vue 3 CDN (no installation needed)
- Responsive grid layout
- Color-coded sensor cards
- Status indicators
- Refresh functionality
- Beautiful gradient design

**What I Learned:**
- Vue.js basics (data, methods, mounted)
- Fetch API for reading JSON
- Reactive data binding with v-for
- Event handling with @click
- CSS Grid for responsive layouts

**My Evaluation:**
✅ Professional-looking dashboard
✅ Easy to understand Vue.js code
✅ Works without complex setup
✅ Mobile-responsive design

## Overall AI Learning Reflection

**How AI Improved My Productivity:**
- Reduced learning time from days to hours
- Got working code quickly to understand and modify
- Avoided common beginner mistakes with guidance
- Understood real-world context for the technology

**What I Learned About Prompting:**
- Specific prompts get better responses
- Breaking complex questions into smaller prompts works better
- Asking for "beginner-friendly" helps get appropriate responses
- Context matters (mentioning Linux, robotics interest, etc.)


---

**Total Prompts Used:** 7+  
**Most Helpful Prompt:** #4 almost all were helpful 
**Time Saved:** Estimated 10+ hours vs learning from scratch