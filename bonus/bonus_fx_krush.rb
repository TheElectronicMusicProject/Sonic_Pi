# Krush
# amp: amplitude of sound (default 1) - slide parameters
# mix: the percentage of FX present in the resulting sound (default 1) - slide parameters
# pre_amp: amplification applied to the input signal before it is passed to the FX (default 1) - slide parameters
# gain: amount of crushing (default 5) - slide parameters
# cutoff: MIDI note representing the highest frequencies allowed in the sound (default 100) - slide paramters
# res: filter resonance (default 0) - slide parameters

set_mixer_control! amp: 1

amp = 1
mix = 1
pre_amp = 1
gain = 9
cutoff = 120
res = 0.99

with_fx :krush, amp: amp, mix: mix, pre_amp: pre_amp, gain: gain, cutoff: cutoff, res: res do
  play 50
end