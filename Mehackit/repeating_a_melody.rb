# Repeating a melody

use_bpm 60

4.times do
  4.times do
    play :C4 # Note 60
    sleep 0.25
  end
  play :D4 # Note 62
  sleep 0.5
  play :F4 # Note 65
  sleep 0.5
end