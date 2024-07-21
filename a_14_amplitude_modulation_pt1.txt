# A.14 Amplitude Modulation

# phase turns on/off the volume 1/phase times per beat
# wave can be saw (0), pulse (1), triangle (2) and cosine (3)
# invert_wave flips the wave on the y axis
# phase_offset shifts the wave

with_fx :slicer, phase: 0.5, wave: 0, invert_wave: 1, phase_offset: 0.5 do
  synth :beep, note: :e3, release: 8, cutoff: 120
  synth :beep, note: :e2, release: 8, cutoff: 100
end