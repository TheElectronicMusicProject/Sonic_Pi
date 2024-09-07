set_mixer_control! amp: 1
use_debug false
use_bpm 60

# Global time measurement
live_loop :metro do
  cue :tick
  sleep 1
end

live_loop :bd, sync: :tick do
  #stop
  sample :bd_klub
  sleep 0.5
end

live_loop :drums, sync: :tick do
  stop
  3.times do
    sample :loop_amen, beat_stretch: 2
    sleep 2
  end
  
  1.times do
    sample :loop_amen, beat_stretch: 2, finish: 0.5
    sleep 1
  end
  
  4.times do
    # The sample is divided in 8 slices, randomly picking a slice
    sample :loop_amen, beat_stretch: 2, num_slices: 8, slice: pick
    sleep 0.25
  end
end

live_loop :bass, sync: :tick do
  #stop
  use_synth :fm
  use_synth_defaults depth: 2, divisor: 1, cutoff: 90, amp: rrand(0, 0.75)
  
  # New ring of boolean values with num_accent true values inside a size number of elements
  # First argument are num_accents
  # Second argument are size
  if spread((ring 7, 9, 11).choose, 16).tick
    # Drop removes the specified number of elements from the array
    play (scale :C2, :minor_pentatonic).drop(1).choose, release: 0.125
  end
  
  sleep (ring 0.125, 0.25).choose
end

live_loop :bass_support, sync: :tick do
  #stop
  use_synth :fm
  use_synth_defaults depth: 2, divisor: 1, cutoff: 90, amp: rrand(0, 0.75)
  
  if spread((ring 7, 9, 11).choose, 16).tick
    play (scale :C2, :minor_pentatonic).drop(1).choose, release: 0.125
  end
  
  sleep (ring 0.125, 0.25).choose
end

live_loop :chords, sync: :tick do
  #stop
  with_fx :reverb do
    with_fx :wobble do
      # Invert shifts the chord
      play (chord :C, :minor7, invert: rrand_i(0, 3), num_octaves: 2), release: 2, attack: 1
    end
    
    sleep 2.5
    play (chord :C, :minor7, invert: (ring 0, 1).choose), release: 0.25
    sleep 1
    play (chord :D, :minor7, invert: (ring 0, 2).choose), release: 0.25
    sleep 0.5
  end
end

# Use 'channel: 4' when working with 'midi' and 'midi_chord'
# pads that work quite well for demos:
# A026 Chronos
# A031 PitchChifter
# A037 FlyingDutchman T
# B018 Trance2K RL
# B090 Icelandic RL
# B091 Avatar RL
# 50s Pad
# ...
##| live_loop :chords, sync: :metro do
##|   at (ring 0,2,3.5), (ring [:c4, 2.5], [:c4, 2], [:d4, 1.5]) do |n|
##|     #with_fx :reverb, room: 0.75, mix: 0.75 do
##|     midi_chord (chord n[0], :minor7, num_octaves: (ring 1,2).choose, invert: (ring 1,2,3).choose), sustain: n[1], channel: 4
##|     #end
##|   end
##|   sleep 4
##| end