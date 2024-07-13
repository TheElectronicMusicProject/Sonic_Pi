# A.1 Tips for Sonic Pi

# Parameterise your synths
with_fx :flanger, feedback: 1 do
  sample :guit_em9, rate: 0.5
  sleep sample_duration(:guit_em9) * 2
end

# Use the FX
with_fx :flanger do
  sample :loop_garzul
end

with_fx :echo do
  16.times do
    sample :bd_haus
    sleep 0.5
  end
end

# Live Code
live_loop :experiment do
  sample :loop_amen, cutoff: 70
  sleep 1.75
end

# Surf the random streams
live_loop :rand_surfer do
  use_random_seed 1
  use_synth :dsaw
  notes = (scale :e2, :minor_pentatonic, num_octaves: 2)
  
  16.times do
    play notes.choose, release: 0.1, cutoff: rrand(70, 120)
    sleep 0.125
  end
end
