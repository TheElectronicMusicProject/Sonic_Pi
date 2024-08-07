# A.5 Acid Bass

# line creates a buffer which is a straight line between start and finish, of step elements (4 by default)

use_synth :tb303
use_debug false

with_fx :reverb, room: 0.8 do
  live_loop :space_scanner do
    with_fx :slicer, phase: 0.25, amp: 1.5 do
      co = (line 70, 130, steps: 8).tick
      play :e1, cutoff: co, release: 7, attack: 1, cutoff_attack: 4, cutoff_release: 4
      sleep 8
    end
  end
end

live_loop :squelch do
  use_random_seed 3000
  
  16.times do
    n = (ring :e1, :e2, :e3).tick
    play n, release: 0.125, cutoff: rrand(70, 130), res: 0.9, wave: 1, amp: 0.8
    sleep 0.125
  end
end