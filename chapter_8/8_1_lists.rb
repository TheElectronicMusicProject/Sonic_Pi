# 8.1 Lists

# This chord is E Minor in the 3rd octave
my_list = [52, 55, 59]
play my_list, amp: 0.5
puts my_list[1]
sleep 1
play [:E3, :G3, :B3]