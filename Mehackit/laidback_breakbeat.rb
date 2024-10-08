# Laidback breakbeat

use_bpm 120
use_debug false

with_fx :reverb, mix: 0.4 do
  with_fx :echo, mix: 0.7 do
    sample :ambi_swoosh, amp: 1
    sleep 3
    sample :ambi_lunar_land, rate: 2
    sleep 1
  end
end

live_loop :rummut do
  sample :bd_klub, amp: 1
  sleep 0.5
  sample :bd_klub, amp: 1, rate: 1.25
  sleep 0.25
  sample :bd_klub, amp: 0.75
  sleep 0.25
  
  with_fx :reverb, mix: 0.2, decay: 1 do
    sample :sn_dolf, amp: 0.85
  end
  
  sleep 0.25
  sample :bd_pure, amp: 0.75
  sleep 0.75
  sample :bd_ada, amp: 1
  sleep 1
  
  with_fx :reverb, mix: 0.2, decay: 1 do
    sample :drum_snare_soft, amp: 1
  end
  
  sleep 1
end

live_loop :bassolinja1, delay: 32 do
  use_synth :tb303
  use_synth_defaults release: 0.125 + rrand(0, 0.2), amp: 0.45, pan: rrand(-0.5, 0.5)
  use_transpose -12
  use_transpose 0 if one_in(3)
  
  n = (ring :r, :r, :D2, :D3, :F3, :r, :D1, :F2).tick
  play n, cutoff: rrand(30, 130)
  
  sleep 0.25
end

live_loop :bassolinja2, delay: 32 do
  use_synth :saw
  use_synth_defaults release: rrand(0.1, 0.3), amp: 0.4, pan: rrand(-0.5, 0.5)
  use_transpose 0
  use_transpose 12 if one_in(3)
  
  with_fx :bitcrusher, mix: 0.5 do
    with_fx :echo, mix: 0.6 do
      n = (ring :r, :D2, :D3, :F3, :r, :D1, :F2, :r).tick
      play n, cutoff: rrand(70, 120)
    end
  end
  
  sleep 0.25
end

live_loop :padit do
  use_synth :prophet
  use_synth_defaults cutoff: rrand(70, 110), release: rrand(1, 4), amp: 1
  
  with_fx :panslicer, mix: 0.5 do
    with_fx :hpf, cutoff: 70 do
      with_fx :reverb, mix: 0.4 do
        with_fx :echo, mix: 0.2 do
          2.times do
            play_chord chord(:D3, :minor)
            sleep 0.75
          end
          
          sleep 0.75
          
          play_chord chord(:D4, :minor), attack: 4, release: 2
          
          sleep 2
        end
      end
    end
  end
end

live_loop :hihat, delay: 32 do
  with_fx :flanger, mix: 0 do
    sample :perc_snap, amp: rrand(0.9, 1.4), rate: rrand(1.9, 2.1), cutoff: rrand(80, 120), pan: rrand(-0.25, 0.25)
  end
  
  sleep 0.25
end

2.times do
  3.times do
    sample :loop_amen, beat_stretch: 4
    sleep 4
  end
  
  sample :loop_amen_full, beat_stretch: 16, start: 0.75
  sleep 4
end