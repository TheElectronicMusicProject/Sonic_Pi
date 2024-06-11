# 7.3 Sliding Options

# Slide options with the Sine Wave:
# _slide: amount of beats for the parameter value to change
# _slide_shape: shape of curve (from 0 to 7)
# _slide_curve: shape of the slide curve

# The options ending with _slide will work to control synths and FX
s = play 60, release: 5, note_slide_curve: 0.2
sleep 0.5
control s, note: 65
sleep 0.5
control s, note: 67
sleep 3
# To remove the note_slide, it must be set to 0
control s, note: 72, note_slide: 0

with_fx :wobble, phase: 1, phase_slide: 5 do |e|
  use_synth :dsaw
  play 50, release:5
  control e, phase: 0.025
end