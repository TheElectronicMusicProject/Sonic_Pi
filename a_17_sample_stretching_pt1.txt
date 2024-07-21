# A.17 Sample Stretching

# rate option changes the pitch and the timing of the sample
# Doubling the rate, the pitch is an octave higher
# Halving the rate, the pitch is an octave lower

# rpitch changes the pitch by a semitone

sample :ambi_choir, rate: 0.25, rpitch: 3
sleep 3
sample :ambi_choir, rate: 0.25, rpitch: 5
sleep 2
sample :ambi_choir, rate: 0.25, rpitch: 6
sleep 1
sample :ambi_choir, rate: 0.25, rpitch: 1