# Low pass filter
# amp: amplitude of sound (default 1) - slide parameters
# mix: the percentage of FX present in the resulting sound (default 1) - slide parameters
# pre_amp: amplification applied to the input signal before it is passed to the FX (default 1) - slide parameters
# cutoff: MIDI note representing the highest frequencies allowed in the sound (default 100) - slide paramters

set_mixer_control! amp: 2

amp = 1
mix = 1
pre_amp = 1
cutoff = 40

with_fx :lpf, amp: amp, mix: mix, pre_amp: pre_amp, cutoff: cutoff do
  play 50
end