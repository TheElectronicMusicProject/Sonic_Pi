# 5.5 Functions

# ATTENTION! Function are remembered also if we clear the buffer

# Defined a function named foo
define :foo do
  play 50
  sleep 1
  play 55
  sleep 2
end

# Passing an input to a function
define :my_player do |n|
  play n
end

# More inputs
define :chord_player do |root, repeats|
  repeats.times do
    play chord(root, :minor), release: 0.3
    sleep 0.5
  end
end

foo
sleep 1

2.times do
  my_player 80
  sleep 0.5
end

chord_player :e3, 2
sleep 0.5
chord_player :a3, 3
chord_player :g3, 4
sleep 0.5
chord_player :e3, 3