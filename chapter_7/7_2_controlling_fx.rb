# 7.2 Controlling FX

# To control a FX, the variabile shouldn't be created but we need a parameter with an unique name
with_fx :reverb do |r|
  play 50
  sleep 0.5
  control r, mix: 0.7
  play 55
  sleep 1
  control r, mix: 0.9
  sleep 1
  play 62
end