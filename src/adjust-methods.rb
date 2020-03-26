#This is to store a default setting and store custom settings
$settings = {
    :difficulty => "Medium",
    :reminder_time => 10,
    :exercise_time => 5,
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
end

# Allows the user to set space
def set_space_available
    set_space_arr = { "Yes" => true, "No" => false}
    set_space = $prompt.select("Do you have limited space?", set_space_arr)
    $settings[:space] = set_space
    main_menu()
end