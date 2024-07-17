# A.11 Tick Tock

# Two ticks are required to be played at the same time
# To avoid the increment of calling tick twice:
# 1) call tick and then look
# 2) call tick(:name1) in the first call and tick(:name2) in the second

use_bpm 300
use_synth :blade

live_loop :foo do
  play (ring :e1, :e2, :e3).tick(:name)
  play (scale :e3, :minor_pentatonic).tick(:good)
  sleep 1
end