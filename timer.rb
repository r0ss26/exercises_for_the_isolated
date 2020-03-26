def timer(input)
  t = Time.new(0)
  countdown_time_in_seconds = input # change this value
  
  countdown_time_in_seconds.downto(0) do |seconds|
    puts (t + seconds).strftime('%H:%M:%S')
    sleep 1
    system "clear"
  end
end

timer(300)