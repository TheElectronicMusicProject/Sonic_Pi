# 3.2 Sample Parameters

my_sample = :ambi_lunar_land

# Settings of amplitude and panning
sample my_sample, amp: 0.5, pan: -1
sleep sample_duration(my_sample) / 2
sample my_sample, amp: 0.8, pan: 1