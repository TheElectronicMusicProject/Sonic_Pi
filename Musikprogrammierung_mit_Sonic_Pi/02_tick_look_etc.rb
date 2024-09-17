# Additive synthesis - waveform manipulation
set_mixer_control! amp: 1
use_debug false
use_bpm 60

use_synth_defaults attack: 0, release: 0.25

# list ([a,b,c])
lst = [:c, :eb, :g, :bb, :d5]
puts lst

# vector (vector)
vct = (vector :c, :eb, :g, :bb, :d5)
puts vct[1]

# ring ([a,b,c])
rng = (ring :c, :eb, :g, :bb, :d5)
puts rng

# line
ln = (line 1, 10, steps: 11, inclusive: true)
puts ln

# ramp
rmp = vct.ramp
puts rmp

# reverse
rvs = vct.reverse
puts rvs

# mirror
mrr = vct.mirror
puts mrr

# Tick in variable
cnt = tick
puts "tick is #{cnt}"

# Tick and look
tick
puts "tick is #{look}"

# Tick within a loop
5.times do
  tick
  puts "Inside loop the tick is #{look}"
  sleep 1
end

# Tick within a live_loop
live_loop :tick do
  tick
  puts "Inside live_loop the tick is #{look}"
  sleep 1
end

# Tick through a chord
my_notes = (chord :c, "m7+9")
puts my_notes

live_loop :chord_tick do
  play my_notes.tick
  puts "Inside the notes the tick is #{my_notes.look}"
  sleep 1
end