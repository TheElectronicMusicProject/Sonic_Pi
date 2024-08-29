# Add randomization

live_loop :melody do
  # Like a dice
  if one_in(6)
    use_transpose 2
  else
    use_transpose 0
  end
  
  play_pattern_timed [:C4, :E4, :F4, :G4, :F4, :E4, :F4, :G4, :F4, :E4, :F4],
    [0.25, 0.25, 0.25, 1.5, 0.25, 1.5, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25],
    attack: 0, release: 0.2
end

# You can use:
# play [:C, :E, :G].choose randomly selects notes of the C major chord.
# But it is better to use:
# play (chord :C, :major).choose
live_loop :bass do
  use_synth :tb303
  # Random selection of the cutoff value with floating point values
  play (chord :C2, :major).choose, release: 0.125, cutoff: rrand(60, 110)
  sleep 0.25
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