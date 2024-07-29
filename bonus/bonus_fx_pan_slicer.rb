# Pan slicer
# amp: amplitude of sound (default 1) - slide parameters
# mix: the percentage of FX present in the resulting sound (default 1) - slide parameters
# pre_amp: amplification applied to the input signal before it is passed to the FX (default 1) - slide parameters
# phase: phase duration, in beats, of the slices (default 0.25) - slide parameters
# pan_min: minimum pan value (default -1) - slide parameters
# pan_max: maximum pan value (default 1) - slide parameters
# pulse_width: width of the pulse wave (default 0.5) - slide parameters
# phase_offset: initial phase offset (default 0) [can't be changed once set]
# wave: control waveform used to modulate the amplitude; 0=saw, 1=pulse, 2=tri, 3=sine (default 1)
# invert_wave: invert control waveform flipping on the y axis; 0=uninverted, 1=inverted (default 0)
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
pan_min = -1
pan_max = 1
pulse_width = 0.1
phase_offset = 0
wave = 2
invert_wave = 1
probability = 0.5
prob_pos = 1
seed = 98
smooth = 0.1
smooth_up = 0.1
smooth_down = 0.1

with_fx :panslicer, amp: amp, mix: mix, pre_amp: pre_amp, phase: phase, pan_min: pan_min, pan_max: pan_max, pulse_width: pulse_width, wave: wave, invert_wave: invert_wave, probability: probability, prob_pos: prob_pos, seed: seed, smooth: smooth, smooth_up: smooth_up, smooth_down: smooth_down do
  play 50
end