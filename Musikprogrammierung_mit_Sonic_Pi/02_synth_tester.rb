# Test of all the available synths

set_mixer_control! amp: 1
use_debug false
use_bpm 60

all_synth = synth_names

live_loop :use_all_synths do
  use_synth_defaults attack: 0, sustain: 0, release: 0.5, cutoff: 130
  
  # Switch the current synth to synth_name but only for the duration of the do/end block.
  with_synth synth_names.tick do
    puts "======================================="
    puts "#{synth_names.look}"
    puts "======================================="
    
    sleep 0.5
    play_pattern_timed [:C4, :EB, :G, :BB], 0.5
    sleep 0.5
  end
end