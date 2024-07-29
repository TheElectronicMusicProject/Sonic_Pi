# Echo
# amp: amplitude of sound (default 1) - slide parameters
# mix: the percentage of FX present in the resulting sound (default 1) - slide parameters
# pre_amp: amplification applied to the input signal before it is passed to the FX (default 1) - slide parameters
# phase: time between echoes in beats (default 0.25) - slide parameters
# decay: time, in beats, taken for echoes to fade away (default 2) - slide parameters
# max_phase: maximum phase duration in beats (default 2) [can't be changed once set]

set_mixer_control! amp: 1

amp = 1
mix = 1
pre_amp = 1
phase = 0.125
decay = 9
max_phase = 1

with_fx :echo, amp: amp, mix: mix, pre_amp: pre_amp, phase: phase, decay: decay, max_phase: max_phase do
  play 50
end