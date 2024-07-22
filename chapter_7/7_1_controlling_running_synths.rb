# 7.1 Controlling Running Synths

# We can trigger one synth changing the pitch 3 times while it's playing
# All the ADSR paramters cannot be changed (see docs)
s = play 60, release: 5

sleep 0.5
control s, note: 65
sleep 0.5
control s, note: 67
sleep 3
control s, note: 72