# 8.5 Ring Chains

# Manipulations of a ring, without changing them but creating new ones
# Methods:
# .reverse - reversed version of the ring
# .sort - sorted version of the ring
# .shuffle - shuffled version of the ring
# .pick(3) - ring with the result of calling .choose 3 times
# .pick - ring with the result of calling .choose 1 time
# .take(5) - ring with only the first 5 elements
# .drop(3) - ring without the first 3 elements
# .butlast - ring without the last element
# .drop_last(3) - ring without the last 3 elements
# .take_last(6) - ring with only the last 6 elements
# .stretch(2) - repeats each element twice
# .repeat(3) - repeat the ring 3 times
# .mirror - adds the ring to a reversed version of the original one
# .reflect - same as mirror but without duplicating the iddle value
# .scale(2) - ring with all elements multiplied byt 2

# Ring goes backwards
puts (ring 10, 20, 30, 40, 50).reverse

# Take first three values from the ring
puts (ring 10, 20, 30, 40, 50).take(3)

# Shuffle the ring
puts (ring 10, 20, 30, 40, 50).shuffle

# Drops an element (starting from the first one)
puts (ring 10, 20, 30, 40, 50).drop(1)

# Mix of all of them
puts (ring 10, 20, 30, 40, 50).shuffle.drop(1).take(3)