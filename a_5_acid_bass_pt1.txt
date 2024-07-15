# A.5 Acid Bass

use_synth :tb303
use_bpm 80

live_loop :squelch do
  n = (ring :e1, :e2, :e3).tick
  play n, release: 0.125, cutoff: 120, res: 0.9, wave: 0
  sleep 0.125
end