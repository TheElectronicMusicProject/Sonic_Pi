set_mixer_control! amp: 1
use_debug false
cue :start_sync

live_loop :synchr, synch: :start_sync do
  cue :sync_beat
  sleep 0.25
end

define :my_sound do |note, rel|
  use_synth :tb303
  
  at do
    with_fx :reverb, room: 0.4, damp: 0.9 do
      with_fx :panslicer, wave: 3 do
        with_fx :echo, phase: 0.25, decay: rel do
          play note, wave: 1, attack: rel/8, release: rel/2, cutoff: 100, res: 0.9
        end
        
        sleep rel/8.0
        
        with_fx :whammy, transpose: 2, deltime: 0.5, grainsize: 0.9 do
          if note <= 0
            note = 1
          end
          
          play note-1, wave: 1, release: rel/2
        end
      end
    end
  end
end

live_loop :midi_piano do
  # Enabled only for this thread
  use_real_time
  
  # Assignment of the value to two different variables
  note, velocity = sync "/midi:lpk25_lpk25_midi_1_24_0:1/note_on"
  
  # The piano synth is triggered with the note, converting the velocity (0-127) to the volume (0-1)
  synth :piano, note: note, amp: velocity / 127.0
  if note >= 0 && velocity > 0
    velocity = velocity / 32.0
    
    if velocity < 1.0
      velocity = 1.0
    end
    
    my_sound(note, velocity)
  end
end