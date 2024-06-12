# 8.4 Rings

# With a counter and a list, we will obtain "nil" because out of bounds
# So rings are useful to avoid this
# Scake abd chords are ring by default
# Other alternatives to ring: range, bools, knit, spread
counter = 0
notes = [52, 55, 59]

# This returns 52
puts notes[counter]

# This returns 55
counter = (inc counter)
puts notes[counter]

# This returns 59
counter = (inc counter)
puts notes[counter]

# This returns nil
counter = (inc counter)
puts notes[counter]

# First way to create a ring
my_ring1 = (ring 52, 55, 59)
puts my_ring1[0]
puts my_ring1[1]
puts my_ring1[2]
puts my_ring1[3]
puts my_ring1[-1]

# Second way to create a ring
puts notes.ring[0]
puts notes.ring[1]
puts notes.ring[2]
puts notes.ring[3]
puts notes.ring[-1]