set_mixer_control! amp: 0.5
use_bpm 60
use_debug true
cue :start_sync

live_loop :synchr, synch: :start_sync do
  cue :sync_beat
  sleep 0.25
end

live_loop :beat, sync: :sync_beat do
  with_fx :wobble do
    timings = 0.5
    
    sample :bass_drop_c, beat_stretch: 1
    sample :elec_cymbal, amp: 1.5
    sleep timings*2
    sample :elec_snare, amp: 1.5
    sleep timings
    sample :elec_snare
    sample :bass_drop_c, beat_stretch: 2
    sleep timings
    sample :elec_snare, amp: 1.5
    sleep timings
    sample :elec_snare, amp: 1.5
    sleep timings
    sample :elec_hi_snare
    sleep timings*2
  end
end

live_loop :synth, sync: :sync_beat do
  use_random_seed 90
  use_synth :sine
  
  new_note = (chord :C3, :minor, num_octaves: 5).shuffle
  
  with_fx :reverb do
    play new_note.tick, release: 0.5, divisor: 5, mod_phase: 0.125, depth: 3, amp: 0.5
    play new_note.tick - 1, release: 0.5, divisor: 5, mod_phase: 0.125, depth: 3, amp: 0.5
    sleep 0.25
  end
end

live_loop :background, sync: :sync_beat do
  use_synth :mod_sine
  
  play :C2, attack: 0, sustain: 0.3, release: 0.1, amp: 1
  sleep 0.5
end

live_loop :treble, sync: :sync_beat do
  use_synth :hoover
  
  note1 = chord :F5, :minor, num_octaves: 4
  note2 = chord :C5, :minor, num_octaves: 4
  note3 = chord :C6, :minor, num_octaves: 3
  note4 = chord :F6, :minor, num_octaves: 3
  notes = [note1, note2, note3, note4]
  
  play notes.tick, sustain: 0.9, release: 0.1, env_curve: 7, cutoff: 100, res: 0.8, amp: 0.6
  
  sleep 1
end