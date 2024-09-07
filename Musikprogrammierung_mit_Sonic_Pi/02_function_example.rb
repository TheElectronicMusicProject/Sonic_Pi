set_mixer_control! amp: 1
use_debug false
use_bpm 60

define :bass do
  # To execute the function multiple times without locking the next calls in the sleep,
  # the in_thread is used to create a new thread at every call
  in_thread do
    play :C3, release: 4
    sleep 4
  end
end

define :melody do
  in_thread do
    4.times do
      akkord = (ring :C, :E, :G, :B)
      play akkord.tick, release: 0.25
      sleep 1
    end
  end
end

puts "First song"
bass
melody
sleep 4

puts "Second song"
bass
melody