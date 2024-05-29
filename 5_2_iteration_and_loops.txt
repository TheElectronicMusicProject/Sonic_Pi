# 5.2 Iteration and Loops

# Nested loop are permitted, with a fixed number or iterations
4.times do
  sample :drum_heavy_kick
  2.times do
    sample :elec_blip2, rate: 2
    sleep 0.25
  end
  sample :elec_snare
  4.times do
    sample :drum_tom_mid_soft
    sleep 0.125
  end
end

# An infinite loop will lock the system inside of it
loop do
  sample :loop_amen
  sleep sample_duration :loop_amen
end