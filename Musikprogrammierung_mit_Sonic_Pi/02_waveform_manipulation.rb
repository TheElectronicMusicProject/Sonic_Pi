# Additive synthesis - waveform manipulation
set_mixer_control! amp: 1
use_debug false
use_bpm 120

use_synth :sine

# Detune
x = 1.0

# Fundamental tone
define :tone do |freq, v_list, a, s, r|
  partials = [freq * 1,
              freq * 2 * x,
              freq * 3 * x,
              freq * 4 * x,
              freq * 5 * x,
              freq * 6 * x,
              freq * 7 * x,
              freq * 8 * x]
  
  use_synth_defaults attack: a, sustain: s, release: r
  
  partials.zip(v_list).each do |p, v|
    play hz_to_midi(p), amp: v
  end
end

live_loop :p do
  square1 = [1, 0, 0.5, 0, 0.25, 0, 0.125, 0]
  square2 = [1, 0.5, 0.25, 0.125, 0.125/2.0, 0.125/4.0, 0.125/8.0, 0.125/16.0]
  sine = [1, 0, 0, 0, 0, 0, 0, 0]
  custom = [1.0, 0.5, 0.5, 0.5, 1.0, 1.75, 2.5, 1.5]
  
  tone(150, custom, 0.1, 4, 0.3)
  sleep 5
end