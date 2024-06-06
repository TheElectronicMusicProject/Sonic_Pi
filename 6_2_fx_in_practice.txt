# 6.2 FX in Practice

# Putting the loop inside the FX creates only a single reverb and avoid CPU usage.
# Another option is to repete the FX reps times, before creating a new one

loop do
  with_fx :reverb, reps: 16 do
    play 60, release: 0.1
    sleep 0.125
  end
end