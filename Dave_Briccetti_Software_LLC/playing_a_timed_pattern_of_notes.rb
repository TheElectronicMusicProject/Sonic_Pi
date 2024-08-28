# Playing a Timed Pattern of Notes

use_bpm 120

2.times do
  play chord(:c4, :major)
  play_pattern [:c5, :d5, :e5, :c5]
end

2.times do
  play chord(:c4, :major)
  play_pattern_timed [:e5, :f5, :g5], [1, 1, 2]
end