# Lead track

# Instead of:
# play :C2
# sleep 0.5
# play :D2
# sleep 0.25
# play :E2
# sleep 0.75
# play :D2
# sleep 0.5
# We can write:
# play_pattern_timed [:C2, :D2, :E2, :D2], [0.5, 0.25, 0.75, 0.5]

live_loop :melody do
  # Note 60, 64, 65, 67, 65, 64, 65, 67, 65, 64, 65
  play_pattern_timed [:C4, :E4, :F4, :G4, :F4, :E4, :F4, :G4, :F4, :E4, :F4],
    [0.25, 0.25, 0.25, 1.5, 0.25, 1.5, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25]
end

live_loop :bass do
  use_synth :fm
  
  play :C2, attack: 0, release: 0.25 # Note 36
  sleep 0.25
  play :C2, attack: 0, release: 0.3 # Note 36
  sleep 2
  play :E2 # Note 40
  sleep 0.75
  play :F2 # Note 41
  sleep 1
end

live_loop :drums do
  sample :drum_heavy_kick
  sleep 1
  sample :drum_snare_hard
  sleep 1
  sample :drum_heavy_kick
  sleep 1
  sample :drum_snare_hard
  sleep 1
end

live_loop :hihat do
  sample :drum_cymbal_closed
  sleep 0.25
  sample :drum_cymbal_pedal
  sleep 1
end