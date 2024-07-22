# A.19 Sound Design - Subtractive Synthesis

define :subt_synth do |note, sus|
  # at waits for a given time_warp
  # The code in the block is executed in its own thread
  # It is a just-in-time scheduling using multiple isolated threads
  # To avoid an interference between the sleep calls in the function and the sleep calls outside, the at keyword permits parallelism
  at do
    with_fx :lpf, cutoff: 40, amp: 2 do |fx|
      control fx, cutoff_slide: 6, cutoff: 100
      synth :prophet, note: note, sustain: sus
    end
    
    with_fx :hpf, cutoff_slide: 0.01 do |fx|
      synth :dsaw, note: note + 12, sustain: sus
      
      (sus * 8).times do
        control fx, cutoff: rrand(70, 110)
        sleep 0.125
      end
    end
  end
end

live_loop :big_synth do
  subt_synth :e1, 8
  sleep 8
  subt_synth :e1 - 4, 8
  sleep 8
end