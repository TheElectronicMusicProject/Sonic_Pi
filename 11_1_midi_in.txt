# 11.1 MIDI In

# To test this sections, I've used a cheap AKAY LPK25
# There is a default latency of 0.5s to synch all the synths, but for MIDI we don't want this, hence the "use_real_time" should be used

live_loop :midi_piano do
  # Enabled only for this thread
  use_real_time
  
  # Assignment of the value to two different variables
  note, velocity = sync "/midi:lpk25_lpk25_midi_1_24_0:1/note_on"
  
  # The piano synth is triggered with the note, converting the velocity (0-127) to the volume (0-1)
  synth :piano, note: note, amp: velocity / 127.0
end