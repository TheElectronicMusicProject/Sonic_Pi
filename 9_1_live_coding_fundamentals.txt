# 9.1 Live Coding Fundamentals

# How to simulate live coding without live loops!

# We modify the music by redefining the function outside the thread
define :my_loop do
  use_synth :tb303
  sample :drum_bass_hard, rate: rrand(0.5, 2)
  play choose(chord(:e3, :minor)), release: 0.3, amp: 0.5, cutoff: rrand(60, 130)
  sleep 0.25
end

# The thread is named, so only this thread is allowed with this name and no layers are added
in_thread(name: :looper) do
  loop do
    my_loop
  end
end