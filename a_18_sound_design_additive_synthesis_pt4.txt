# A.18 Sound Design - Additive Synthesis

# Try to reproduce a basic bell sound:
# - Section 1) hit as initial onset part (short envelope)
# - Section 2) ringing section with pure sine wave sound
# - Section 3) bass section with low sine waves

define :bell do |n|
  # Section 1
  synth :tri, note: n - 12, release: 0.1
  synth :tri, note: n + 0.1, release: 0.1
  synth :tri, note: n - 0.1, release: 0.1
  synth :tri, note: n, release: 0.2
  
  # Section 2
  synth :sine, note: n + 24, release: 2
  synth :sine, note: n + 24.1, release: 2
  synth :sine, note: n + 24.2, release: 0.5
  synth :sine, note: n + 11.8, release: 2
  synth :sine, note: n, release: 2
  
  # Section 3
  synth :sine, note: n - 11.8, release: 2
  synth :sine, note: n - 12, release: 2
end

bell :e3
sleep 1
bell :c2
sleep 1
bell :d3
sleep 1
bell :g2