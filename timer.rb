def timer(input)
  t = Time.new(0)
  countdown_time_in_seconds = input # change this value
  
  countdown_time_in_seconds.downto(0) do |seconds|
    puts (t + seconds).strftime('%H:%M:%S')
    sleep 1
    system "clear"
  end
end

# Allows the user to set timer
def set_reminder_time
  reminder = $prompt.slider('How often would you like to be reminded? (minutes):', max: 60, step: 5, default: 10)
  $settings[:reminder_time] = reminder
  main_menu()
end
