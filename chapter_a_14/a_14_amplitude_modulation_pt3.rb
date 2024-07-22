# A.14 Amplitude Modulation

# probability chooses if turn on or off the slicer
# seed sets the random seed for this particular FX
# prob_pos sets the position of the slicer that will be jumped to when the probability test passes between 0 and 1

with_fx :slicer, phase: 0.125, probability: 0.6, seed: 1, prob_pos: 0.5 do
  synth :tb303, note: :e1, cutoff_attack: 8, release: 8
  synth :tb303, note: :e2, cutoff_attack: 4, release: 8
  synth :tb303, note: :e3, cutoff_attack: 2, release: 8
end