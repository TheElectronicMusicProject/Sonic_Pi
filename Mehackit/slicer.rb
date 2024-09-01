# Slicer

# The slicer effect adds "rhythmic and chops" to the music, altering the volume over time (amplitude modulation)
# phase: frequency of the amplitude modulation
# wave: waveform of the amplitude modulation (0 saw, 1 pulse, 2 triangle, 3 sinewave)

use_bpm 120

live_loop :breakbeat do
  with_fx :slicer, phase: 1.75, wave: 0, mix: 1.0 do
    sample :loop_breakbeat, beat_stretch: 16, amp: 1
    sleep 16
  end
end

live_loop :beep do
  with_fx :reverb, room: 0.9 do
    with_fx :slicer, phase: 1, wave: 1, mix: 1.0 do
      # Notes 61, 55, 58, 65
      synth :hoover, note: [:Db4, :G3, :Bb3, :F4].ring.tick, attack: 2, release: 4, amp: 0.5
      sleep 6
    end
  end
end

live_loop :kick do
  sample :bd_haus
  sleep 4
end