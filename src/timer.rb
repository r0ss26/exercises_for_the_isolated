def timer(input)
  t = Time.new(0)
  countdown_time_in_seconds = input
  
  countdown_time_in_seconds.downto(0) do |seconds|
    puts (t + seconds).strftime('%H:%M:%S')
    sleep 1
    system "clear"
  end
end

# Allows the user to set timer
def set_reminder_time
  reminder = $prompt.slider('How often would you like to be reminded? (minutes):', min: 5, max: 60, step: 5, default: 10)
  $settings[:reminder_time] = reminder
  main_menu()
end

# Allows the user to set exercise timer
def set_exercise_time
  exercise_time = $prompt.slider('How long would you like each exercise interval to be? (minutes):', min: 1, max: 20, step: 1, default: 10)
  $settings[:exercise_time] = exercise_time
  main_menu()
end