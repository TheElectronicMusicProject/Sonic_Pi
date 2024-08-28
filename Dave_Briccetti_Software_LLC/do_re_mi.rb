# Do-Re-Mi

use_synth :piano
use_bpm 300

in_thread do
  for notes, times in [
      [[:c, :d, :e, :c, :e, :c, :e],
       [3, 1, 3, 1, 2, 2, 4]], # do
      [[:d, :e, :f, :f, :e, :d, :f],
       [3, 1, 1, 1, 1, 1, 8]], # re
      [[:e, :f, :g, :e, :g, :e, :g],
       [3, 1, 3, 1, 2, 2, 4]], # mi
      [[:f, :g, :a, :a, :g, :f, :a],
       [3, 1, 1, 1, 1, 1, 8]], # fa
      [[:g, :c, :d, :e, :f, :g, :a],
       [3, 1, 1, 1, 1, 1, 8]], # sol
      [[:a, :d, :e, :fs, :g, :a, :b],
       [3, 1, 1, 1, 1, 1, 8]], # la
      [[:b, :e, :fs, :gs, :a, :b, :c5, :b, :bf],
       [3, 1, 1, 1, 1, 1, 4, 2, 2]], # si
      [[:a, :f, :b, :g, :c5],
       [4, 4, 4, 4, 8]]
    ] do
    play_pattern_timed notes, times
  end
end

in_thread do
  use_synth :dsaw
  play_pattern_timed [:c2, :g1, :c2, :f1, :c2, :f2, :fs2, :g2, :gs2, :a2, :f2, :g2, :c2],
    [16, 16, 16, 16, 8, 8, 8, 8, 8, 8, 8, 8, 8], attack: 1, sustain: 4, release: 2, amp: 0.3
end

in_thread do
  32.times do
    sample :drum_cowbell, amp: 0.2
    sleep 4
  end
end