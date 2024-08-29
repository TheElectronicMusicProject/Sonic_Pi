# Bass track

use_bpm 60

# Default synth in Sonic Pi is beep
# To change a synth use:
# use_synth :name_of_synth

# AD amplitude control permit to control attack and release
# The time of attack + decay + sustain + release is the total play time

# Short staccato: set attack to zero and release to a very short value

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