# Compressor
# amp: amplitude of sound (default 1) - slide parameters
# mix: the percentage of FX present in the resulting sound (default 1) - slide parameters
# pre_amp: amplification applied to the input signal before it is passed to the FX (default 1) - slide parameters
# threshold: threshold value of the break point between slope_below and slope_above (default 0.2) - slide parameters
# clamp_time: time, in seconds, taken for the amplitude adjustments to kick in fully (default 0.01) - slide parameters
# slope_above: slope of the amplitude curve above the threshold (default 0.5) - slide parameters
# slope_below: slope of the amplitude curve below the threshold (default 1) - slide parameters
# relax_time: time, in seconds, taken for the amplitude adjustments to be released (default 0.01) - slide parameters

set_mixer_control! amp: 1

amp = 1
mix = 1
pre_amp = 1
threshold = 0.3
clamp_time = 0.001
slope_above = 1
slope_below = 9
relax_time = 0.001

with_fx :compressor, amp: amp, mix: mix, pre_amp: pre_amp, threshold: threshold, clamp_time: clamp_time, slope_above: slope_above, slope_below: slope_below, relax_time: relax_time do
  play 50
end