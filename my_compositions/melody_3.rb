set_mixer_control! amp: 1
use_debug false
cue :start_sync

live_loop :synchr, synch: :start_sync do
  cue :sync_beat
  sleep 0.25
end

live_loop :percussion1, sync: :sync_beat do
  sample :hat_star
  sleep 0.125
  sample :hat_star
  sleep 0.125
  sample :hat_star
  sleep 0.25
  sample :hat_raw
  sleep 0.25
  sample :hat_star
  sleep 0.5
end

with_fx :reverb do
  live_loop :percussion2, sync: :sync_beat do
    sample :bd_fat
    sleep 0.5
  end
end

live_loop :synth, sync: :sync_beat do
  use_synth :mod_saw
  use_random_seed -109
  
  with_fx :lpf, cutoff: rrand(80, 130) do
    with_fx :echo, max_phase: 0.125, phase: 0.125, decay: 1 do
      my_chord = (chord :C2, :minor, num_octaves: 4).shuffle
      
      play my_chord.tick, attack: 0.1, release: 0.025, amp: 0.8, mod_wave: 1, mod_invert_wave: 1, mod_phase: 0.5, mod_phase_offset: 1
    end
  end
  
  sleep 0.25
end

live_loop :bass, sync: :sync_beat do
  use_synth :sine
  note = 18
  
  with_fx :ping_pong do
    with_fx :distortion, distort: 0.8 do
      loop do
        4.times do
          play note, release: 1.5, amp: 2
          
          sleep 2
        end
        
        print note
        
        if note >= 30
          note = 18
        else
          note = note + 2
        end
      end
    end
  end
end