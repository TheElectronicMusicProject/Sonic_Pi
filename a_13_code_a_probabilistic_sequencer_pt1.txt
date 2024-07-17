# A.13 Code a Probabilistic Sequencer

live_loop :random_beat do
  # There two lines are equivalent
  #sample :drum_snare_hard if dice == 1
  sample :drum_snare_hard if one_in(6)
  sleep 0.125
end