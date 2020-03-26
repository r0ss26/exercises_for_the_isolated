# Gems
require "tty-prompt"
require "artii"
require "unicode/emoji"

require "./adjust-methods.rb"
require "./timer.rb"

emojis = "🤩 😁 🏃 🏋️ 🤪"
$emoji_list = emojis.scan(Unicode::Emoji::REGEX)

# TTY-Prompt
$prompt = TTY::Prompt.new

# Read exercises from JSON
require 'json'
file = File.read('../data/exercises.json')
$exercises = JSON.parse(file)


#This is the start and will display current settings of user
def display_settings()
  if $settings[:space] == true
    display_setting = "Yes"
  else
    display_setting = "No"
  end
  puts "Current Settings: \nDifficulty: #{$settings[:difficulty]} | Reminder Interval: #{$settings[:reminder_time]} | Exercise Interval: #{$settings[:exercise_time]} | Limited Space: #{display_setting}"
end

def interval_timer
  timer($settings[:reminder_time] * 60)
  select_exercise
end

# This is exercise selection which matches an exercise to users settings
def select_exercise()
  #Selects the valid exercises for the user by seaching through exercises file
  valid_exercises = []
  $exercises.each do | exercise |
    if exercise["limited_space"] == $settings[:space].to_s && exercise["difficulty"].include?($settings[:difficulty].downcase)
      valid_exercises.push(exercise)
    end
  end
  chosen = valid_exercises.sample

  #Displays exercise title and instructions
  puts chosen.fetch_values("title")[0].upcase
  puts $emoji_list[2] * 6
  instructions = chosen.fetch_values("instructions")
  instructions[0].each_with_index do | value, index |
    puts "#{index + 1}: #{value.to_s}"
  end
  
  # Are you ready to start exercising?
  start = $prompt.select("Are you ready to start exercising?", ["Yes", "No"])

  if start == "Yes"
    puts "Start exercising".upcase
    puts $emoji_list[3]
    sleep 3
    timer($settings[:exercise_time] * 60)
    interval_timer
  else
      main_menu()
  end
end

#Main menu function below. Allowing user to customize settings.
def main_menu()
  system "clear"
    
  puts Artii::Base.new.asciify('Exercises 4 the Isolated')
  display_settings()
    
  # \This just lets it run/
  menu_arr = ["Start", "Difficulty", "Reminder Time", "Exercise Time", "Space Available", "Exit"]
  answer = $prompt.select("Choose what you want to do", menu_arr)
  if answer == "Start"
    select_exercise
  elsif answer == "Difficulty"
    # difficulty adjustment
    set_difficulty
  elsif answer == "Reminder Time"
    # Reminder time adjustment
    set_reminder_time
  elsif answer == "Exercise Time"
    set_exercise_time
  elsif answer == "Space Available"
    # Space adjustment
    set_space_available
  else answer == "Exit"
    puts "BYE! Stay corona free #{$emoji_list[0]}"
  end
end

main_menu()
