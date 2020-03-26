require 'tty-prompt'
# require 'artii'
# require 'lol-cat'
# require "unicode/emoji"
# require "audio-playback"

$prompt = TTY::Prompt.new

$settings = {
  :difficulty => "Medium",
  :reminder_time => 10,
  :space => true
}

# Allows the user to set difficulty
def set_difficulty
    difficulty_arr = ["Easy", "Medium", "Hard", "Go back"]
    selection = $prompt.select("Choose your difficulty", difficulty_arr)
    puts selection

    unless selection == "Go back"
      $settings[:difficulty] = selection
      main_menu
    else
      main_menu()
    end


    # if !selection == "Go Back"
    # #   $settings[:difficulty] = selection
    #   main_menu()
    # end

    # main_menu
    
    
end

# Allows the user to set timer
def set_reminder_time
    reminder = $prompt.slider('How often would you like to be reminded? (minutes):', max: 60, step: 5, default: 10)
    $settings[:reminder_time] = reminder
    main_menu()
end

# Allows the user to set space
def set_space_available
    set_space_arr = { "Yes" => true, "No" => false}
    set_space = $prompt.select("Do you have limited space?", set_space_arr)
    $settings[:space] = set_space
    main_menu()
end





#Main menu function below. Allowing user to customize settings.
def main_menu
    puts "Hi! Welcome to \\m/ ISOLATION! \\m/"
#             \This just lets it run/
    menu_arr = ["Let's get started", "Difficulty", "Reminder Time", "Space Available", "Exit"]
    answer = $prompt.select("Choose what you want to do", menu_arr)
    if answer == "Let's get started"
        exercises
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

puts $settings


# # This is to remind user to exercise
# def interval_time
#     interval == reminder do
#     # calls exercise
#     end
# end


# #This is to call the exercise once timer has timed out
# def exercises  
#     #IF ANY OF THIS LOOKS CRAP PLEASE CHANGE IT.. UNSURE IF IT WILL WORK
    
#     interval_time = interval

#     while true
#         puts interval_time.to_i
#     if interval_time == 0
#         puts exercises_hash.sample.to_s 
#         # puts exercise to be performed then returns back to timer until timer times out again
#     end
# end










