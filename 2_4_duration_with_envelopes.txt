# 2.4 Duration with Envelopes

# 1- Attack phase:
#    attack is time from amplitude 0 to attack_level
# 2- Decay phase:
#    decay is time from amplitude attack_level to decay_level
# 3- Sustain phase:
#    sustain is time from amplitude decay_level to sustain_level
# 4- Release phase:
#    release is time from sustain_level to 0


# The number specified is in number of beats
# Release = 0 can cause clicks
play 60, attack: 0.1, sustain: 1, release: 0.5

sleep 1

# Decay is between attack and sustain and it is in amplitude
play 70,
  attack: 0.5, attack_level: 1,
  decay: 0.2,
  sustain_level: 0.4, sustain: 1,
  release: 0.5

sleep 1

# Setting the decay level for full control of the envelope
# It can be higher or lower than the sustain level
play 80,
  attack: 0.1, attack_level: 1,
  decay: 0.2, decay_level: 2,
  sustain_level: 0.4, sustain: 1,
  release: 0.5