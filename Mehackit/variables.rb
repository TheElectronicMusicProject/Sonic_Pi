# Variables

live_loop :melody do
  use_synth :blade
  
  r = [0.25, 0.25, 0.5, 1].choose
  play (chord :C, :minor).choose, attack: 0, release: r
  sleep r
end

live_loop :keys do
  use_synth :blade
  
  play chord(:C, :minor)
  sleep 1
end

live_loop :bass do
  use_synth :fm
  
  n = (chord :C2, :minor).tick
  
  3.times do
    play n
    sleep 1
  end
  
  play n
  sleep 0.5
  play (chord :C2, :minor).tick
  sleep 0.5
end