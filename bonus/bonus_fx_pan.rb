# Pan
# amp: amplitude of sound (default 1) - slide parameters
# mix: the percentage of FX present in the resulting sound (default 1) - slide parameters
# pre_amp: amplification applied to the input signal before it is passed to the FX (default 1) - slide parameters
# pan: position of sound in stereo (default 0) - slide parameters

set_mixer_control! amp: 2

amp = 1
mix = 1
pre_amp = 1
pan = -0.9

with_fx :pan, amp: amp, mix: mix, pre_amp: pre_amp, pan: pan do
  play 50
end