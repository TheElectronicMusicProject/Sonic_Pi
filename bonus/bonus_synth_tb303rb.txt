# TB-303
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
# cutoff_min: minimum cutoff value (default 30)
# cutoff_attack: attack time, in beats, for cutoff filter (default attack) [can't be changed once set]
# cutoff_decay: decay time, in beats, for cutoff filter (default decay) [can't be changed once set]
# cutoff_sustain: amount of time, in beats, for cutoff value to remain at sustain level (default sustain) [can't be changed once set]
# cutoff_release: amount of time, in beats, for sound to move from cutoff sustain value to cutoff min value (default release) [can't be changed once set]
# cutoff_attack_level: level of cutoff at peak of attack where 0=cutoff_min and 1=cutoff (default 1)
# cutoff_decay_level: level of cutoff after decay phase where 0=cutoff_min and 1=cutoff (default cutoff_sustain_level)
# cutoff_sustain_level: level of cutoff at sustain time where 0=cutoff_min and 1=cutoff (default 1)
# res: filter resonance (default 0.9)
# wave: wave type: saw=0, pulse=1, triangle=2 (default 0)
# pulse_width: width of the pulse wave (default 0.5)

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
cutoff_min = 50
cutoff_attack = 2
cutoff_decay = 2
cutoff_sustain = 2
cutoff_release = 3
cutoff_attack_level = 0.5
cutoff_decay_level = 0.5
cutoff_sustain_level = 0.5
res = 0.9
wave = 2
pulse_width = 0.1

use_synth :tb303
play note: :c3, amp: amp, pan: pan, attack: attack, decay: decay, sustain: sustain, release: release, attack_level: attack_level, decay_level: decay_level, sustain_level: sustain_level, env_curve: env_curve, cutoff: cutoff, cutoff_min: cutoff_min, cutoff_attack: cutoff_attack, cutoff_decay: cutoff_decay, cutoff_sustain: cutoff_sustain, cutoff_release: cutoff_release, cutoff_attack_level: cutoff_attack_level, cutoff_decay_level: cutoff_decay_level, cutoff_sustain_level: cutoff_sustain_level, res: res, wave: wave, pulse_width: pulse_width