# A.11 Tick Tock

# The reps: 8 is like a 8.times inside the FX

use_bpm 240
notes = (scale :e3, :minor_pentatonic).shuffle

live_loop :foo do
  use_synth :blade
  
  with_fx :reverb, reps: 8, room: 1 do
    tick
    co = (line 70, 130, steps: 32).tick(:cutoff)
    play (octs :e3, 3).look, cutoff: co, amp: 2
    play notes.look, amp: 4
    sleep 1
  end
end

live_loop :bar do
  tick
  sample :bd_ada if (spread 1, 4).look
  use_synth :tb303
  co = (line 70, 130, steps: 16).look
  r = (line 0.1, 0.5, steps: 64).mirror.look
  play notes.look, release: r, cutoff: co
  sleep 0.5
end