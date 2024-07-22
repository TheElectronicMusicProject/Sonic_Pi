# A.3 Coded Beats

live_loop :amen_break do
  use_bpm 50
  
  with_fx :slicer, phase: 0.125, wave: 3, mix: 1 do
    sample :loop_amen, beat_stretch: 2, cutoff: 90
  end
  
  sleep 2
end