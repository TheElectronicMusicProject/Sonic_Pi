# Piano
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
# vel: velocity of keypress (default 0.2) [can't be changed once set]
# hard: hardness of keypress (default 0.5) [can't be changed once set]
# stereo_width: width of the stereo effect (low notes sound towards the left, high notes towards the right) (default 0) [can't be changed once set]

set_mixer_control! amp: 1

amp = 1
pan = 0
attack = 0
decay = 0
sustain = 3
release = 2
attack_level = 0.5
decay_level = 2
sustain_level = 0.9
env_curve = 7
cutoff = 100
vel = 0.4
hard = 0.7
stereo_width = 0.9

use_synth :piano
play note: :c3, amp: amp, pan: pan, attack: attack, decay: decay, sustain: sustain, release: release, attack_level: attack_level, decay_level: decay_level, sustain_level: sustain_level, env_curve: env_curve, cutoff: cutoff, vel: vel, hard: hard, stereo_width: stereo_width