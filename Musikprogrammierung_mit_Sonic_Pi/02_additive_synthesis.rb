# Creation of custom sounds with additive synthesis

set_mixer_control! amp: 1
use_debug false
use_bpm 60

use_synth :sine

sine = [1, 0, 0, 0, 0, 0, 0, 0]
violin = [1, 0.8, 0.5, 0.25, 0.35, 0.35, 0.5, 0.5]
flute = [1, 0.5, 0.8, 0.35, 0.25, 0.1525, 0.125, 0.255]
trumpet = [0.96, 0.94, 1, 0.75, 0.73, 0.75, 0.48, 0.5]
guitar = [1, 0.75, 0.65, 0.65, 0.7, 0.75, 0.6, 0.8]

# Detune
x = 1.0125

# Fundamentals tone
define :tone do |freq, v_list, a, s, r|
  partials = [freq * 1, freq * 2 * x, freq * 3 * x, freq * 4 * x, freq * 5 * x, freq * 6 * x, freq * 7 * x, freq * 8 * x]
  
  use_synth_defaults attack: a, sustain: s, release: r
  
  # Zip si a method which creates a new matrix (starting from two arrays) where the first element is:
  # [partials[0], v_list[0]]
  # If the number of elements are different, the other items have nil as element
  partials.zip(v_list).each do |p, v|
    puts "The played Hz note is " + p.to_s
    play hz_to_midi(p), amp: v
  end
end

puts "Sine-Wave"
tone(500, sine, 0.1, 1, 0.3)
sleep 5
puts "Violin"
tone(500, violin, 0.4, 0.5, 2)
sleep 5
puts "Flute"
tone(500, flute, 0.1, 0.5, 1.5)
sleep 5
puts "Trumpet"
tone(500, trumpet, 0.1, 0.5, 0.75)
sleep 5
puts "Guitar"
tone(500, guitar, 0, 0, 1)
sleep 5

puts "Sine-Wave"
tone(250, sine, 0.1, 1, 0.3)
sleep 5
puts "Violin"
tone(250, violin, 0.4, 0.5, 2)
sleep 5
puts "Flute"
tone(250, flute, 0.1, 0.5, 1.5)
sleep 5
puts "Trumpet"
tone(250, trumpet, 0.1, 0.5, 0.75)
sleep 5
puts "Guitar"
tone(250, guitar, 0, 0, 1)