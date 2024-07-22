# 8.2 Chords

# Some examples of chords, whih is a list of notes
play chord(:E3, :minor)
sleep 1
play chord(:E3, :m7)
sleep 1
play chord(:E3, :dim7)
sleep 1
play chord(:E3, :dom7)
sleep 1

# Play a arpeggios, with a default sleep 1 timing between notes
play_pattern chord(:E3, :m7)
sleep 1

# It is better to specify the time
play_pattern_timed chord(:E3, :m7), 0.25
sleep 1

# Finally, a list of times can be passed which will alternate between notes
play_pattern_timed chord(:E3, :m7), [0.25, 0.5]