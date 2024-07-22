# A.2 Live Coding

live_loop :choral_drone do
  sample :ambi_choir, rate: 1
  sleep 1
end

live_loop :beats do
  sample :bd_tek
  
  with_fx :echo, phase: 0.125, mix: 0.4 do
    sample :drum_cymbal_soft, sustain: 0, release: 0.1
    sleep 0.5
  end
end

live_loop :bass do
  use_synth :tb303
  
  synth :tb303, note: :e1, release: 4, cutoff: 120, cutoff_attack: 1
  sleep 4
end

# Steve Reich's piano phase
notes = (ring :e4, :fs4, :b4, :cs5, :d5, :fs4, :e4, :cs5, :b4, :fs4, :d5, :cs5)

live_loop :slow do
  play notes.tick, release: 0.1
  sleep 0.3
end

live_loop :faster do
  play notes.tick, release: 0.1
  sleep 0.295
end