# A.14 Amplitude Modulation

# The slicer can be synced up with the sample tempo

use_sample_bpm :loop_amen

with_fx :slicer, phase: 0.125 do
  sample :loop_amen
end