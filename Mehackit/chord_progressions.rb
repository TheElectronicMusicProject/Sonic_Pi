# Chord progressions

chords = [(chord :C, :minor7), (chord :Ab, :major7), (chord :Eb, :major7), (chord :Bb, "7")].ring

# Save in "c" the first chord of the ring variable
c = chords[0]

live_loop :melody do
  use_synth :blade
  
  r = [0.25, 0.25, 0.5, 1].choose
  play (chord :C, :minor).choose, attack: 0, release: r
  sleep r
end

live_loop :keys do
  use_synth :blade
  
  play :C
  sleep 1
end

live_loop :bass do
  use_synth :fm
  use_octave -2
  
  3.times do
    play c[0]
    sleep 1
  end
  
  play c[2]
  sleep 0.5
  play c[1]
  sleep 0.5
  
  c = chords.tick
end