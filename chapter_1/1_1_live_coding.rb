# 1.1 Live Coding
# rate can't be zero
# sleep can't be too small

live_loop :flibble do
  sample :ambi_choir, rate: 1
  sample :bd_haus, rate: 1
  sleep 1
end