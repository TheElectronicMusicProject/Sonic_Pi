set_mixer_control! amp: 1
use_debug false
cue :start_sync

live_loop :synchr, synch: :start_sync do
  cue :sync_beat
  sleep 0.25
end

define :sample_song do
  at do
    use_synth :blade
    play 60
    sleep 0.25
    play 65
    sleep 0.5
    play 58
    sleep 0.75
    play 60
    sleep 0.25
    play 65
    sleep 0.5
    play 57
  end
end

live_loop :midi_piano do
  # Enabled only for this thread
  use_real_time
  
  # Assignment of the value to two different variables
  note, velocity = sync "/midi:pad-one_pad-one_midi_1_24_0:1/note_on"
  
  # The piano synth is triggered with the note, converting the velocity (0-127) to the volume (0-1)
  if note == 49 && velocity != 0
    sample :hat_noiz
  elsif note == 52 && velocity != 0
    sample :hat_snap
  elsif note == 53 && velocity != 0
    sample :drum_heavy_kick
  elsif note == 55 && velocity != 0
    sample_song
  elsif note == 57 && velocity != 0
    sample :drum_snare_hard
  end
end