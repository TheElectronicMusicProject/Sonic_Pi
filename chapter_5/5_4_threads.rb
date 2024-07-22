# 5.4 Threads

# If we assign a name to every thread, pressing Run multiple times will avoid multiple layers

# The contents will be executed at the same time as the next statement
# A thread inherit the settings from the parent thread
in_thread do
  loop do
    sample :drum_heavy_kick
    sleep 1
  end
end

# Multiple threads are allowed
# The settings in a threads aren't propagated to others pieces of code
in_thread do
  loop do
    use_synth :fm
    play 40, release: 0.2
    sleep 0.5
  end
end

# We can assign a name to the thread
in_thread(name: :synth) do
  loop do
    use_synth :zawa
    play chord(:e2, :m7).choose, release: 2.5, phase: 2, amp: 0.5
    sleep 2
  end
end