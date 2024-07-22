# A.5 Acid Bass

use_synth :tb303
use_bpm 60

with_fx :reverb, room: 1 do
  live_loop :space_scanner do
    play :e1, cutoff: 100, release: 2, attack: 1, cutoff_attack: 1, cutoff_release: 1
    sleep 0.5
  end
end