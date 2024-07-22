# A.19 Sound Design - Subtractive Synthesis

# Filter modulation permit changing the filter's option through time

with_fx :lpf, cutoff: 50 do |fx|
  # Slide the cutoff from 50 to 130 with a step of 3 beats
  control fx, cutoff_slide: 3, cutoff: 130
  synth :prophet, note: :e2, sustain: 3.5
end