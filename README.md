# Ruby Sensor Data Reader - Beginner's Toolkit

**Author:** Claire Kimani  
**Date:** November 26-27, 2025  
**Technology:** Ruby Programming Language + Vue.js Frontend  
**Project Goal:** Learn Ruby basics through a robotics-themed sensor data reader with web visualization

**🔗 Live Demo:** [Your GitHub Pages URL will go here]

---

## 1. Title & Objective

### What Technology?
**Ruby** - A dynamic, object-oriented programming language known for its elegant syntax and beginner-friendly nature.
**Vue.js** - Progressive JavaScript framework for building user interfaces (used for data visualization).

### Why Choose Ruby?
- Easy to read and write (great for beginners)
- Used in robotics through frameworks like Artoo
- Excellent for rapid prototyping
- Strong community and documentation
- Good foundation for learning programming concepts

### End Goal
Create a working sensor data reader program that:
1. Simulates how robots collect environmental data (Ruby backend)
2. Displays data in an interactive web dashboard (Vue.js frontend)
3. Demonstrates full-stack development basics

---

## 2. Quick Summary of the Technology

### What is Ruby?
Ruby is a dynamic, interpreted programming language created by Yukihiro Matsumoto in 1995. It emphasizes simplicity and productivity with an elegant syntax that's natural to read and easy to write.

### Where is it Used?
- **Web Development:** Ruby on Rails framework (GitHub, Shopify, Airbnb)
- **Automation & Scripting:** System administration, data processing
- **Robotics:** Artoo framework for controlling drones, Arduinos, Raspberry Pi
- **DevOps:** Chef configuration management
- **Data Processing:** JSON/CSV handling, API integration

### Real-World Robotics Example
The **Artoo framework** allows Ruby developers to control robots and IoT devices. For example:
- Program drone flight patterns
- Control Arduino-based robot arms
- Process sensor data from Raspberry Pi devices
- Create web interfaces for robot control panels

---

## 3. Project Architecture

### Technology Stack

```
┌─────────────────────────────────────┐
│         Frontend (Vue.js)           │
│   - Interactive dashboard           │
│   - Real-time data display          │
│   - Responsive design               │
└──────────────┬──────────────────────┘
               │
               │ JSON Data
               │
┌──────────────▼──────────────────────┐
│       Backend (Ruby)                │
│   - Sensor simulation               │
│   - Data generation                 │
│   - JSON output                     │
└─────────────────────────────────────┘
```

### Files Structure

```
ruby-sensor-toolkit/
├── sensor_reader.rb           # Original CLI version
├── generate_sensor_data.rb    # JSON data generator
├── sensor_data.json           # Generated sensor data
├── index.html                 # Vue.js dashboard
├── README.md                  # This file
└── AI_PROMPT_JOURNAL.md       # Learning documentation
```

---

## 4. System Requirements

### Required Software
- **Ruby** (version 2.7 or higher)
- **Web Browser** (Chrome, Firefox, Safari, Edge)
- **Text Editor** (VS Code, Sublime, Vim, nano)
- **Git** (for version control)

### Operating System
- ✅ Linux (Ubuntu 20.04+ tested)
- ✅ macOS
- ✅ Windows (with minor adjustments)

---

## 5. Installation & Setup Instructions

### Step 1: Install Ruby

**On Ubuntu/Debian Linux:**
```bash
sudo apt update
sudo apt install ruby-full
ruby --version  # Verify installation
```

**On macOS:**
```bash
brew install ruby
```

**On Windows:**
Download from https://rubyinstaller.org/

### Step 2: Clone or Download Project

```bash
# Option 1: Clone from GitHub
git clone https://github.com/clairekimani123/RoboticRuby
cd ruby-sensor-toolkit

# Option 2: Download ZIP and extract
```

### Step 3: Generate Sensor Data

```bash
ruby generate_sensor_data.rb
```

Expected output:
```
✅ Sensor data generated successfully!
📄 File: sensor_data.json
🕐 Timestamp: 2025-11-26 20:30:45
```

### Step 4: Open Dashboard

**Option 1: Double-click**
- Just double-click `index.html` in your file manager

**Option 2: Command line**
```bash
# Linux
xdg-open index.html

# macOS
open index.html

# Or use a local server (optional)
python3 -m http.server 8000
# Then visit: http://localhost:5500
```

---

## 6. Usage Guide

### CLI Version (Terminal)

```bash
ruby sensor_reader.rb
```

Follow the prompts to see sensor readings in the terminal.

### Web Dashboard Version

1. **Generate fresh data:**
   ```bash
   ruby generate_sensor_data.rb
   ```

2. **Open `index.html` in browser**

3. **View real-time sensor data** with visual indicators

4. **Click "Refresh Sensor Data"** to generate new readings

---

## 7. Features

### Backend (Ruby)

✅ **Object-Oriented Design**
- `Sensor` class for individual sensors
- `SensorArray` class for managing multiple sensors

✅ **6 Sensor Types**
- Temperature (5-40°C)
- Humidity (20-95%)
- Distance (5-200cm)
- Light Level (0-1000 lux)
- Battery Voltage (3-12.6V)
- Pressure (95000-105000 Pa)

✅ **Intelligent Analysis**
- Automatic status detection (Normal/Warning/Alert/Info)
- Realistic value ranges
- Contextual messages

✅ **Data Export**
- JSON format for easy integration
- Includes metadata and timestamps
- Historical data tracking

### Frontend (Vue.js)

✅ **Responsive Dashboard**
- Grid layout adapts to screen size
- Mobile-friendly design

✅ **Real-time Display**
- Color-coded status indicators
- Large, readable values
- Status messages for each sensor

✅ **Interactive Features**
- Refresh button for new data
- Auto-refresh every 30 seconds
- Smooth animations and transitions

✅ **Educational Context**
- Robotics applications explained
- Project information displayed
- Technology stack visible

---

## 8. Code Examples

### Creating a Sensor (Ruby)

```ruby
# Define a sensor with name, unit, min, and max values
temp_sensor = Sensor.new("Temperature", "°C", 5.0, 40.0)

# Read a value
reading = temp_sensor.read  # Returns: 23.45 (random between 5 and 40)
```

### Reading All Sensors (Ruby)

```ruby
sensor_array = SensorArray.new
sensor_array.add_sensor(Sensor.new("Temperature", "°C", 5.0, 40.0))
sensor_array.add_sensor(Sensor.new("Humidity", "%", 20.0, 95.0))

readings = sensor_array.read_all
# Returns array of sensor data with status analysis
```

### Displaying Data (Vue.js)

```vue
<div v-for="sensor in current.readings" :key="sensor.name">
  {{ sensor.name }}: {{ sensor.value }} {{ sensor.unit }}
  Status: {{ sensor.status.message }}
</div>
```

---

## 9. AI Prompt Journal

See `Documentation.md` for detailed documentation of:
- All prompts used during development
- AI responses and learning outcomes
- Iterative improvements
- Troubleshooting steps

**Key Learning Areas:**
- Ruby classes and instance variables
- Object-oriented programming
- JSON data handling
- Vue.js reactive data binding
- Frontend-backend integration

---

## 10. Common Issues & Fixes

### Issue #1: "sensor_data.json not found"
**Problem:** HTML shows error loading data

**Solution:**
```bash
ruby generate_sensor_data.rb
```
Make sure the JSON file is in the same directory as index.html

### Issue #2: Data doesn't refresh
**Problem:** Click refresh but data stays the same

**Solution:**
1. Generate new data: `ruby generate_sensor_data.rb`
2. Hard refresh browser: `Ctrl + F5` (or `Cmd + Shift + R` on Mac)

### Issue #3: Ruby not found
**Problem:** Command not recognized

**Solution:**
```bash
# Install Ruby
sudo apt install ruby-full

# Verify
ruby --version
```

### Issue #4: HTML doesn't open
**Problem:** Double-clicking HTML doesn't work

**Solution:**
- Right-click → Open with → Choose browser
- Or drag file into browser window

### Issue #5: CORS error in browser console
**Problem:** "Cross-Origin Request Blocked"

**Solution:**
Use a local server:
```bash
python3 -m http.server 8000
# Visit: http://localhost:8000
```

---

## 11. Learning Outcomes

### What I Learned About Ruby:
✅ Classes and object-oriented programming  
✅ Instance variables (@variable)  
✅ Methods and parameters  
✅ Arrays and hashes  
✅ JSON generation  
✅ File I/O operations  
✅ Random number generation  

### What I Learned About Vue.js:
✅ Reactive data binding  
✅ Template syntax (v-for, v-if)  
✅ Methods and lifecycle hooks  
✅ Fetching external data  
✅ Component structure  

### What I Learned About AI-Assisted Development:
✅ How to write effective prompts  
✅ Breaking complex problems into steps  
✅ Iterating based on AI feedback  
✅ Debugging with AI assistance  
✅ Learning new technologies faster  

---

## 12. Real-World Robotics Context

### How This Applies to Real Robots:

**In Simulation (This Project):**
- Random sensor values
- JSON data format
- Web-based visualization

**In Real Hardware:**
- Would read from actual sensors via GPIO/Serial
- Use libraries like `serialport` gem
- Real-time data streaming
- Error handling for disconnected sensors
- Sensor calibration and noise filtering

### Next Steps for Robotics:
1. Connect to Arduino with serial communication
2. Use Raspberry Pi GPIO pins
3. Implement Artoo framework
4. Add sensor fusion algorithms
5. Build autonomous navigation logic

---

## 13. Future Enhancements

### Potential Improvements:
- [ ] Historical data charts (using Chart.js)
- [ ] Data export to CSV
- [ ] Email/SMS alerts for critical values
- [ ] Multiple robot support
- [ ] Real-time WebSocket updates
- [ ] Database integration (SQLite)
- [ ] User authentication
- [ ] Custom sensor configuration UI

---

## 14. References & Resources

### Ruby Resources:
- **Official Ruby Site:** https://www.ruby-lang.org/
- **Ruby Documentation:** https://ruby-doc.org/
- **Ruby Style Guide:** https://rubystyle.guide/
- **Learn Ruby:** https://www.codecademy.com/learn/learn-ruby

### Vue.js Resources:
- **Vue.js Official:** https://vuejs.org/
- **Vue.js Guide:** https://vuejs.org/guide/
- **Vue 3 Documentation:** https://v3.vuejs.org/

### Robotics with Ruby:
- **Artoo Framework:** http://artoo.io/
- **Ruby & Arduino:** https://playground.arduino.cc/Interfacing/Ruby/

### AI Learning:
- **Claude AI:** https://claude.ai/
- **Prompt Engineering:** https://docs.anthropic.com/

---

## 15. Demo & Deployment

### Local Demo:
1. Generate data: `ruby generate_sensor_data.rb`
2. Open: `index.html`
3. View dashboard in browser

### GitHub Pages Deployment:
```bash
# Push to GitHub
git add .
git commit -m "Add sensor reader with Vue.js dashboard"
git push origin main

# Enable GitHub Pages
# Settings → Pages → Source: main branch
# Your site will be at: https://username.github.io/repo-name/
```

---

## 16. Project Statistics

- **Lines of Code (Ruby):** ~200 lines
- **Lines of Code (HTML/Vue/CSS):** ~350 lines
- **Total Development Time:** 2 days
- **AI Prompts Used:** 10+
- **Technologies Learned:** 2 (Ruby + Vue.js)
- **Sensor Types Implemented:** 6
- **Coffee Consumed:** ☕☕☕

---

## 17. Acknowledgments

- **Moringa School** - For the capstone project framework
- **Claude AI** - For AI-assisted learning and development
- **Ruby Community** - For excellent documentation
- **Vue.js Team** - For the progressive framework

---

## 18. License

MIT License - Feel free to use this project for learning purposes!

---

## 19. Contact

**Author:** Claire Kimani  
**GitHub:** [Your GitHub Profile]  
**Project Repository:** [Your Repo URL]  
**LinkedIn:** [Your LinkedIn]  

---

**Created as part of Moringa School AI Capstone Project**  
*"Prompt-Powered Kickstart: Building a Beginner's Toolkit for Ruby"*

---

## Quick Start (TL;DR)

```bash
# 1. Generate sensor data
ruby generate_sensor_data.rb

# 2. Open dashboard
open index.html  # or double-click the file

# 3. Enjoy! 🎉
```