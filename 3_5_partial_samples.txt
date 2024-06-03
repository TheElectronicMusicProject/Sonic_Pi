# 3.5 Partial Samples

my_sample = :loop_amen

# Choose a start point (from 0 to 1) - start
# Choose a finish point (from 0 to 1) - finish
# If start < finish - plays the sound
# If start > finish - plays the sound backwards
loop do
  sample my_sample, start: 0.5, finish: 0.8, rate: -0.2, attack: 0.3, release: 1
  sleep 1.2
end