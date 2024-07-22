# 4 Randomisation

# Changing the seed, we change the randomity
use_random_seed 40

use_synth :tb303

5.times do
  # Random number between a min and a max (excluded)
  sample :perc_bell, rate: (rrand 0.125, 1.5)
  sleep rrand(0.2, 2)
  # Random note between a selection
  play choose([60, 65, 72]), release: 0.1, cutoff: rrand(60, 120)
  sleep 0.125
  # Integer random value between a min and a max (included)
  play rrand_i(20, 110), release: 0.3
  sleep 1
  # Random value within 0 and max included
  play rand(50), release: (rand_i 3), amp: 0.5
  # Like a dice throw, from 1 to max
  sleep dice(6)
end

# one_in(6) return true with a probability of 1 in 6 or false otherwise (for dice)