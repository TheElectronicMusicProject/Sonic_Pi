# Tick

# chord: returns the notes of a certain chord
#    play (chord :C, :major).choose
#    Plays a random note of the C major chord (:C, :E or :G)
# scale: returns all the notes in a scale
#    play (scale :C, :major).choose
#    Plays a random note of the C major scale (:C, :D, :E, :F, :G, :A or :B)
# ring: special list that starts over when getting to the end
#   play [:C, :E, :D, :F].ring.tick
#   Plays the notes in the list and starts again each time it reaches the end

live_loop :arp do
  play (scale :E3, :minor_pentatonic).tick, release: 0.1
  sleep 0.125
end

live_loop :arp2 do
  use_synth :dsaw
  play (scale :E2, :minor_pentatonic, num_octaves: 3).tick, release: 0.25, amp: 0.5
  sleep 0.25
end

live_loop :keys do
  use_synth :blade
  play [(chord :Ab, :major7), (chord :Db, :major7), (chord :Eb, '7')].ring.tick, attack: 0.1, release: 1
  sleep 1
end

live_loop :lead do
  use_synth :dsaw
  play (scale :Ab, :major, num_octaves: 3).mirror.tick, attack: 0.05, release: 0.25, cutoff: rrand(80, 110), amp: 0.5
  sleep 0.25
end