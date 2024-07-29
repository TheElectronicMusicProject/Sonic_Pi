# Bitcrusher
# amp: amplitude of sound (default 1) - slide parameters
# mix: the percentage of FX present in the resulting sound (default 1) - slide parameters
# pre_amp: amplification applied to the input signal before it is passed to the FX (default 1) - slide parameters
# sample_rate: value to resample the audio, with 44100 full quality (default 10000) - slide parameters
# bits: bit depth of the resampled audio, with 16 full quality (default 8)
# cutoff: MIDI note representing the highest frequencies allowed to be present in the sound (default 0) - slide parameters

set_mixer_control! amp: 1

amp = 1
mix = 0.9
pre_amp = 2
sample_rate = 1000
bits = 2
cutoff = 110

with_fx :bitcrusher, amp: amp, mix: mix, pre_amp: pre_amp, sample_rate: sample_rate, bits: bits, cutoff: cutoff do
  play 50
end