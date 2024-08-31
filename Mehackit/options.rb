# Options

# amp: loudness of a sound (0 no sound, 1 full sound, >1 additional sound)
# pan: panning of a sound in stereo (-1 left speaker, 1 right speaker, 0 center)
# cutoff: remove frequencies higher than the given value
# attack: time in beats for the attack phase
# release: time in beats for the release phase
# use_synth_defaults: set default options for all the next plays in the loop
# use_sample_defaults: set default options for all the next samples in the loop
# beat_stretch: stretch/shrink the sample
# rate: control the amount of speed a sample is played (1 original speed, 0.5 half speed, 2 double speed, <0 backward). It changes the pitch

live_loop :melody do
  use_synth :mod_fm
  use_synth_defaults attack: 0.25, release: 0.5, pan: rrand(-0.5, 0.5), cutoff: 50
  
  play 72 # Note C5
  sleep 0.25
  play 76 # Note E5
  sleep 0.25
  play 76 # Note E5
  sleep 0.25
end

sample_name = :loop_amen
puts sample_duration(sample_name)

live_loop :amen_break do
  sample sample_name, beat_stretch: 2, rate: -1
  sleep 2
end
