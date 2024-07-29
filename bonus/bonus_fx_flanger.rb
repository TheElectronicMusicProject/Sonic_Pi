# Flanger
# amp: amplitude of sound (default 1) - slide parameters
# mix: the percentage of FX present in the resulting sound (default 1) - slide parameters
# pre_amp: amplification applied to the input signal before it is passed to the FX (default 1) - slide parameters
# phase: phase duration in beats of flanger modulation (default 4) - slide parameters
# phase_offset: initial modulation phase offset (default 0) [can't be changed once set]
# wave: wave type; 0=saw, 1=pulse, 2=triangle, 3=sine, 4=cubic (default 4)
# invert_wave: invert flanger control waveform flipping on y axis; 0=uninverted, 1=inverted (default 0)
# stereo_invert_wave: make the flanger control waveform in the left war an inversion of the control waveform in the right ear; 0=uninverted, 1=inverted (default 0)
# delay: amount of delay time between original and flanged version (default 5) - slide parameters
# max_delay: max delay time (default 20) [can't be changed once set]
# depth: flange depth (default 5) - slide parameters
# decay: flange decay time in ms (default 2) - slide paramters
# feedback: amount of feedback (default 0) - slide parameters
# invert_flange: invert flanger singla; 0=no inversion, 1=inverted (default 0)

set_mixer_control! amp: 1

amp = 1
mix = 1
pre_amp = 1
phase = 1
phase_offset = 0.5
wave = 2
invert_wave = 1
stereo_invert_wave = 1
delay = 10
max_delay = 2
depth = 1
decay = 1
feedback = 1
invert_flange = 1

with_fx :flanger, amp: amp, mix: mix, pre_amp: pre_amp, phase: phase, phase_offset: phase_offset, wave: wave, invert_wave: invert_wave, stereo_invert_wave: stereo_invert_wave, delay: delay, max_delay: max_delay, depth: depth, decay: decay, feedback: feedback, invert_flange: invert_flange do
  play 50
end