# A.18 Sound Design - Additive Synthesis

# Detuning is used to create new sounds by changing the pitch slightly higher or lower

detune = 0
synth :square, note: :e3
synth :square, note: :e3 + detune

sleep 1

# Synth like :dsaw, :dpulse, :dtri have a detune option
synth :dsaw, detune: 0.5