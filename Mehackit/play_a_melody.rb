# Play a melody

use_bpm 120

# NOTE DURATION
# Whole note: 4 beats of duration
# Half note: 2 beats of duration
# 1/4th note: 1 beats of duration
# 1/8th note: 0.5 beat of duration
# 1/16th note: 0.25 beat of duration

# NOTE REST DURATION
# Whole note rest: 4 beats of duration
# Half note rest: 2 beats of duration
# 1/4th note rest: 1 beats of duration
# 1/8th note rest: 0.5 beat of duration
# 1/16th note rest: 0.25 beat of duration

# For a DO note, you can use MIDI notes (60) or musical notation (:C)

play 72 # Note :C5
sleep 0.25
play 76 # Note :E5
sleep 0.25
play 76 # Note :E5
sleep 0.25
play 72 # Note :C5
sleep 0.5
play 83 # Note :B5
sleep 0.25
play 74 # Note :D5
sleep 0.25
play 83 # Note :B5
sleep 0.25
play 79, amp: 0.5 # Note :G5
play 84, amp: 0.5 # Note :C6