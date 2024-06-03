# 3.4 Enveloped Samples

# ADSR envelopes can reduce the duration of a sample, but can't increase it
my_sample = :loop_amen
my_duration = sample_duration my_sample

# Attack for a fade in effect
# Default sustain is auto deducted from Sonic Pi
# Release fades out at the end of a sample
print my_duration
sample my_sample, attack: 0.3, release: my_duration/2

sleep my_duration

# It plays only the last 0.75 seconds
sample my_sample, sustain: 0, release: 0.75

sleep 0.75

# We can make the sounds more percussive
loop do
  sample :drum_cymbal_open, attack: 0.01, sustain: 0.01, release: 0.1
  sleep 0.2
end