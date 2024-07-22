# A.10 Control

# attack, decay, sustain, release can only be set when triggering the synth

notes = (scale :e3, :minor_pentatonic)
sn = synth :prophet, note: :e1, release: 8, cutoff: 100
sleep 1

# Transforming the synth into an arpeggiator
16.times do
  control sn, note: notes.tick, cutoff: rrand(70, 130)
  sleep 0.125
end