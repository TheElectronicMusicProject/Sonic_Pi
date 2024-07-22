# 13.1 Sound In

# For the input audio, the sustain duration can be specified
# Input 3 of the sound card is used
with_fx :reverb do
  with_fx :distortion do
    synth :sound_in, sustain: 8, input 3
  end
end

# Two consecutive inputs on input 1
with_fx :bitcrusher do
  synth :sound_in_stereo, sustain: 8, input: 1
end