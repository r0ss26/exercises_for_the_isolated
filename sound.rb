# require "audio-playback"

# # Prompt the user to select an audio output
# @output = AudioPlayback::Device::Output.gets

# options = {
#   :channels => [0,1],
#   :latency => 1,
#   :output_device => @output
# }

# @playback = AudioPlayback.play("analog-watch-alarm.wav", options)

# # Play in the foreground
# @playback.block

# fork{ exec 'afplay', "./analog-watch-alarm.wav" }

# #This was above everything
# $enableMusic = true

# #This was in the method
# if $enableMusic
#   titleMusic = fork{ exec 'afplay', "./analog-watch-alarm.wav" }
# end

# system "sox 'analog-watch-alarm.wav' -t waveaudio"