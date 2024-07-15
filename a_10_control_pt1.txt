# A.10 Control

# play, synth and sample return a SynthNode, which is a running sound

sn = synth :prophet, note: :e1, release: 8, cutoff: 100
sleep 1
# After one beat the sound will be brighter
control sn, cutoff: 130