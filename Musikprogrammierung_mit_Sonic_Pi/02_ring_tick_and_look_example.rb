set_mixer_control! amp: 1
use_debug false
use_bpm 60

tone = [:C, :E, :G]
my_ring = (ring :C, :E, :G)

uncomment do
  # This is a different live_loop with a different tick
  live_loop :zaehlen_und_spielen do
    play my_ring.tick
    sample :drum_cowbell
    sleep 1
  end
end

live_loop :kuhglocke do
  glocke = (ring 0, 1, 0, 1, 0.25, 1, 0.5, 0, 0, 1, 0.5, 1, 0.25, 0, 0, 0)
  hihat = (ring 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1)
  
  # There is a global tick if not differently specified
  # So each tick increments the index inside the live_loop
  sample :drum_cowbell, amp: glocke.tick
  sample :ambi_glass_rub, start: 0, finish: 0.01, amp: glocke.tick
  sample :drum_cymbal_closed, amp: hihat.look
  sleep 0.125
end