# A.11 Tick Tock

# tick increments and returns the beat
# look simply returns the beat
# Each loop has its beat counter

notes = (ring 57, 62, 55, 59, 64)

with_fx :reverb do
  live_loop :arp do
    use_synth :dpulse
    play notes.tick + 12, release: 0.1
    sleep 0.125
  end
end

live_loop :arp2 do
  use_synth :dsaw
  play notes.tick - 12, release: 0.2
  sleep 0.75
end