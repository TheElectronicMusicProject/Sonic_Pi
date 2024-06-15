# 10.1 Set and Get

# Global memory store named Time State: a value and a name are required to store
# To store a number 3000 with key "intensity" -> set :intensity, 3000
# Setting "intensity" with another value, will override the previous one
# To fetch a value, the key needed -> get[:intensity]
# The key is available until Sonic Pi is closed!

live_loop :setter do
  set :foo, rrand(70, 130)
  sleep 1
end

live_loop :getter do
  my_rand = get[:foo]
  puts my_rand
  play my_rand
  sleep 0.5
end

set :a, (ring 6, 5, 4, 3, 2, 1)

live_loop :shuffled do
  set :a, get[:a].shuffle
  sleep 0.5
end

live_loop :sorted do
  set :a, get[:a].sort
  sleep 0.5
  puts "sorted: ", get[:a]
end