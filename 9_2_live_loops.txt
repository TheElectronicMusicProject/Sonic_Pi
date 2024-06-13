# 9.2 Live Loops

# No need to press stop to apply changes!

live_loop :foo do
  sample :loop_garzul
  use_synth :prophet
  play_pattern_timed chord(:c3, :minor), 0.25, release: 8, cutoff: rrand(70, 130), res: 0.9
  sleep 7.25
  puts "# Test"
end