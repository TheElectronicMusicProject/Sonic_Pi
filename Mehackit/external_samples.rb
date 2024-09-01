# External samples

# About 164 samples are available in Sonic Pi
# More samples can be added.
# Download the samples from Mehackit in the following folder:
#    /home/<user>/Music/sonic_pi_samples

use_bpm 110

sample_path = "/home/filippo/Musica/sonic_pi_samples/"
puts hit6_path = sample_path + "hit_6.wav"

live_loop :solenoid1 do
  sample sample_path, "loop_4", beat_stretch: 4, amp: 1
  sleep 4
end

live_loop :kick do
  sample :bd_haus, rate: 0.8, amp: 1
  sleep 1
end

live_loop :solenoid2 do
  samplename = ["hit_1", "hit_2", "hit_3", "hit_4", "hit_5", "hit_6", "hit_7"].choose
  time = [0.25, 0.5, 0.75].choose
  sample sample_path, samplename, amp: 0.75, rate: 2, pan: rrand(-0.8, 0.8)
  sleep time
end

with_fx :reverb do
  live_loop :solenoid3 do
    sleep 2
    sample hit6_path, rate: (ring 0.5, 0.55, 0.6, 0.65).tick, amp: 0.75
    sleep 2
  end
end