# 6.1 Adding FX

# Available FX:
# Band EQ Filter - band_eq
# Bitcrusher - bitcrusher
# Band Pass Filter - bpf
# Compressor - compressor
# Distortion - distortion
# Echo - echo
# Basic parametric EQ - eq
# Flager - flanger
# GVerb - gverb
# High Pass Filter - hpf
# Techno from IXI Lang - ixi_techno
# Krush - krush
# Level Amplifier - level
# Low Pass Filter - lpf
# Mono - mono
# Normalised Band Pass Filter - nbpf
# Normalised High Pass Filter - nhpf
# Normalised Low Pass Filter - nlpf
# Normaliser - normaliser
# Normalised Resonant Band Pass Filter - nrbpf
# Normalised Resonant High Pass Filter - nrhpf
# Normalised Resonant Low Pass Filter - nrlpf
# Octaver - octaver
# Pan - pan
# Pan Slicer - panslicer
# Pitch Shift - pitch_shift
# Resonant Band Pass Filter - rbpf
# Record - record
# Reverb - reverb
# Resonant High Pass Filter - rhpf
# Ring Modulator - ring_mod
# Resonant Low Pass Filter - rlpf
# Slicer - slicer
# Sound Out - sound_out
# Sound Out Stereo - sound_out_stereo
# Hyperbolic Tangent - tanh
# Tremolo - tremolo
# Vowel - vowel
# Whammy - whammy
# Wobble - wobble

loop do
  # Nesting FX
  with_fx :reverb do
    with_fx :echo, phase: 0.125, decay: 8 do
      play 50
      sleep 0.5
      sample :elec_plip
      sleep 0.5
      play 62
      sleep 0.5
    end
  end
  
  sleep 1
  play 55
  sleep 0.5
end