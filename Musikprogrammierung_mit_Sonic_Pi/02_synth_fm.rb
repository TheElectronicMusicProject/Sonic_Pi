# Synth: A sine wave with a fundamental frequency which is modulated at audio rate by
# another sine wave with a specific modulation, division and depth.
# Defaults: attack: 0; decay: 0; release: 1.0; attack_level: 1; sustain_level: 1; env_curve: 2;
# Additional Defaults: cutoff: 100; divisor: 2; depth: 1
# More Explanation from:
# www.indiana.edu/~emusic/fm/fm.htm
# below audio-rate = approximately 20 Hz = sub-audio rate = vibrato (change in pitch vs. tremolo, change in volume)
# audio rate = > 20 Hz
# "When the rate of the modulating oscillator is tuned above 20 Hz, or at
# an audio rate, very interesting things happen to the sound. Additional
# frequencies called sidebands appear symmetrically around the carrier
# frequency. Those above the carrier frequency are called upper sidebands
# and below, lower sidebands. In essence, as will be seen below, some of
# the energy of the carrier frequency is being stolen to create these
# additional frequencies.
# Yamaha DX7 (1983)

set_mixer_control! amp: 1
use_debug false
use_bpm 180

use_synth :fm

# Degree for a given scale and tonic it takes a
# symbol/string/number and resolves it to a midi
# note. The degree can be either a decimal number
# or a roman numeral (if it’s a string or symbol),
# and may optionally be prefixed an augmentation
# (a/d for an augmented/diminished interval,
# aa/dd for double augmented/diminished or p for
# a perfect (unchanged) interval).
pool = [degree(1, :C5, :mixolydian),
        degree(5, :C4, :mixolydian),
        degree(3, :C4, :mixolydian),
        degree(1, :C4, :mixolydian),
        degree(4, :C4, :mixolydian),
        degree(7, :C4, :mixolydian),
        degree(5, :C4, :mixolydian)]

# Play example 1 to 5 selectively
# 1 = default
# 2 = glass, bell
# 3 = Fender Rhodes
# 31 = Fender Rhodes with reverb
# 4 = Rhodes with attack, glass harp
# 5 = woody, xylophone
# 6 = slightly clavinet-like
# 7 = with long attack, accordion-like
# 8 = metallic bass, transpose necessary
# 9 = without depth = beep, depth > 0 e.g. 5 - 20 more metallic, then noisy
# divisor > 1
# 10 = very noisy
# 11 = slight wahwah effect, the greater the depth, the squeakier, brighter
# 12 = Interesting to play here with depth between 0.1 to approx. 4.0
# 13 = divisor: 2 = 1 octave lower (than 1), 3 = fourth + octave lower, 4 = 2 octaves
# lower, 5 = major third + Octave lower
# use_transpose => interesting sounds without transposition caused by divisor
# 14 = Spacey sound (structured noise)
# 15 = Rhythm with noise
# 16 = Interesting effect with high divisor (e.g. 40) and low depth value (0.2)
# 17 = Whistling glissandi (with a bit of attack)
# 18 = Whistling glissandi, deep
# 19 = Jungle
# 20 = Flute
ex = 20

# Default FM
# Use ex = 1
live_loop :fm_default do
  if ex != 1
    stop
  end
  
  play pool[0, 4]
  sleep 1
  play_pattern_timed(pool, [1, 1, 1, 1, 1, 1, 4])
end

# With depth = 0 there isn't a modulation
# With divisor 0.1 there is a bell like, metallic
# Increasing depth (1 ... 10 ... 50) the thinner and
# bell/glass-like the sound gets
# With depth about 90 there are interesting side bands
# (like the xylophon)

# Divisor = 0.1
# Depth = 20
# Use ex = 2
live_loop :fm_glass do
  if ex != 2
    stop
  end
  
  use_synth_defaults divisor: 0.1, depth: 20, attack: 0, sustain: 0, release: 0.5
  play pool[0, 4]
  sleep 2
  play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
end

# Divisor = 0.05
# Depth = 20
# Use ex = 3
live_loop :fm_rhodes do
  if ex != 3
    stop
  end
  
  use_synth_defaults divisor: 0.05, depth: 20, attack: 0, sustain: 0, release: 1
  play pool[0, 4]
  sleep 2
  play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
end

# Divisor = 0.05
# Depth = 20
# Reverb with room = 0.4
# Flanger with depth = 7
# Use ex = 31
live_loop :fm_rhodes_fx do
  if ex != 31
    stop
  end
  
  use_synth_defaults amp: 4, divisor: 0.05, depth: 20, attack: 0, sustain: 0, release: 1
  
  with_fx :reverb, room: 0.4 do
    with_fx :flanger, depth: 7 do
      play pool[0, 4]
      sleep 2
      play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
    end
  end
end

# Divisor = 0.05
# Depth = 17
# There is an additional attack
# Use ex = 4
live_loop :fm_rhodes_with_attack do
  if ex != 4
    stop
  end
  
  use_synth_defaults divisor: 0.05, depth: 17, attack: 0.3, sustain: 0, release: 1
  play pool[0, 4]
  sleep 2
  play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
end

# Divisor = 0.05
# Depth = 80
# Use ex = 5
live_loop :fm_xylo do
  if ex != 5
    stop
  end
  
  use_synth_defaults divisor: 0.05, depth: 80, attack: 0, sustain: 0, release: 1
  play pool[0, 4]
  sleep 2
  play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
end

# Divisor = 0.33
# Depth = 20
# Use ex = 6
live_loop :fm_clavi do
  if ex != 6
    stop
  end
  
  use_synth_defaults divisor: 0.33, depth: 20, attack: 0, sustain: 0, release: 1
  play pool[0, 4]
  sleep 2
  play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
end

# Divisor = 0.5
# Depth = 20
# There is an additional attack
# Change the divisor with more decimal places to show detuning effects (e.g. 0.55)
# More depth as 20 shows vibrato effect
# Use ex = 7
live_loop :fm_akk do
  if ex != 7
    stop
  end
  
  use_synth_defaults divisor: 0.5, depth: 20, attack: 2, sustain: 0, release: 1
  play pool[0, 4]
  sleep 2
  play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
end

# Divisor = 0.6
# Depth = 7
# Play with depth up to around 10 to lighten the sound up
# Transpose is used to work against the detuning (either +7, -5, -17, ...)
# Use ex = 8
live_loop :fm_metallic_bass do
  if ex != 8
    stop
  end
  
  use_synth_defaults divisor: 0.6, depth: 7, attack: 0, sustain: 0, release: 1
  
  with_transpose -17 do
    play pool[0, 4]
    sleep 2
    play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
  end
end

# Divisor = 1.0
# Depth = 0 (beep) - use 30
# Use ex = 9
live_loop :fm_modulator_one do
  if ex != 9
    stop
  end
  
  use_synth_defaults divisor: 1.0, depth: 30, attack: 0, sustain: 0, release: 1
  
  play pool[0, 4]
  sleep 2
  play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
end

# Divisor = 1.7
# Depth = 80
# Use ex = 10
live_loop :fm_very_noisy do
  if ex != 10
    stop
  end
  
  use_synth_defaults divisor: 1.7, depth: 80, attack: 0, sustain: 0, release: 1
  
  play pool[0, 4]
  sleep 2
  play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
end

# Divisor = 2
# Depth = 3
# Use ex = 11
live_loop :fm_wahwah do
  if ex != 11
    stop
  end
  
  use_synth_defaults divisor: 2, depth: 3, attack: 0, sustain: 0, release: 1
  
  play pool[0, 4]
  sleep 2
  play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
end

# Divisor = 4
# Depth = 0.4
# Use depth between 0.1 and 4.0
# Use ex = 12
live_loop :fm_play_with_depth do
  if ex != 12
    stop
  end
  
  use_synth_defaults divisor: 4, depth: 30.4, attack: 0, sustain: 0, release: 1
  
  play pool[0, 4]
  sleep 2
  play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
end

# Divisor = 8
# Depth = 0.4
# Use ex = 13
live_loop :fm_play_with_divisor do
  if ex != 13
    stop
  end
  
  use_synth_defaults divisor: 8, depth: 0.4, attack: 0, sustain: 0, release: 1
  
  with_transpose +24 do
    play pool[0, 4]
    sleep 2
    play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
  end
end

# Divisor = 16
# Depth = 4
# Use ex = 14
live_loop :fm_spacy do
  if ex != 14
    stop
  end
  
  use_synth_defaults divisor: 16, depth: 4, attack: 0, sustain: 0, release: 1
  
  with_transpose +0 do
    play pool[0, 4]
    sleep 2
    play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
  end
end

# Divisor = 20
# Depth = 120
# Rithnm with background noise
# Use ex = 15
live_loop :fm_noisy_rythm do
  if ex != 15
    stop
  end
  
  use_synth_defaults divisor: 20, depth: 120, attack: 0, sustain: 0, release: 1
  
  with_transpose +0 do
    play pool[0, 4]
    sleep 2
    play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
  end
end

# Divisor = 40
# Depth = 0.2
# Interesting effect with high value of the divisor (e.g. 40) and low depth value
# Use ex = 16
live_loop :fm_strange_sounds do
  if ex != 16
    stop
  end
  
  use_synth_defaults divisor: 40, depth: 0.2, attack: 0, sustain: 0, release: 1
  
  with_transpose +0 do
    play pool[0, 4]
    sleep 2
    play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
  end
end

# Divisor = 70
# Depth = 0.5
# Whistling glissand (with a bit of attack)
# Use ex = 17
live_loop :fm_kontakte do
  if ex != 17
    stop
  end
  
  use_synth_defaults divisor: 70, depth: 0.5, attack: 0.5, sustain: 0, release: 1
  
  with_transpose +0 do
    play pool[0, 4]
    sleep 2
    play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
  end
end

# Divisor = 70
# Depth = 0.5
# Use ex = 18
live_loop :fm_kontakte_tief do
  if ex != 18
    stop
  end
  
  use_synth_defaults divisor: 70, depth: 0.5, attack: 0.5, sustain: 0, release: 1
  
  with_transpose -24 do
    play pool[0, 4]
    sleep 2
    play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
  end
end

# Divisor = 30
# Depth = 0.5
# Jungle
# Use ex = 19
live_loop :fm_rain_forest do
  if ex != 19
    stop
  end
  
  use_synth_defaults divisor: 30, depth: 0.5, attack: 1, sustain: 1, release: 1
  
  with_transpose 0 do
    play pool[0, 4]
    sleep 2
    play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
  end
end

# Divisor = 20
# Depth = 0.0
# Flute
# Use ex = 20
live_loop :fm_flute do
  if ex != 20
    stop
  end
  
  use_synth_defaults divisor: 10, depth: 0.0, attack: 0.1, sustain: 0.2, release: 0.1
  
  with_transpose 0 do
    play pool[0, 4]
    sleep 2
    play_pattern_timed(pool, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2])
  end
end