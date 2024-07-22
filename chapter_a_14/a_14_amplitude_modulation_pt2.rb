# A.14 Amplitude Modulation

# Instead of having a wave which oscillates between 0 amplitude and full amplitude, amp_min and amp_max can be set

with_fx :slicer, amp_min: 0.25, amp_max: 0.75, wave: 3, phase: 0.25 do
  synth :saw, release: 8
end