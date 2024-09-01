# Band example 1

use_bpm 120
use_debug false

live_loop :rummut do
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

live_loop :basso do
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

live_loop :melodia do
  use_octave 0
  # Note 60, 64, 65, 67, 65, 64, 65, 67, 65, 64, 65
  play_pattern_timed [:C4, :E4, :F4, :G4, :F4, :E4, :F4, :G4, :F4, :E4, :F4],
    [0.25, 0.25, 0.25, 1.5, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25], attack: 0, release: 0.2
end