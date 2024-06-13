# 9.3 Multiple Live Loops

# There can never be two live loops running with the same name
live_loop :foo do
  play :e4, release: 0.5
  sleep 0.5
end

# Two different loops can by synchronized to sound better
live_loop :bar do
  sync :foo
  sample :bd_haus
  sleep 1
end