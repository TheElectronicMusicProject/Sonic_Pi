# Pulse wave with sub
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
# pulse_width: width of the pulse (default 0.5)
# sub_amp: amplitude for the additional sine wave (default 1)
# sub_detune: amount of detune from the note for the additional sine wave (default -12)

set_mixer_control! amp: 2

amp = 1
pan = 0
attack = 0
decay = 1
sustain = 1
release = 1
attack_level = 1
decay_level = 2
sustain_level = 1
env_curve = 1
cutoff = 100
pulse_width = 0.9
sub_amp = 2
sub_detune = -15

use_synth :subpulse
play note: :c3, amp: amp, pan: pan, attack: attack, decay: decay, sustain: sustain, release: release, attack_level: attack_level, decay_level: decay_level, sustain_level: sustain_level, env_curve: env_curve, cutoff: cutoff, pulse_width: pulse_width, sub_amp: sub_amp, sub_detune: sub_detune