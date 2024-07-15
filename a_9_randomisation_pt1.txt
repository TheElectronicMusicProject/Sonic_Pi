# A.9 Randomisation

# When Sonic Pi starts, it loads in memory 441000 pre-generated random values
# rand - returns the next value in the stream
# rrand - returns a random value withing a range
# rrand_i - returns a random whole number withing a range
# one_in - returns true or false with a given probability
# dice - returns a value between 1 and 6
# choose - chooses a random value from a list

live_loop :random_riff do
  use_random_seed 1000
  #use_random_seed 100
  #use_random_seed 999
  
  8.times do
    play rrand_i(50, 95), release: 0.1
    sleep 0.125
  end
end