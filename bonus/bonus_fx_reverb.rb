# Reverb
# amp: amplitude of sound (default 1) - slide parameters
# mix: the percentage of FX present in the resulting sound (default 1) - slide parameters
# pre_amp: amplification applied to the input signal before it is passed to the FX (default 1) - slide parameters
# room: room size (default 0.6) - slide parameters
# damp: high frequency dampening (default 0.5) - slide parameters

set_mixer_control! amp: 5

amp = 1
mix = 1
pre_amp = 1
room = 0.9
damp = 0.9

with_fx :reverb, amp: amp, mix: mix, pre_amp: pre_amp, room: room, damp: damp do
  play 50
end