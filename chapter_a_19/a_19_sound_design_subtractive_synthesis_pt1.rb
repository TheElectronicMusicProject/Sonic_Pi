# A.19 Sound Design - Subtractive Synthesis

# Using filters to remove frequencies

# The sound becomes softer
# Frequencies above note 100 are reduced in amplitude or removed
with_fx :lpf, cutoff: 50 do
  synth :saw, note: :e2, release: 4
end

sleep 4

# The sound becomes more buzzy and raspy
# Frequencies under note 90 are reduced in amplitude or removed
with_fx :hpf, cutoff: 90 do
  synth :saw, note: :e2, release: 4
end