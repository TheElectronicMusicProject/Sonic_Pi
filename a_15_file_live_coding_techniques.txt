# A.15 Five Live Coding Techniques

# Sonic Pi has a global mixer with a low-pass and high-pass filter
# Reset the mixer: reset_mixer!

set_mixer_control! lpf: 100, hps: 500, pre_amp: 1, amp: 0.8, lpf_slide: 8

sample :ambi_lunar_land, rate: 1
sample :ambi_lunar_land, rate: 0.5
sample :ambi_lunar_land, rate: 0.25
sample :ambi_lunar_land, rate: 0.125
sample :ambi_lunar_land, rate: -0.5