# Zawa
# note: note to play (default 52)
# amp: amplitude of sound (default 1)
# pan: position of sound in stereo (default 0)
# attack: amount of beats to reach the full sound amplitude (default 0) [can't be changed once set]
# decay: amount of beats to move from attack_level to sustain_level (default 0) [can't be changed once set]
# sustain: amount of beats to remain at sustain level amplitude (default 0) [can't be changed once set]
# release: amount of beats to move from sustain_level to silent (default 1) [can't be changed once set]
# attack_level: amplitude level reached after attack phase (default 1) [can't be changed once set]
# decay_level: amplitude level reached after decay phase (default sustain_level) [can't be changed once set]
# sustain_level: amplitude level reached after sustain phase (default 1) [can't be changed once set]
# env_curve: shape of the curve between level in the envelope; 1=linear, 2=exponential, 3=sine, 4=welch, 6=squared, 7=cubed (default 2) [can't be changed once set]
# cutoff: MIDI note representing the highest frequencies allowed to be present in the sound (default 100)
# res: filter resonance (default 0.9)
# phase: phase duration, in beats, of timbre modulation (default 1)
# phase_offset: initial phase offset of the sync wave (default 0) [can't be changed once set]
# wave: wave type: saw=0, pulse=1, triangle=2, sine=3 (default 3)
# invert_wave: invert sync frequency control waveform: uninverted y axis=0, inverted y axis=1 (default 0)
# range: range of associated sync saw from the main note in MIDI notes (default 24)
# disable_wave: enabling and disabling the sync control wave (default 0)
# pulse_width: width of the pulse wave (default 0.5) [can't be changed once set]

set_mixer_control! amp: 2

amp = 1
pan = 0
attack = 0
decay = 0
sustain = 0
release = 2
attack_level = 0
decay_level = 0
sustain_level = 1
env_curve = 3
cutoff = 130
res = 0.1
phase = 1
phase_offset = 0.5
wave = 3
invert_wave = 1
range_var = 50
disable_wave = 0
pulse_width = 0.9

use_synth :zawa
play note: :c3, amp: amp, pan: pan, attack: attack, decay: decay, sustain: sustain, release: release, attack_level: attack_level, decay_level: decay_level, sustain_level: sustain_level, env_curve: env_curve, cutoff: cutoff, res: res, phase: phase, phase_offset: phase_offset, wave: wave, invert_wave: invert_wave, range: range_var, disable_wave: disable_wave, pulse_width: pulse_width