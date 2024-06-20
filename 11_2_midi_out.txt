# 11.2 MIDI Out

# Send a request of a note on (note E3 with velocity 50)
midi_note_on :e3, 50

sleep 1

midi_note_off :e3

sleep 1

with_fx :reverb, room: 1 do
  # For soundcard
  live_audio :my_synth
end

live_loop :my_synth_trigger do
  # Shortcut to send both note on and off
  midi (octs :e1, 3).tick, sustain: 0.1
  sleep 0.125
end
