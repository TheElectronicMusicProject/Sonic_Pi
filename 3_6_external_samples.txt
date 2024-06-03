# 3.6 External Samples

# Raspberry Pi, Mac, Linux (the file must be present)
my_path = "/home/pi/Music/my-sound.wav"

loop do
  sample my_path, rate: 0.5, amp: 0.8, attack: 0.1, release: 0.8
  sleep sample_duration(my_path)*2
end