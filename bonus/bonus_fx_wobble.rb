# Wobble
# amp: amplitude of sound (default 1) - slide parameters
# mix: the percentage of FX present in the resulting sound (default 1) - slide parameters
# pre_amp: amplification applied to the input signal before it is passed to the FX (default 1) - slide parameters
# phase: phase duration in beats of the slices (default 0.25) - slide parameters
# cutoff_min: minimun MIDI note that will move to whilst wobbling (default 60) - slide parameters
# cutoff_max: maximum MIDI note that will move to whilst wobbling (default 120) - slide parameters
# res: filter resonance (default 0.8) - slide parameters
# phase_offset: initial phase offset (default 0) [can't be changed once set]
# wave: control waveform used to modulate the amplitude; 0=saw, 1=pulse, 2=tri, 3=sine (default 1)
# invert_wave: invert control waveform flipping on the y axis; 0=uninverted, 1=inverted (default 0)
# pulse_width: only valid with pulse wave (default 0.5) - slide parameters
# filter: filter used for wobble effect (default 0) - slide parameters
# probability: probability that a given slice will be replaced by the value of the prob_opt (default 0) - slide parameters
# prob_pos: position of the slicer that will be jumped to when the probability test passes as a value between 0 and 1 (default 0) - slide parameters
# seed: seed value for random number generator for probability test (default 0) [can't be changed once set]
# smooth: amount of time in seconds to transition from the current value to the next (default 0) - slide parameters
# smooth_up: amount of time in seconds to transition from the current value to the next only when going up (default 0) - slide parameters
# smooth_down: amount of time in seconds to transition from the current value to the next only when going down (default 0) - slide parameters

set_mixer_control! amp: 1

amp = 1
mix = 1
pre_amp = 1
phase = 0.125
cutoff_min = 70
cutoff_max = 120
res = 0.9
pulse_width = 0.9
phase_offset = 0
wave = 1
invert_wave = 1
filter = 1
probability = 0.5
prob_pos = 0.9
seed = 100
smooth = 0.1
smooth_up = 0
smooth_down = 0

with_fx :wobble, amp: amp, mix: mix, pre_amp: pre_amp, phase: phase, cutoff_min: cutoff_min, cutoff_max: cutoff_max, res: res, pulse_width: pulse_width, phase_offset: phase_offset, wave: wave, invert_wave: invert_wave, filter: filter, probability: probability, prob_pos: prob_pos, seed: seed, smooth: smooth, smooth_up: smooth_up, smooth_down: smooth_down do
  play 50
end