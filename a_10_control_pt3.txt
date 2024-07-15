# A.10 Control

# The control is instantaneous, for a smooth move called _slide
# The next time, the synth has the cutoff option controlled
sn = synth :prophet, note: :e1, release: 8, cutoff: 70, cutoff_slide: 2
sleep 1
control sn, cutoff: 130