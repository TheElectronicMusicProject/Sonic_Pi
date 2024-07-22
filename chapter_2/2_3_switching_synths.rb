# 2.3 Switching Synths

# Sine wave - beep
# Blade Runner style - blade
# Brown Noise - for percussive sounds - bnoise
# Chip Bass - triangle wave - chipbass
# Chip Lead - pulse wave - chiplead
# Chip Noise - chipnoise
# Clip Noise - cnoise
# Dark Ambience - dark_ambience
# Detuned Pulse Wave - dpulse
# Detuned Saw Wave - dsaw
# Detuned Triangle Wave - dtri
# Dull Bell - dull_bell
# Basic FM synthesis - fm
# Grey Noise - gnoise
# Growl - growl
# Hollow - hollow
# Hoover - hoover
# Modulated Sine Wave - mod_beep
# Modulated Detuned Saw Wave - mod_saw
# Basic FM synthesis with frequency modulation - mod_fm
# Modulated Pulse - mod_pulse
# Modulated Saw Wave - mod_saw
# Modulated Sine Wave - mod_sine
# Modulated Triangle Wave - mod_tri
# Noise - noise
# SynthPiano - piano
# SynthPluck - pluck
# Pink Noise - pnoise
# Pretty Bell - pretty_bell
# The Prophet - prophet
# Pulse Wave - pulse
# Saw Wave - saw
# Sine Wave - sine
# Sound In - sound card input as synth - sound_in
# Sound In Stereo - stereo sound card input as synth - sound_in_stereo
# Square Wave - square
# Pulse Wave with Sub - subpulse
# Supersaw - supersaw
# TB-303 Emulation - tb303
# TechSaws - tech_saws
# Triangle Wave - tri
# Zawa - saw wave with oscillating timbre - zawa

loop do
  use_synth :zawa
  play 38
  sleep 0.25
  play 50
  sleep 0.25
  play 60
  sleep 0.5
end