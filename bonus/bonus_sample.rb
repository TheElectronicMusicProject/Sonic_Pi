# Samples
# amp: amplitude of sound (default 1)
# pan: position of sound in stereo (default 0)
# attack: duration of the attack phase of the envelope (default 0)
# decay: duration of the decay phase of the envelope (default 0)
# sustain: duration of the sustain phase of the envelope (default -1)
# release: duration of the release phase of the envelope (default 0)
# attack_level: amplitude level reached after attack phase (default 1)
# decay_level: amplitude level reached after decay phase (default sustain_level)
# sustain_level: amplitude level reached after sustain phase (default 1)
# env_curve: shape of the curve between level in the envelope; 1=linear, 2=exponential, 3=sine, 4=welch, 6=squared, 7=cubed (default 2)
# rate: rate with which to play back (changes frequency and playback time); negative plays the sample in reverse (default 1)
# start: fraction representing where in the sample to start playback (default 0)
# finish: fraction representing where in the sample to finish playback (default 1)
# res: filter resonance, only if a cutoff value is specified (default 0)
# norm: normalise the audio (default 0)
# window_size: pitch shift by chopping the input into tiny slices, in seconds (default 0.2)
# pitch_dis: pitch dispersion, hence the quantity of random variation in pitch to add (default 0.0)
# time_dis: time dispersion, hence the quantity of random delay before playing each grain, in seconds (deafult 0.0)
# beat_stretch: stretch or shrink the sample to last for exacly the specified number of beats
# pitch_stretch: stretch or shrink the sample to last for exacly the specified number of beats, with constant pitch
# pre_amp: amplitude multiplier which takes place before any internal FX
# onset: analyse the sample with an onset deteciton algorithm and sets "start", "finish"

set_mixer_control! amp: 2

amp = 1
pan = 0
attack = 0
decay = 0
sustain = -1
release = 0
attack_level = 1
decay_level = 1
sustain_level = 1
env_curve = 3
rate = 1
start = 0
finish = 1
res = 0
norm = 0
beat_stretch = 2
pitch_stretch = 1.5
pre_amp = 1

sample :loop_amen, amp: amp, pan: pan, attack: attack, decay: decay, sustain: sustain, release: release, attack_level: attack_level, decay_level: decay_level, sustain_level: sustain_level, env_curve: env_curve, rate: rate, start: start, finish: finish, res: res, norm: norm, beat_stretch: beat_stretch, pitch_stretch: pitch_stretch, pre_amp: pre_amp