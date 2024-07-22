# 9.4 Ticking

# First way for tick: we use a counter to scan all the notes of the scale
counter = 0

live_loop :arp do
  play (scale :e3, :minor_pentatonic)[counter], release: 0.1
  counter += 1
  sleep 0.125
end

# Second way for tick: we use the tick to scan all the notes of the scale
# Every time tick is called, it is incremented for the next call
# With look, the value won't be increased
live_loop :arp2 do
  use_synth :dsaw
  play (scale :e2, :minor_pentatonic, num_octaves: 3).tick, release: 0.25
  sleep 0.25
end

# Third way for tick: we use the and index associated to the tick to scan all the notes of the scale
# Giving a name to tick will avoid sharing the same tick between loops
live_loop :arp3 do
  idx = tick(:arp3)
  use_synth :prophet
  play (scale :e1, :minor_pentatonic, num_octaves: 2)[idx], release: 0.125
  sleep (ring 0.125, 0.25).tick(:bar)
end