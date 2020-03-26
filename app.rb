require 'tty-prompt'
# require 'artii'
# require 'lol-cat'
# require "unicode/emoji"
# require "audio-playback"
require "./adjust-methods.rb"
require "./exercises.rb"
require "./timer.rb"

$prompt = TTY::Prompt.new

require 'json'
file = File.read('exercises.json')
$exercises = JSON.parse(file)

def display_settings()
    if $settings[:space] == true
        display_setting = "Yes"
    else
        display_setting = "No"
    end
    puts "Current Settings: \nDifficulty: #{$settings[:difficulty]} | Reminder Interval: #{$settings[:reminder_time]} | Limited Space: #{display_setting}"
end

def select_exercise()
    valid_exercises = []
    $exercises.each do | exercise |
      if exercise["limited_space"] == $settings[:space].to_s && exercise["difficulty"].include?($settings[:difficulty].downcase)
        # p exercise["difficulty"]
        # break
        valid_exercises.push(exercise)
      end
    end
    puts valid_exercises.sample.to_s

    # Are your eady to start exercising?
    start = $prompt.select("Are you ready to start exercising?", ["Yes", "No"])

    timer[:reminder_time]

    

  end

#Main menu function below. Allowing user to customize settings.
def main_menu()
    system "clear"
    puts "Hi! Welcome to \\m/ ISOLATION! \\m/"
    display_settings()
#             \This just lets it run/
    menu_arr = ["Start", "Difficulty", "Reminder Time", "Space Available", "Exit"]
    answer = $prompt.select("Choose what you want to do", menu_arr)
    if answer == "Start"
        select_exercise
    elsif answer == "Difficulty"
        # difficulty adjustment
        set_difficulty
    elsif answer == "Reminder Time"
        # Reminder time adjustment
        set_reminder_time
    elsif answer == "Space Available"
        # Space adjustment
        set_space_available
    else answer == "Exit"
        puts "BYE! Stay corona free"
    end
end

main_menu()


# This is to remind user to exercise
# def interval_time()
#     reminder_time = timer
#     while = true
#     if timer == 0
#     puts "Time to exercise"
#     select_exercise()
#     end
# end
