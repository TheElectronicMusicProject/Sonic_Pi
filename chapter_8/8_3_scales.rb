# 8.3 Scales

# More info on Lang>scale or Lang>chord

# C3 Major scale
play_pattern_timed scale(:c3, :major), 0.125, release: 0.1
sleep 1

# Number of octaves is specified
play_pattern_timed scale(:c3, :major, num_octaves: 3), 0.125, release: 0.1
sleep 1

# Pentatonic scale
play_pattern_timed scale(:c3, :major_pentatonic, num_octaves: 3), 0.125, release: 0.1
sleep 1

# Randomly choosing a note from a list of notes inside a chord
use_synth :tb303
loop do
  play choose(chord(:g3, :minor)), release: 0.3, cutoff: rrand(60, 120)
  sleep 0.25
end