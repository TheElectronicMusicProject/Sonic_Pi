# A.4 Synth Riffs

# To choose a good riff, it is possible to combine rings, randomisation, random seed.
# shuffle returns a new list with the same elements but with shuffled order (it is the same every time)

live_loop :random_riff do
  use_synth :dsaw
  use_random_seed 30
  notes = (scale :e3, :minor_pentatonic).shuffle
  
  16.times do
    play notes.tick, release: 0.25, cutoff: 90 if one_in(2)
    sleep 0.125
  end
end